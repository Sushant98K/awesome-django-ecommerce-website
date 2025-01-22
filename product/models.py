from django.db import models




class Category(models.Model):
    name = models.CharField(max_length=100)
    shortform = models.CharField(max_length=2)
    description = models.TextField()
    product_count = models.IntegerField(default=0)
    category_img = models.ImageField(upload_to='category')
    
    def __str__(self):
        return self.name


class Product(models.Model):
    pname = models.CharField(max_length=120)
    selling_price = models.FloatField()
    discounted_price = models.FloatField()
    description = models.TextField(default='')
    composition = models.TextField(default='')
    prodapp = models.TextField(default='')
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='products')  # Use ForeignKey instead of CharField
    product_img = models.ImageField(upload_to='product')
    
    
    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)  # Save the product
        self.category.product_count = self.category.products.count()  # Update product count
        self.category.save()

    def delete(self, *args, **kwargs):
        category = self.category  # Get the category before deleting
        super().delete(*args, **kwargs)  # Delete the product
        category.product_count = category.products.count()  # Update product count
        category.save()
    
    # you can coment below code after registering with list items in admin model.
    
    def __str__(self):
        return self.pname