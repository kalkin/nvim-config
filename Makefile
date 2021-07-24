.DEFAULT_GOAL ::= about
XDG_CONFIG_HOME ?= $(HOME)/.config
TARGET_DIR 	= $(XDG_CONFIG_HOME)/nvim
VIM_FILES 	= $(wildcard *.vim) \
			  $(wildcard *.lua) \
		  $(wildcard autoload/*.vim) \
		  $(wildcard autoload/*.lua) \
		  $(wildcard ftdetect/*.vim) \
		  $(wildcard ftdetect/*.lua) \
		  $(wildcard ftplugin/*.vim) \
		  $(wildcard ftplugin/*.lua) \
		  $(wildcard plugin/*.vim) \
		  $(wildcard plugin/*.lua) \
		  $(wildcard spell/*) \
		  $(wildcard syntax/*.vim) \
		  $(wildcard syntax/*.lua)

TARGETS 	= $(addprefix $(TARGET_DIR)/,$(VIM_FILES))


$(TARGET_DIR)/%.vim: %.vim
	install -Dt $(@D) $^

$(TARGET_DIR)/%.lua: %.lua
	install -Dt $(@D) $^

$(TARGET_DIR)/spell/%: spell/%
	install -Dt $(@D) $^


install: $(TARGETS)

about:
	@echo "Install with make install"
	@echo "Uninstall with make uninstall"

uninstall:
	rm $(TARGETS)
	rm -rf $(TARGET_DIR)/bundle

reinstall: uninstall install

clean:

