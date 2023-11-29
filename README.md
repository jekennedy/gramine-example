# Gramine Example Project - Get spot price of gold

The purpose of this project is to demonstrate how to run a Rust program on Gramine.
The program calls the goldapi.io/api/XAU/USD service to retrieve the 
current spot price of gold vs USD, and prints the result to the console.

# Quick Start

1. Get an API key from goldapi.io
2. Update src/main.rs with your API key
3. run ```make build``` and ```make manifest```
4. run ```gramine-direct gold_price_checker```

Note: SGX functionality has not yet been tested. 
