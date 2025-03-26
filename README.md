# Kantox Supermarket Checkout System

This is a Ruby-based supermarket checkout system that applies special pricing rules to products dynamically. The application follows **Test-Driven Development (TDD)** principles.

## Features

- Load product data from a CSV file.
- Scan and add items to the checkout bucket.
- Apply special pricing rules:
  - **Buy One Get One Free** for Green Tea (GR1).
  - **Bulk Discount** for Strawberries (SR1) when buying 3+.
  - **Discounted Pricing** for Coffee (CF1) when buying 3+.
- Display the total price based on selected rules.
- User-friendly input handling.

## Installation

1. Clone the repository:
   ```
   bash
   git clone https://github.com/Saad-Ishtiaq/Cashier_App.git
   cd Cashier_App 
   ```

2. Install Ruby (if not installed):
    ``` 
    sudo apt update
    sudo apt install ruby-full
    ```

3. Install Dependencies
    ``` 
    bundle install
    ```

4. Run the application:
    ``` 
    ruby main.rb
    ```
5. Follow the prompts:
  - Enter product codes separated by commas (e.g., GR1, SR1).
  - Choose applicable pricing rules. 
  - View the total price.

## Running Tests
To run individual test files, use:
```
ruby test/loaders/product_loader_test.rb
ruby test/services/user_input_test.rb
ruby test/checkout/checkout_test.rb
ruby test/checkout/**/*.rb

```

### License
This code belongs to Saad Ishtiaq. All rights reserved.😊
