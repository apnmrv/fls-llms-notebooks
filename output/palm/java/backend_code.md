```java
package com.onallfours.ecommerce.backend.repository;

import com.onallfours.ecommerce.backend.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

}
```

```java
package com.onallfours.ecommerce.backend.entity;

import lombok.Data;

@Data
public class Product {

    private Long id;
    private String name;
    private String description;
    private Double price;
    private String image;
    private Integer stock;

}
```

```java
package com.onallfours.ecommerce.backend.controller;

import com.onallfours.ecommerce.backend.entity.Product;
import com.onallfours.ecommerce.backend.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/products/{id}")
    public Product getProduct(@PathVariable Long id) {
        return productRepository.findById(id).orElseThrow();
    }

}
```

**Explanation of the logic**

The `ProductRepository` class extends the `JpaRepository` interface, which provides a number of methods for CRUD operations on entities. The `Product` class represents a product in the database. The `ProductController` class provides a RESTful API for interacting with products. The `getProduct` method retrieves a product by its ID.