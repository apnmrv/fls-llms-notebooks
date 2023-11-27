**Data Model Specification**

**Entities**

* **Product**
    * **Data type:** table
    * **Attributes:**
        * **id:** integer, primary key
        * **name:** varchar(255), not null
        * **description:** text, not null
        * **price:** decimal(10, 2), not null
        * **image:** varchar(255), not null
        * **stock:** integer, not null
    * **Dependencies:**
        * * * *

* **Category**
    * **Data type:** table
    * **Attributes:**
        * **id:** integer, primary key
        * **name:** varchar(255), not null
    * **Dependencies:**
        * * * *

* **Customer**
    * **Data type:** table
    * **Attributes:**
        * **id:** integer, primary key
        * **email:** varchar(255), not null, unique
        * **password:** varchar(255), not null
        * **first_name:** varchar(255), not null
        * **last_name:** varchar(255), not null
        * **address:** varchar(255), not null
        * **phone_number:** varchar(255), not null
    * **Dependencies:**
        * * * *

* **Order**
    * **Data type:** table
    * **Attributes:**
        * **id:** integer, primary key
        * **customer_id:** integer, foreign key to customer(id)
        * **order_date:** timestamp, not null
        * **total_price:** decimal(10, 2), not null
    * **Dependencies:**
        * **customer**

* **OrderItem**
    * **Data type:** table
    * **Attributes:**
        * **id:** integer, primary key
        * **order_id:** integer, foreign key to order(id)
        * **product_id:** integer, foreign key to product(id)
        * **quantity:** integer, not null
    * **Dependencies:**
        * **order**
        * **product**

**Attributes**

* **id:** integer, primary key
* **name:** varchar(255), not null
* **description:** text, not null
* **price:** decimal(10, 2), not null
* **image:** varchar(255), not null
* **stock:** integer, not null
* **email:** varchar(255), not null, unique
* **password:** varchar(255), not null
* **first_name:** varchar(255), not null
* **last_name:** varchar(255), not null
* **address:** varchar(255), not null
* **phone_number:** varchar(255), not null
* **order_date:** timestamp, not null
* **total_price:** decimal(10, 2), not null
* **quantity:** integer, not null

**Dependencies**

* **Product** -> **Category** (many-to-one)
* **Order** -> **Customer** (one-to-one)
* **Order** -> **OrderItem** (one-to-many)
* **OrderItem** -> **Product** (one-to-many)