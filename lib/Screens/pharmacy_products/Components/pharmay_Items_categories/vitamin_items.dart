
import 'package:flutter/material.dart';
import 'package:pharmart/Screens/pharmacy_products/Components/Widgets/item_card.dart';
import 'package:pharmart/Screens/pharmacy_products/Models/product_model.dart';
import 'package:provider/provider.dart';

import '../Details/detail.dart';

class VitaninItems extends StatelessWidget {
  const VitaninItems({
    Key? key,
  }) : super(key: key);

  @override
   Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
            child: Consumer<ProductModel>(builder: (context, value, child) {
              return GridView.builder(
      itemCount: value.vitaminItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 0.80
      ),
      itemBuilder: ((context, index) => ItemCard(
        title: value.vitaminItems[index][1],
        price: value.vitaminItems[index][3],
        image: value.vitaminItems[index][2],
      press: () => Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => DetailPage(product: value.vitaminItems[index]))
      )
      )),
    );
            },)
  );
  }
}


