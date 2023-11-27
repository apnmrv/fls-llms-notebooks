# Data Model Specification for E-commerce Website

## Entities

1. **User**
    - Data Type: Object
    - Comment: This entity will store all the information related to the user.

2. **Product**
    - Data Type: Object
    - Comment: This entity will store all the information related to the products.

3. **Order**
    - Data Type: Object
    - Comment: This entity will store all the information related to the orders.

4. **Review**
    - Data Type: Object
    - Comment: This entity will store all the information related to the product reviews.

5. **Wishlist**
    - Data Type: Object
    - Comment: This entity will store all the information related to the user's wishlist.

## Attributes

### User
- **userId** (Primary Key)
    - Data Type: Integer
    - Comment: Unique identifier for each user.
- **username**
    - Data Type: String
    - Comment: Username of the user.
- **password**
    - Data Type: String
    - Comment: Password for the user account.
- **email**
    - Data Type: String
    - Comment: Email of the user.

### Product
- **productId** (Primary Key)
    - Data Type: Integer
    - Comment: Unique identifier for each product.
- **productName**
    - Data Type: String
    - Comment: Name of the product.
- **productDescription**
    - Data Type: String
    - Comment: Description of the product.
- **productPrice**
    - Data Type: Float
    - Comment: Price of the product.

### Order
- **orderId** (Primary Key)
    - Data Type: Integer
    - Comment: Unique identifier for each order.
- **userId** (Foreign Key)
    - Data Type: Integer
    - Comment: Identifier for the user who placed the order.
- **productId** (Foreign Key)
    - Data Type: Integer
    - Comment: Identifier for the product ordered.
- **orderStatus**
    - Data Type: String
    - Comment: Status of the order.

### Review
- **reviewId** (Primary Key)
    - Data Type: Integer
    - Comment: Unique identifier for each review.
- **userId** (Foreign Key)
    - Data Type: Integer
    - Comment: Identifier for the user who wrote the review.
- **productId** (Foreign Key)
    - Data Type: Integer
    - Comment: Identifier for the product reviewed.
- **reviewText**
    - Data Type: String
    - Comment: Text of the review.

### Wishlist
- **wishlistId** (Primary Key)
    - Data Type: Integer
    - Comment: Unique identifier for each wishlist.
- **userId** (Foreign Key)
    - Data Type: Integer
    - Comment: Identifier for the user who owns the wishlist.
- **productId** (Foreign Key)
    - Data Type: Integer
    - Comment: Identifier for the product in the wishlist.

## Dependencies

- **User** and **Order**: One-to-many relationship. One user can place multiple orders.
- **User** and **Review**: One-to-many relationship. One user can write multiple reviews.
- **User** and **Wishlist**: One-to-one relationship. One user can have one wishlist.
- **Product** and **Order**: One-to-many relationship. One product can be in multiple orders.
- **Product** and **Review**: One-to-many relationship. One product can have multiple reviews.
- **Product** and **Wishlist**: One-to-many relationship. One product can be in multiple wishlists.