
.PHONY: all build fmt lint test docs build-iso build-rom clean

# Variables
GO_VERSION := 1.24.4
PYTHON_VERSION := 3.10
NODE_VERSION := lts/*
MKDOCS_VERSION := >=1.4
MKDOCS_MATERIAL_VERSION := 10.x

# Default target
all: build

# Build all components
build:
	@echo "Building Infini-X components..."
	$(MAKE) build-go
	$(MAKE) build-web

# Build Go modules
build-go:
	@echo "Building Infini-X Go modules..."
	go work sync
	go build -v ./...

# Build Web Application
build-web:
	@echo "Building Infini-X Web Application..."
	npm install --prefix web # Ensure web dependencies are installed
	npm run build --prefix web

# Format code
fmt:
	@echo "Formatting Go code..."
	go fmt ./...
	@echo "Formatting Python code..."
	python${PYTHON_VERSION} -m pip install black # Ensure black is installed
	python${PYTHON_VERSION} -m black assistant/
	@echo "Formatting JavaScript/TypeScript code (web)..."
	npm install --prefix web # Ensure web dependencies are installed
	npm run prettier --prefix web -- --write .

# Lint code
lint:
	@echo "Linting Go code..."
	go vet ./...
	# Add golangci-lint if installed: golangci-lint run
	@echo "Linting Python code..."
	python${PYTHON_VERSION} -m pip install flake8 # Ensure flake8 is installed
	python${PYTHON_VERSION} -m flake8 assistant/
	@echo "Linting Shell scripts..."
	# Add shellcheck if installed: shellcheck scripts/*.sh dotfiles/scripts/*.sh build-rom/*.sh
	@echo "Linting JavaScript/TypeScript code (web)..."
	npm install --prefix web # Ensure web dependencies are installed
	npm run lint --prefix web

# Run tests
test:
	@echo "Running Go tests..."
	go test -v ./...
	@echo "Running Python tests (conceptual)..."
	# python${PYTHON_VERSION} -m pytest assistant/
	@echo "Running Web tests (conceptual)..."
	# npm test --prefix web

# Build documentation with MkDocs
docs:
	@echo "Building documentation with MkDocs Material..."
	python${PYTHON_VERSION} -m pip install mkdocs"${MKDOCS_VERSION}" mkdocs-material"${MKDOCS_MATERIAL_VERSION}" mkdocs-awesome-pages-plugin
	mkdocs build

# Build ArchISO
build-iso:
	@echo "Building custom ArchISO..."
	@echo "This requires `archiso` to be installed on your system."
	@echo "Refer to build-iso/README.md for detailed instructions."
	sudo mkarchiso -v -o build-iso/output build-iso/profile

# Build Android GSI ROM
build-rom:
	@echo "Building Android GSI ROM..."
	@echo "This requires debootstrap, e2fsprogs, lzip, and android-gsi-tools."
	@echo "Refer to build-rom/README.md for detailed instructions."
	./build-rom/make_gsi.sh
	./build-rom/convert_to_img.sh

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	go clean -cache -modcache -testcache
	rm -rf docs/site
	rm -rf web/build
	rm -rf build-iso/output
	rm -rf build-rom/gsi_rootfs
	rm -rf build-rom/*.img
	@echo "Clean complete."
