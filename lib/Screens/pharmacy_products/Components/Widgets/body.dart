import 'package:flutter/material.dart';
import 'package:pharmart/Screens/pharmacy_products/Components/pharmay_Items_categories/baby_products.dart';
import 'package:pharmart/Screens/pharmacy_products/Components/pharmay_Items_categories/medicine_items.dart';
import 'package:pharmart/Screens/pharmacy_products/Components/pharmay_Items_categories/perfume_items.dart';
import 'package:pharmart/Screens/pharmacy_products/Components/pharmay_Items_categories/vitamin_items.dart';

class Body extends StatelessWidget {
  const Body({super.key, });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
            const TabBar(
            isScrollable: true,
            labelColor: Colors.purple,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                width: 2,
                color: Colors.blue)
                )
            ),
            tabs: [
            Tab(
              // icon: Icon(Icons.home, color: Colors.blue,),
              child: Text('Medecine', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
            ),
            Tab(
              child: Text('Personal care products', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
            ),
            Tab(
              child: Text('Vitamins and supplements', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
            ),
            Tab(
              child: Text('Baby and child care products', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
            ),

          ]),
         const Expanded(
            child: TabBarView(
              children: [
                MedecineItems(),
                PersonalItems(),
                VitaninItems(),
                BabyItems()
            ]),
          ),

        ],
      ),
    );
  }
}
