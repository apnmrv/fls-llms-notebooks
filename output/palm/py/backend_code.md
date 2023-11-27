```python
# -*- coding: utf-8 -*-

from django.db import models


class Product(models.Model):
    """
    A model representing a product.

    Attributes:
        id (int): The primary key of the product.
        name (str): The name of the product.
        description (str): A detailed description of the product.
        price (float): The price of the product.
        image (str): The URL to an image of the product.
        quantity (int): The number of products in stock.
        category_id (int): The ID of the category to which the product belongs.
    """

    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    image = models.CharField(max_length=255)
    quantity = models.IntegerField()
    category_id = models.IntegerField()

    class Meta:
        db_table = "product"

    def __str__(self):
        return self.name


class ProductRepository(models.Manager):
    """
    A repository class for managing products.

    Methods:
        get_by_id(id): Gets a product by its ID.
        get_by_name(name): Gets a product by its name.
        get_all(): Gets all products.
        create(product): Creates a new product.
        update(product): Updates an existing product.
        delete(product): Deletes a product.
    """

    def get_by_id(self, id):
        """Gets a product by its ID."""
        return self.get(id=id)

    def get_by_name(self, name):
        """Gets a product by its name."""
        return self.filter(name=name).first()

    def get_all(self):
        """Gets all products."""
        return self.all()

    def create(self, product):
        """Creates a new product."""
        product.save()

    def update(self, product):
        """Updates an existing product."""
        product.save()

    def delete(self, product):
        """Deletes a product."""
        product.delete()


class ProductController(object):
    """
    A controller class for interacting with products.

    Methods:
        get_product(id): Gets a product by its ID.
        get_products(): Gets all products.
        create_product(product): Creates a new product.
        update_product(product): Updates an existing product.
        delete_product(product): Deletes a product.
    """

    def get_product(self, id):
        """Gets a product by its ID."""
        return ProductRepository.get_by_id(id)

    def get_products(self):
        """Gets all products."""
        return ProductRepository.get_all()

    def create_product(self, product):
        """Creates a new product."""
        return ProductRepository.create(product)

    def update_product(self, product):
        """Updates an existing product."""
        return ProductRepository.update(product)

    def delete_product(self, product):
        """Deletes a product."""
        return ProductRepository.delete(product)
```