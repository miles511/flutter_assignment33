import 'package:assignment3/product_file.dart';
import 'package:flutter/material.dart';

class ProductOption extends StatefulWidget {
  const ProductOption({Key? key, required this.onAddCart}) : super(key: key);

  final void Function(ProductFile addToCart) onAddCart;

  @override
  State<ProductOption> createState() => _ProductOptionState();
}

class _ProductOptionState extends State<ProductOption> {

  final productController = TextEditingController();
  final quantityController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Choose your product'),
      content: Container(
        height: 200.0,
        child: Column(
          children: [
             TextField(
              controller: productController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.production_quantity_limits),
              hintText: 'Select Product'
            ),
             ),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Quantity',
              ),
            ),
             TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Amount',
              ),
            ),
            TextButton(onPressed: (){
               final updateCart = ProductFile(
                   product: productController.text,
                   amount: double.parse(amountController.text),
                   quantity: int.parse(quantityController.text),
               );

                widget.onAddCart(updateCart);
                  Navigator.of(context) .pop();

            },

              child: Container(
              height: 30.0,
                width: 110.0,
                color: Colors.blue,
                child: Center(
                  child: const Text('Add to Cart',
               style: TextStyle(
                   color: Colors.white,
               )
                  ),
                ),),),
          ],
        ),
      ),
    );
  }
}

