# Makefile for BastionRoute-MQTT

.PHONY: all deps build clean

# Output directory for compiled binaries
BIN_DIR := bin

all: deps build

deps:
	@echo "Resolving Go modules and downloading dependencies..."
	go mod download
	go mod tidy

build:
	@echo "Creating output directory..."
	mkdir -p $(BIN_DIR)
	
	@echo "Compiling BastionRoute MQTT..."
	go build -o $(BIN_DIR)/bastionroute-mqtt ./cmd/bastionroute-mqtt
	
	@echo "✅ Build complete! Binaries are located in the './$(BIN_DIR)' directory."

clean:
	@echo "Cleaning up binaries..."
	rm -rf $(BIN_DIR)
