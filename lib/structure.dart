import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:intl/intl.dart';
import 'product_file.dart';
import 'dailog_box.dart';

class Structure extends StatefulWidget {
  const Structure({Key? key}) : super(key: key);

  @override
  State<Structure> createState() => _StructureState();
}


class _StructureState extends State<Structure> {
  



  List<ProductFile> productFile = [];

  late double total;


  String calculatAmount(ProductFile p){
    total = p.amount * p.quantity;
    return total.toString();
  }

  void displayDialog() {
    showDialog(context: context, builder: (context){
      return ProductOption(onAddCart: AddCart,);
    });
  }

  void AddCart(ProductFile addToCart) {
         setState(() {
           productFile.add(addToCart);
         });
  }

 String imagePath(String product) {

    if(product.toLowerCase() == 'shoe'){
      return 'images/shoe.png';
    } else if(product.toLowerCase() == 'shirt'){
      return 'images/shirt2.png';
    } else if(product.toLowerCase() == 'bag'){
      return 'images/bag2.png';
    } else {
      return '';
    }

  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffe0c067),
          elevation: 0,
          title: const Center(
              child:  Text('Market List'),),
        ),
        body: SafeArea(
          child: productFile.isEmpty ? const Center(child:  Text("No items at the moment",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          )
          )) : ListView.builder(

            itemBuilder: (context, index){
            return Container(
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                 tileColor: const Color(0xffc1d9c7),
                   leading:  Image(image: AssetImage(imagePath(productFile[index].product)),),
                   
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      productFile[index].product,
                      style: kProductStyle,
                    ),
                  ),

                  subtitle: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productFile[index].amount.toString(),
                        style: kAmountStyle,
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  productFile[index].quantity--;
                                });

                              },
                              child: const CircleAvatar(
                                radius: 12,
                                child: Center(child: Icon(Icons.remove))
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Text(productFile[index].quantity.toString(),
                            style: kProductQuantity,
                            ),
                            const SizedBox(width: 8.0),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  productFile[index].quantity++;
                                });

                              },
                              child:   const CircleAvatar(
                                radius: 12,
                                child: Center(child: Icon(Icons.add))
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(calculatAmount(productFile[index]),
                    style: kTotalStyle,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: productFile.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          displayDialog();
        },
        child: const Text('Add')
        ),
      ),
    );
  }
}

