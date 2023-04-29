import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmart/Screens/Main/order_page.dart';
import 'package:pharmart/Screens/pharmacy_products/Components/Widgets/body.dart';

class PharmacyShop extends StatefulWidget {
  const PharmacyShop({super.key});

  @override
  State<PharmacyShop> createState() => _PharmacyShopState();
}

class _PharmacyShopState extends State<PharmacyShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text('', style: TextStyle(color: Colors.black),),
      leadingWidth: 20,
      actions: [
        IconButton(onPressed: (){}, 
      icon: const Icon(CupertinoIcons.search, color: Colors.black,)),
      IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Cart()));
      }, 
      icon: const Icon(CupertinoIcons.cart, color: Colors.black,)),
      ],
    ),
      body: const Body(),
    );
  }}