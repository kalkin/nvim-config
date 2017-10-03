.DEFAULT_GOAL := about
XDG_CONFIG_HOME ?= $(HOME)/.config
TARGET_DIR 	= $(XDG_CONFIG_HOME)/nvim
VIM_FILES 	= $(wildcard *.vim) \
		  $(wildcard autoload/*.vim) \
		  $(wildcard ftdetect/*.vim) \
		  $(wildcard ftplugin/*.vim) \
		  $(wildcard plugin/*.vim) \
		  $(wildcard spell/*) \
		  $(wildcard syntax/*.vim)

TARGETS 	= $(addprefix $(TARGET_DIR)/,$(VIM_FILES)) $(HOME)/.vimrc


$(HOME)/.vimrc: vimrc
	install $< $@

$(TARGET_DIR)/%.vim: %.vim
	install -D $< $@

$(TARGET_DIR)/spell/%: spell/%
	install -D $< $@

install: $(TARGETS)
	python3 -c 'import yapf' || pip3 install yapf --user
	python3 -c 'import jedi' || pip3 install jedi --user
	python3 -c 'import vint' || pip3 install vim-vint --user
	python3 -c 'import proselint' || pip3 install proselint --user
	python3 -c 'import isort' || pip3 install isort --user
	python3 -c 'import yamllint' || pip3 install yamllint --user

about:
	@echo "Install with make install"
	@echo "Uninstall with make uninstall"

uninstall:
	rm $(TARGETS)
	rm -rf $(TARGET_DIR)/bundle

reinstall: uninstall install

clean:

