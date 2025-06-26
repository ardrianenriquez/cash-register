## Setup
### Install gems
```
bundle install
```
### Setup database
```
rails db:create 
rails db:migrate 
rails db:seed
```
### Start the server
```
rails server
```
### Once the server is running, open your browser and go to:
```
http://localhost:3000
```
***Note: This will load the basic UI where you can test the cart functionality.***

### Using the Minimal UI
The interface provides the following features:
- New Cart: Generates a new cart with a unique ID.
- Add Green Tea / Strawberry / Coffee: Adds the selected product to the active cart.
- The cart contents and total price are displayed below the buttons and update in real-time.

***Note: You must create a cart first before adding items.***

## RSpec Testing
Run all tests:
```
rspec
```
## API Testing via Postman
You can also test the endpoints using the included Postman collection:
```
postman_collection/Cash register.postman_collection.json
```
Import this file into Postman to test:
- Creating a cart
- Adding items
- Viewing cart totals

## Future Enhancements
### Admin Page for Promotions
- Create, update, or delete promotions via a simple HTML interface
- Toggle promotions on/off without touching the database

This will allow non-technical users or testers to manage pricing rules without editing code or using Postman.