# Gold Price in Rust Example Project   

The purpose of this project is to show how to run a Rust program on Gramine.
The program itself calls the goldapi.io/api/XAU/USD service to retrieve the 
current spot price of gold vs USD, and prints that to the console.

# Quick Start

1. Go to goldapi.io and get an API key
2. (from this project's root directory) Update src/main.rs with your API key
3. run ```make build``` and ```make manifest```
4. run ```gramine-direct gold_price_checker```

Note: SGX functionality has not yet been tested. 
