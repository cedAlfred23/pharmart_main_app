
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Main/order_page.dart';
import '../../Models/product_model.dart';


class DetailPage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final  product;
  const DetailPage({Key? key, required this.product}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
      elevation: 0,
      centerTitle: false,
      title:  Text(product[1], style: const TextStyle(color: Colors.black),),
      leadingWidth: 20,
      actions: [
      IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Cart()));
      }, 
      icon: const Icon(CupertinoIcons.cart, color: Colors.black,)),
      ],
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              //   child: Image.asset(product[2], height: 300, fit: BoxFit.cover,)),
      
      
      
      
      
    
      
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20), topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Container(
        color: Colors.amber,
        // height: 200,
        width: double.infinity,
        child: Image.asset(
          product[2], height: 400, fit: BoxFit.cover,),
          ),
        ),
      ),
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
                Column(
                  children: [
                    SizedBox(height: 20,),
                   
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                   Text('Product name: ', 
                                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500),),
                                  Text(product[1], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                ],
                              ),
                              const SizedBox( height: 10,),
                              Row(
                                 crossAxisAlignment: CrossAxisAlignment.end,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text('Price: GH₵ ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500)),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  Text(product[3].toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                ],
                              ),
                            const SizedBox( height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text('Laboratory', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500),),
                              Text(product[6])
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Active Substance', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500),),
                              Text(product[7])
                                ],
                              ),
                           
                            ],
                          ), 
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text('Left in store', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500),),
                          Text('${product[4]}')
                            ],
                          ),
                              ),
                            ],
                          ), 
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(product[5], style: const TextStyle(height: 1.5, color: Colors.grey, ),),
                          ),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Consumer<ProductModel>(builder: (context, value, child) {
                                  return Container(
                                  
                            color: Colors.blue,
                            child: TextButton(onPressed: (){
                              if(value.cartItems.contains(product)){
                                Provider.of<ProductModel>(context,listen: false).removeItemFromCart(product);
                                Provider.of<ProductModel>(context,listen: false).removeItemFromPriceCart(product);
                                print('hey');
                              }else{
                                print('no');
                                
                              }
                              Provider.of<ProductModel>(context,listen: false).addItemToCart(product);
                              Provider.of<ProductModel>(context,listen: false).addItemToPriceCart(product);
                              
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Success'),
                            content: const Text("The item has been added to the cart"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );   
                            }, child: Text('Add to cart'.toUpperCase(),style: const TextStyle(color: Colors.white),)),
                                );
                                },)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
      
      
      
      
                // DraggableScrollableSheet(
                //     initialChildSize: 0.5,
                //     maxChildSize: 0.6,
                //     minChildSize: 0.5,
                //     builder: ((context, scrollController) {
                //     return SingleChildScrollView(
                //       controller: scrollController,
                //       child: 
                //     );
                //   }
                //   )
                //   )
          ],
        ),
      )
    );
  }
}

