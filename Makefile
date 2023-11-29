# Makefile for Rust project with Gramine integration

.PHONY: all build manifest sign check clean distclean

# Default target
all: build manifest sign check

# Build the Rust project using Cargo
build:
	cargo build --release

# Generate the manifest file from a template
manifest: target/release/gold_price_checker gold_price_checker.manifest.template
	gramine-manifest -Dlog_level=error gold_price_checker.manifest.template gold_price_checker.manifest

# Sign the binary
sign: gold_price_checker.manifest
	gramine-sgx-sign --manifest $< --output $<.sgx

# Run the program using Gramine
check: all
	gramine-direct target/release/gold_price_checker

# Clean up build and generated files
clean:
	cargo clean
	$(RM) *.token *.sig *.manifest.sgx *.manifest

# Additional cleaning, if necessary
distclean: clean

