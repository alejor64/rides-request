# Rides request
The application is a simple Sinatra application that simulates adding a payment method and requesting a ride. It provides two endpoints—one for adding a card and another for requesting a ride.

## Requirements
Make sure you have a Ruby version greater than 2.7.8 installed on your system. You can check your Ruby version with the following command:
```bash
ruby -v
```

## Installation
1. Clone this repository:
  ```bash
    git clone https://github.com/alejor64/rides-request.git
  ```
2. Install the required gems:
  ```bash
    bundle install
  ```

## Configuration
Create a `.env` file in the project's root directory according to the `.env.template` dile

## Running
Start the application with:
  ```bash
    ruby server.rb
  ```
This will launch the Sinatra server, and you can access the application at http://localhost:4567.

## Usage
Card Endpoint:
* POST /add_card: Add a card. Example request:
    ```bash
      curl -X POST http://localhost:4567/add_card -H "Content-Type: application/json" -d '<BODY>'
    ```
Ride Endpoint:
* POST /request_ride: Request a ride. Example request:
    ```bash
      curl -X POST http://localhost:4567/request_ride -H "Content-Type: application/json" -d '<BODY>'
    ```

## Testing
Run tests with:
  ```bash
    bundle exec rspec
  ```

## Folder Structure
```
constrollers/
  ├── init.rb/
  ├── base_controller.rb/
domain/
  ├── card/
  │   ├── service/
  ├── ride/
  │   ├── service/
  ├── shared/
  │   ├── helpers/
spec/
  ├── constrollers
  │   ├── cards_controller_spec.rb
  │   ├── rides_controller_spec.rb
```