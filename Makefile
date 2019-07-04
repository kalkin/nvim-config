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

about:
	@echo "Install with make install"
	@echo "Uninstall with make uninstall"

uninstall:
	rm $(TARGETS)
	rm -rf $(TARGET_DIR)/bundle

reinstall: uninstall install

clean:

