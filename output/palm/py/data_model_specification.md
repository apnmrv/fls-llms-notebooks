**Data Model Specification**

**Entities**

* **Product**
    * **Attributes:**
        * **name** (string)
        * **description** (string)
        * **price** (float)
        * **image** (string)
        * **quantity** (integer)
    * **Dependencies:**
        * **Category** (1:N)
        * **Order** (1:N)

* **Category**
    * **Attributes:**
        * **name** (string)
    * **Dependencies:**
        * **Product** (N:M)

* **Order**
    * **Attributes:**
        * **id** (integer)
        * **customer_id** (integer)
        * **status** (string)
        * **date_created** (datetime)
        * **date_shipped** (datetime)
    * **Dependencies:**
        * **Product** (1:N)
        * **Customer** (1:1)

* **Customer**
    * **Attributes:**
        * **id** (integer)
        * **first_name** (string)
        * **last_name** (string)
        * **email** (string)
        * **password** (string)
    * **Dependencies:**
        * **Order** (1:N)

**Attributes**

* **name** (string)
    * A unique name for the entity.
* **description** (string)
    * A detailed description of the entity.
* **price** (float)
    * The price of the entity.
* **image** (string)
    * A URL to an image of the entity.
* **quantity** (integer)
    * The number of entities in stock.
* **id** (integer)
    * A unique identifier for the entity.
* **customer_id** (integer)
    * The ID of the customer who placed the order.
* **status** (string)
    * The status of the order (e.g., "pending", "processing", "shipped").
* **date_created** (datetime)
    * The date and time the order was created.
* **date_shipped** (datetime)
    * The date and time the order was shipped.
* **first_name** (string)
    * The first name of the customer.
* **last_name** (string)
    * The last name of the customer.
* **email** (string)
    * The email address of the customer.
* **password** (string)
    * The password of the customer.

**Dependencies**

* **Category** (1:N)
    * A product can belong to one or more categories.
* **Product** (1:N)
    * An order can contain one or more products.
* **Customer** (1:1)
    * An order can only be placed by one customer.