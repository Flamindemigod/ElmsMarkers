NAME = ElmsMarkers
ADDON_FOLDER = ~/LAtlas/eso/ESO/live/AddOns
LUA_FORMAT = lua-format
SRC_DIR = . # Directory containing Lua files
LUA_FILES = $(shell find $(SRC_DIR) -name "*.lua")
ADDON_PATH = $(shell pwd)

all: clean format zip

clean:
	@echo "Removing Build Artifacts"
	-rm $(NAME).zip
	@echo "Done"

# Format all Lua files
format:
	@echo "Formatting Lua files..."
	@for file in $(LUA_FILES); do \
		echo "Formatting $$file"; \
		$(LUA_FORMAT) -i $$file; \
	done
	@echo "Done."

zip:
	@echo "Exporting Addon"
	git archive HEAD --prefix=$(NAME)/ --format=zip -o $(NAME).zip
	@echo "Done."

link: link-clean link-set

link-clean:
	@echo "Removing $(NAME) from $(ADDON_FOLDER)"
	-rm  $(ADDON_FOLDER)/$(NAME)
	@echo "Removed Link"

link-set:
	@echo "Linking $(NAME) into $(ADDON_FOLDER)"
	ln -s $(ADDON_PATH) $(ADDON_FOLDER)/.
	@echo "Done Linking"
