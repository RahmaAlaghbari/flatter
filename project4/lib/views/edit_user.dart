import 'package:flutter/material.dart';
import '../repository/user_repo.dart';


class UserUpdate extends StatefulWidget {
  final int userId;

  UserUpdate({required this.userId});

  @override
  _UserUpdate createState() => _UserUpdate();
}

class _UserUpdate extends State<UserUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _productRepository = UserRepository();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();
  TextEditingController _imgController = TextEditingController();

  bool isError = false;
  String errorMsg = "";

  @override
  void initState() {
    super.initState();
    // Load the Product data by ID when the page is initialized
    _loadProduct();
  }

  void _loadProduct() async {
    try {
      // Retrieve the Product by ID
      ProductModel? product =
      await _productRepository.getById(widget.productId);
      if (product != null) {
        _nameController.text = product.name!;
        _priceController.text = product.price.toString();
        _detailsController.text = product.details!;
        _imgController.text = product.img!;
      }
    } catch (e) {
      // Handle any errors
      print('Error loading Product: $e');
    }
  }

  void _updateProduct() async {
    if (_formKey.currentState!.validate()) {
      // Create a ProductModel object with the updated data
      ProductModel updatedProduct = ProductModel(
        id: widget.productId,
        name: _nameController.text,
        price: double.tryParse(_priceController.text) ?? 0.0,
        details: _detailsController.text,
        img: _imgController.text,
      );

      try {
        // Update the Product
        int rowsAffected = await _productRepository.update(updatedProduct);
        if (rowsAffected > 0) {
          // Product updated successfully
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Product updated successfully')),
          );
          Navigator.of(context).pop(true);
        } else if (rowsAffected == -1) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Product name already exists')),
          );
        } else {
          // Failed to update Product
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to update Product')),
          );
        }
      } catch (e) {
        // Handle any errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating Product')),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _detailsController.dispose();
    _priceController.dispose();
    _imgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a price';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Invalid price. Please enter a valid number.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _detailsController,
                    decoration: InputDecoration(labelText: 'Details'),
                  ),
                  TextFormField(
                    controller: _imgController,
                    decoration: InputDecoration(labelText: 'Image'),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _updateProduct,
                    child: Text('Update'),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
