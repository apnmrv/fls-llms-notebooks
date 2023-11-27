Given the project specification, the chosen SQL dialect will be MongoDB as it is a document-oriented database which aligns with the data model specification provided. Here is the DDL script:

```sql
-- User Collection
db.createCollection("user", {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         required: [ "user_id", "username", "password", "email", "address" ],
         properties: {
            user_id: {
               bsonType: "string",
               description: "Unique identifier for each user. This will be the primary key for the User entity."
            },
            username: {
               bsonType: "string",
               description: "Name chosen by the user for login."
            },
            password: {
               bsonType: "string",
               description: "Password chosen by the user for login."
            },
            email: {
               bsonType: "string",
               description: "Email address of the user."
            },
            address: {
               bsonType: "string",
               description: "Address of the user for delivery."
            }
         }
      }
   }
})

-- Product Collection
db.createCollection("product", {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         required: [ "product_id", "name", "description", "price", "stock" ],
         properties: {
            product_id: {
               bsonType: "string",
               description: "Unique identifier for each product. This will be the primary key for the Product entity."
            },
            name: {
               bsonType: "string",
               description: "Name of the product."
            },
            description: {
               bsonType: "string",
               description: "Description of the product."
            },
            price: {
               bsonType: "number",
               description: "Price of the product."
            },
            stock: {
               bsonType: "number",
               description: "Number of items in stock."
            }
         }
      }
   }
})

-- Order Collection
db.createCollection("order", {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         required: [ "order_id", "user_id", "product_id", "quantity", "order_date" ],
         properties: {
            order_id: {
               bsonType: "string",
               description: "Unique identifier for each order. This will be the primary key for the Order entity."
            },
            user_id: {
               bsonType: "string",
               description: "Identifier of the user who placed the order."
            },
            product_id: {
               bsonType: "string",
               description: "Identifier of the product ordered."
            },
            quantity: {
               bsonType: "number",
               description: "Quantity of the product ordered."
            },
            order_date: {
               bsonType: "date",
               description: "Date when the order was placed."
            }
         }
      }
   }
})

-- Review Collection
db.createCollection("review", {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         required: [ "review_id", "user_id", "product_id", "rating", "comment" ],
         properties: {
            review_id: {
               bsonType: "string",
               description: "Unique identifier for each review. This will be the primary key for the Review entity."
            },
            user_id: {
               bsonType: "string",
               description: "Identifier of the user who gave the review."
            },
            product_id: {
               bsonType: "string",
               description: "Identifier of the product reviewed."
            },
            rating: {
               bsonType: "number",
               description: "Rating given by the user."
            },
            comment: {
               bsonType: "string",
               description: "Comment given by the user."
            }
         }
      }
   }
})
```

This script creates four collections: `user`, `product`, `order`, and `review`. Each collection has a validator that enforces the data model specification. The `bsonType` corresponds to the data type of each attribute. The `description` provides an explanation of each attribute.