import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmart/Screens/pharmacy_products/Models/product_model.dart';
import 'package:provider/provider.dart';


class OrderTile extends StatefulWidget {
  final String subtitle, price, image;
  final index;
   OrderTile({
    Key? key,
     required this.subtitle, required this.price, required this.image, 
     required this.index,
  }) : super(key: key);

  @override
  State<OrderTile> createState() => _OrderTileState();
}



class _OrderTileState extends State<OrderTile> {
  int numberOfItem = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: 
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 60,
              height: 60,
              child: Image.asset(widget.image, fit: BoxFit.cover,)
              ),
              ),
          title: Text(widget.subtitle),
          subtitle: Text(widget.price),
          trailing: SizedBox(
            width: 170,
            child: Row(
      children: [
       SizedBox(
  child: OutlinedButton(
    onPressed: () {
      if(numberOfItem > 1){
        Provider.of<ProductModel>(context, listen:false).removeItemFromPriceCart(widget.index);
        numberOfItem --;
      }
    },
    child: const Icon(CupertinoIcons.minus),
  ),
),
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(numberOfItem.toString().padLeft(2, "0"), style: const TextStyle(fontSize: 20),),
        ),
        // ignore: prefer_const_constructors
     SizedBox(
  child: OutlinedButton(
    onPressed: () {
      Provider.of<ProductModel>(context, listen:false).addItemToPriceCart(widget.index);
        numberOfItem ++;
    },
    child: const Icon(CupertinoIcons.add),
  ),
),
      ],
    )
          ),
        ),
        const Divider(thickness: 1,)
      ],
        );
  }
}



class CartCounter extends StatefulWidget {
  const CartCounter({super.key,});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numberOfItem = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('je'),
       SizedBox(
  child: OutlinedButton(
    onPressed: () {
      // Provider.of<ProductModel>(context,listen: false).addItemToCart(product);
      if(numberOfItem > 1){
        
        setState(() {
          numberOfItem --;
        });
      }
    },
    child: const Icon(CupertinoIcons.minus),
  ),
),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(numberOfItem.toString().padLeft(2, "0"), style: const TextStyle(fontSize: 20),),
        ),
        // ignore: prefer_const_constructors
     SizedBox(
  // width: 40,
  // height: 32,
  child: OutlinedButton(
    onPressed: () {
      setState(() {
          numberOfItem ++;
        });
    },
    child: const Icon(CupertinoIcons.add),
  ),
),
      ],
    );
  }
}

