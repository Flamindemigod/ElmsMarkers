LUA_FORMAT = lua-format
SRC_DIR = . # Directory containing Lua files
LUA_FILES = $(shell find $(SRC_DIR) -name "*.lua")
all: format zip

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
	git archive HEAD --prefix=ElmsMarkers/ --format=zip -o ElmsMarkers.zip
	@echo "Done."
