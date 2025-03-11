# Use PHONY to prevent conflicts with real files
.PHONY: build_gen clean_get sort_imports

# Run build_runner
build_gen:
	@echo "🚀 Running Dart build_runner..."
	@flutter pub run build_runner build --delete-conflicting-outputs

# Clean project and fetch dependencies
clean_get:
	@echo "🧹 Cleaning Flutter project and fetching dependencies..."
	@flutter clean && flutter pub get

# Sort Dart imports in lib/ and test/ folders
sort_imports:
	@echo "🔄 Sorting imports in lib/ and test/ folders..."
	@dart run import_sorter:main lib/** test/**