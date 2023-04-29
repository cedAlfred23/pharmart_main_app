import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';
import 'package:pharmart/Screens/pharmacy_products/Models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import '../../Widgets/order_tile.dart';
import 'package:http/http.dart' as http;


class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String _name = '';
String _mail = '';
String _phoneNumber = '';
List order = [];
 credentials () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? mail = prefs.getString('mail').toString();
    String? phoneNumber = prefs.getString('phoneNumber').toString();
    String? name = prefs.getString('user').toString();
                setState(() {
                  _name = name;
                  _mail = mail;
                  _phoneNumber = phoneNumber;
                });
                return Future.value();
              }


                      
                    

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    credentials();
  }

  @override
  Widget build(BuildContext context){
    return Consumer<ProductModel>(builder:(context, value, child) {
      double totalPrice = value.calculateTotal() + 10;
      print(totalPrice);
      print('this is the price cart: ');
      print(value.priceCart);
      print(' this is the simple cart: ');
      print(value.cartItems);
      
      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      title: const Text('Cart', style: TextStyle(color: Colors.black),),
      leadingWidth: 20,
      actions: [
      IconButton(onPressed: (){
        Provider.of<ProductModel>(context,listen: false).removeAllItems();
        Provider.of<ProductModel>(context,listen: false).removeAllItemsFromPriceCart();
        value.cartItems;
      }, 
      icon: const Icon(CupertinoIcons.cart_badge_minus, color: Colors.black,)),
      ],
    ),
      body: Consumer<ProductModel>(builder: ((context, value, child) {
        // print(value.calculateTotal());
        return value.cartItems.isEmpty ? 
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text('No items', style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25, color: Colors.grey.shade500),),
        )
        : Column(
          children: [
            Expanded(
              child: ListView.builder(
              itemCount: value.cartItems.length,
              itemBuilder: ((context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    dragDismissible: false,
                    extentRatio: 0.5,
                    motion: const StretchMotion(), 
                    children: [
                    SlidableAction(
                      onPressed: ((context){
                        Provider.of<ProductModel>(context,listen: false).removeAt(index);
                        Provider.of<ProductModel>(context,listen: false).removeAtPriceCart(index);
                      }), 
                      icon: Icons.delete, 
                      backgroundColor: Colors.red,)
                  ]),
                  child: OrderTile(
                  index: value.cartItems[index],
                  image: value.cartItems[index][2],
                  subtitle: value.cartItems[index][1], 
                  price: value.cartItems[index][3].toString(),),
                );
              }))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text('Order Info', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
                    ),
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal', style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20)),
                    Text(
                      value.calculateTotal().toString(), style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Shipping Cost', style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20)),
                    const Text('10.00', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                    Text('$totalPrice', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15))
                  ],
                ),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Success'),
                            content: const Text("The order has been sent"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );  
  String auth = "chatappauthkey231r4";
   IOWebSocketChannel channel;
    try {
      // Create connection.
      channel = IOWebSocketChannel.connect('ws://localhost:3000/order');
    } catch (e) {
      print("Error on connecting to websocket: $e"
      );
      return;
    }
    // Data that will be sent to Node.js
String cmd = "order";
List<String> orderItems = [];

for(int i=0; i<value.priceCart.length; i++){
  String items = value.priceCart[i][1];
  orderItems.add(items);
}

Map<String, dynamic> body = {
  "name": _name,
  "phoneNumber": _phoneNumber,
  "items": orderItems,
  "totalPrice": totalPrice
};

String bodyJson = jsonEncode(body);
String healthData = '{"auth":"$auth", "cmd":"$cmd", "body":$bodyJson}';

    // Send data to Node.js
    channel.sink.add(healthData);
  channel.stream.listen(
    (event) async {
      event = event.replaceAll(RegExp("'"), '"');
      var healthTipData = json.decode(event);
      print(healthTipData);
    });




                    },
                    child: Container(
                        padding: const EdgeInsets.all(30),
                        width: MediaQuery.of(context).size.width*0.5,
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('ORDER NOW', style: TextStyle(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold ),),
                            // Text(
                            //   '$totalPrice'
                            // , style: const TextStyle(color: Colors.amber),)
                          ],
                        ),
                      ),
                  ),
                  GestureDetector(
                    onTap: () {
                      try{
                        PayWithPayStack().now(
                          context: context,
                          secretKey:
                              "sk_test_54cfd1274ba762e5a30428507e2702d374d75472",
                          customerEmail: _mail,
                          reference: "",
                          currency: "GHS",
                          amount: '${totalPrice*100}',
                          transactionCompleted: () {
                            print("Transaction Successful");
                          },
                          transactionNotCompleted: () {
                            print("Transaction Not Successful!");
                          });
                      }catch(e){
                        print(e);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width*0.5,
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('PAY NOW', style: TextStyle(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold ),),
                          // Text(
                          //   '$totalPrice'
                          // , style: const TextStyle(color: Colors.amber),)
                        ],
                      ),
                    ),
                  ),
                  
                ],
              )
          ],
        );
      })
      ),
    );
    },);
  }

//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.lightBlue.shade50,
//       body: Consumer<ProductModel>(builder: (context, value, child) {
//         return CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               backgroundColor: Colors.blue,
//               pinned: true,
//               // floating: true,
//               // title: Text('hello'),
//               automaticallyImplyLeading: false,
//               expandedHeight: 60,
//               flexibleSpace: FlexibleSpaceBar(
//                 title: Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Row(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       const Text('My Orders', style: TextStyle(color: Colors.white),)
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Column(
//                 children: [
//                   Column(
//         children: [
//           Expanded(child: 
//           ListView.builder(
//             itemCount: value.cartItems.length,
//             itemBuilder:  (context, index) {
//             return OrderTile(h: h);
//           }))
          
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: Column(
//           //     children: [
//           //       OrderTile(h: h),
//           //       OrderTile(h: h),
//           //       OrderTile(h: h),
//           //       OrderTile(h: h),
//           //     ],
//           //   ),
//           // )
//         ],
//       )
//                 ],
//               ),
//             )
//           ],
//         );
//       },)
//     );
//   }
// }

}