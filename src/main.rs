use reqwest;
use serde_json::Value;
use tokio;

#[tokio::main]
async fn main() {
    match get_gold_price().await {
        Ok(price) => println!("Gold price: {}", price),
        Err(e) => eprintln!("Error occurred: {}", e),
    }
}

async fn get_gold_price() -> Result<f64, Box<dyn std::error::Error>> {
    let url = "https://www.goldapi.io/api/XAU/USD";
    let api_token = "YOUR_API_KEY"; // Replace with your actual API token

    let client = reqwest::Client::new();
    let response = client
        .get(url)
        .header("x-access-token", api_token)
        .send()
        .await?
        .json::<Value>()
        .await?;

    response["price"]
        .as_f64()
        .ok_or_else(|| "Failed to parse 'price' field as f64".into())
}


