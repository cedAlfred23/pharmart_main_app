import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/product_model.dart';

class ItemCard extends StatelessWidget {
  // final ProductModel product;
  final VoidCallback press;
  final String image, title, price;

   const ItemCard({
    Key? key,
    required this.press, 
    required this.image, 
    required this.title, 
    required this.price, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press, // call the press function when the card is tapped
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 200,
                width: 200,
                // padding: const EdgeInsets.only(top: 28),
                decoration: BoxDecoration(
                  color: Colors.grey,
                    borderRadius: BorderRadius.circular(16)),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            title,
          ),
          const SizedBox(height: 5,),
          Text("GH₵ $price",style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      )
    );
  }
}
