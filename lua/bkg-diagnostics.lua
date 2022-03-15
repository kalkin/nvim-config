local fmt = string.format

local null_ls = require("null-ls")
local log = require("null-ls.logger")

local Job = require("plenary.job")
local Path = require("plenary.path")

local CARGO_LEVEL_TO_SEVERITY = {
	warning = vim.diagnostic.severity.WARN,
	error = vim.diagnostic.severity.ERROR,
}

local function cargo_project_root(params)
	local path = Path:new(params.bufname)
	local parent_dir = path:parents()[1]
	local job = Job:new({
		command = "/usr/bin/cargo",
		args = { "locate-project", "--workspace", "--message-format=plain", "--quiet" },
		cwd = parent_dir,
	})
	local line = job:sync()[1]
	log:debug("Cargo Manifest location: " .. line)
	local cargo_toml = Path:new(line)
	local cwd = cargo_toml:parents()[1]
	log:debug("Cargo Project Root: " .. cwd)
	return cwd
end

local function cargo_on_output(params, done)
	local IGNORED_MESSAGES = { "compiler-artifact", "build-script-executed", "build-finished" }
	local function parse_output(output)
		log:trace("OUTPUT: " .. vim.inspect(output))
		local result = {}
		for line in output:gmatch("[^\r\n]+") do
			local ok, decoded = pcall(vim.json.decode, line)
			if decoded == vim.NIL or decoded == "" then
				decoded = nil
			end

			if not ok then
				local error_message = "failed to decode json: " .. decoded
				error(error_message)
			elseif decoded == nil or decoded == "" then
				local error_message = "Unexpected: “" .. decoded .. "”"
				error(error_message)
			elseif vim.tbl_contains(IGNORED_MESSAGES, decoded.reason) then
				log:debug("Skipping: " .. decoded.reason)
			elseif not vim.tbl_contains(vim.tbl_keys(CARGO_LEVEL_TO_SEVERITY), decoded.message.level) then
				error("Unexpected message level: " .. decoded.message.level)
			elseif decoded.reason ~= "compiler-message" then
				error("Unexpected reason: " .. decoded.reason)
			elseif decoded.message.code == vim.NIL then
				log:debug("No message code set for reason: " .. decoded.reason)
			else
				table.insert(result, decoded)
			end
		end
		return result
	end

	local messages = parse_output(params.output)
	local diagnostics = {}
	for _, decoded in pairs(messages) do
		local msg = decoded.message
		local code = decoded.message.code.code
		local filename = Path:new(params.cwd):joinpath(msg.spans[1].file_name).filename
		local severity = nil
		if vim.tbl_contains(vim.tbl_keys(CARGO_LEVEL_TO_SEVERITY), msg.level) then
			severity = CARGO_LEVEL_TO_SEVERITY[msg.level]
		end
		log:info(msg.level .. "[" .. code .. "]: " .. msg.message)
		table.insert(diagnostics, {
			row = msg.spans[1].line_start,
			col = msg.spans[1].column_start,
			code = code,
			end_row = msg.spans[1].line_end,
			end_col = msg.spans[1].column_end,
			message = msg.message,
			source = "clippy",
			severity = severity,
			filename = filename,
		})
	end
	log:debug(vim.inspect(diagnostics))
	log:info(fmt("Found %d messages", vim.tbl_count(diagnostics)))
	done(diagnostics)
end

return {
	clippy = {
		name = "cargo",
		method = null_ls.methods.DIAGNOSTICS,
		filetypes = { "rust" },
		generator = null_ls.generator({
			command = "cargo",
			args = { "--frozen", "clippy", "--message-format=json", "--quiet" },
			format = "raw",
			multiple_files = true,
			cwd = cargo_project_root,
			on_output = cargo_on_output,
		}),
	},
}
