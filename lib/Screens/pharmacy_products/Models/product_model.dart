import 'package:flutter/material.dart';
//   final String image, title, description, laboratory, activeSubstance;
 


class ProductModel extends ChangeNotifier{



//  final int price, id, pieceLeft;
//   final Color color;
//   final double imageSize;
//   final activeSubstance, laboratory, description, image, title, quantities;
  
   

//   ProductModel({
//     required this.id,
//     required this.title,
//     required this.image,
//     required this.price,
//     required this.description,
//     required this.laboratory,
//     required this.color,
//     required this.pieceLeft,
//     required this.quantities,
//     required this.activeSubstance, 
//     required this.imageSize
//   });

//   List<ProductModel> medicineProduct = [
//      ProductModel(
//     id: 1,
//     title: "Doliprane", 
//     image: 'assets/images/doliprane.png', 
//     price: 200, 
//     pieceLeft: 8,
//     imageSize: 200,
//     quantities: 20,
//     description: "Duis labore aliquip adipisicing adipisicing. Mollit non consectetur laborum mollit anim cupidatat irure laborum. Nulla qui qui mollit tempor ex nostrud. Ipsum sit commodo commodo id ipsum veniam. Occaecat culpa deserunt proident reprehenderit aliquip eiusmod aute. Excepteur non reprehenderit in fugiat Lorem sunt ea Lorem officia.", 
//     laboratory: 'Peace Phamaceutics, Ghana', 
//     color: Colors.blue,
//     activeSubstance: "Paracetamol"),
//   ];








final List _medecineProduct = [
[ 1, "Doliprane 500", "/Users/cgbaguidi/Documents/Capstone/pharmart/assets/images/dol.jpg", "200.00", "1"," Doliprane Tabs 1000 mg is indicated in cases of fever and/or mild to moderate pain. The active ingredient of this medicine is paracetamol. One box contains 8 film-coated tablets.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
[ 2, "Ibuprofene", "/Users/cgbaguidi/Documents/Capstone/pharmart/assets/images/pana.jpg", "130.00", "2","Duis labore aliquip adipisicing adipisicing. Ullamco aliquip consectetur elit elit nulla nostrud ut pariatur nostrud sit ipsum duis sit.", 'Peace Phamaceutics, Ghana',  "Paracetamol"],
[ 3, "Aspirin", "/Users/cgbaguidi/Documents/Capstone/pharmart/assets/images/chloroquine.jpeg", "500.00", "3","Duis labore aliquip adipisicing adipisicing. Sint do dolor exercitation consequat non culpa anim.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
[4,  "Doliprane", "/Users/cgbaguidi/Documents/Capstone/pharmart/assets/images/tylenol.jpg", "200.00", "4","Duis labore aliquip adipisicing adipisicing. Ea laboris minim proident ea minim labore aute magna mollit excepteur magna nulla nisi.", 'Peace Phamaceutics, Ghana',  "Paracetamol"],
[ 5,"Ibuor", "/Users/cgbaguidi/Documents/Capstone/pharmart/assets/images/Metronidazol-2.jpg", "9.00", "5","Duis labore aliquip adipisicing adipisicing. Dolore elit irure non laborum duis.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
[ 5,"Advil", "/Users/cgbaguidi/Documents/Capstone/pharmart/assets/images/nexium.jpg", "90.70", "5","Duis labore aliquip adipisicing adipisicing. Dolore elit irure non laborum duis.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
];

final List _personalProduct = [
[ 1, "Soap", "assets/images/soap.jpg", "20.50", "1"," Ea cillum velit tempor qui Lorem amet et fugiat velit. Lorem ex nostrud veniam consectetur.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
[ 2, "Supreme toothpaste", "assets/images/toothpaste.jpg", "55.00", "2","Duis labore aliquip adipisicing adipisicing. Ullamco aliquip consectetur elit elit nulla nostrud ut pariatur nostrud sit ipsum duis sit.", 'Peace Phamaceutics, Ghana',  "Paracetamol"],
[ 3, "Sensodyn toothpaste", "assets/images/seensodyne.jpg", "80.00", "3","Duis labore aliquip adipisicing adipisicing. Sint do dolor exercitation consequat non culpa anim.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
[4,  "Curlogy", "assets/images/pommade.jpg", "200.99", "4","Duis labore aliquip adipisicing adipisicing. Ea laboris minim proident ea minim labore aute magna mollit excepteur magna nulla nisi.", 'Peace Phamaceutics, Ghana',  "Paracetamol"],
[ 5,"Versage perfume", "assets/images/perfume.avif", "450.0", "5","Duis labore aliquip adipisicing adipisicing. Dolore elit irure non laborum duis.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
[ 5,"Pearl essence", "assets/images/lotion.jpg", "90.70", "5","Duis labore aliquip adipisicing adipisicing. Dolore elit irure non laborum duis.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
];

final List _vitaminProduct = [
[ 1, "Doliprane 500", "/Users/cgbaguidi/Documents/Capstone/pharmart/assets/images/dol.jpg", "200.00", "1"," Doliprane Tabs 1000 mg is indicated in cases of fever and/or mild to moderate pain. The active ingredient of this medicine is paracetamol. One box contains 8 film-coated tablets.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
[ 2, "Ibuprofene", "/Users/cgbaguidi/Documents/Capstone/pharmart/assets/images/pana.jpg", "130.00", "2","Duis labore aliquip adipisicing adipisicing. Ullamco aliquip consectetur elit elit nulla nostrud ut pariatur nostrud sit ipsum duis sit.", 'Peace Phamaceutics, Ghana',  "Paracetamol"],
[ 3, "Aspirin", "/Users/cgbaguidi/Documents/Capstone/pharmart/assets/images/chloroquine.jpeg", "500.00", "3","Duis labore aliquip adipisicing adipisicing. Sint do dolor exercitation consequat non culpa anim.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
[4,  "Doliprane", "/Users/cgbaguidi/Documents/Capstone/pharmart/assets/images/tylenol.jpg", "200.00", "4","Duis labore aliquip adipisicing adipisicing. Ea laboris minim proident ea minim labore aute magna mollit excepteur magna nulla nisi.", 'Peace Phamaceutics, Ghana',  "Paracetamol"],
[ 5,"Ibuor", "/Users/cgbaguidi/Documents/Capstone/pharmart/assets/images/Metronidazol-2.jpg", "9.00", "5","Duis labore aliquip adipisicing adipisicing. Dolore elit irure non laborum duis.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
[ 5,"Advil", "/Users/cgbaguidi/Documents/Capstone/pharmart/assets/images/nexium.jpg", "90.70", "5","Duis labore aliquip adipisicing adipisicing. Dolore elit irure non laborum duis.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
];

final List _babyProduct = [
[ 1, "Soap", "assets/images/soap.jpg", "20.50", "1"," Ea cillum velit tempor qui Lorem amet et fugiat velit. Lorem ex nostrud veniam consectetur.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
[ 2, "Supreme toothpaste", "assets/images/toothpaste.jpg", "55.00", "2","Duis labore aliquip adipisicing adipisicing. Ullamco aliquip consectetur elit elit nulla nostrud ut pariatur nostrud sit ipsum duis sit.", 'Peace Phamaceutics, Ghana',  "Paracetamol"],
[ 3, "Sensodyn toothpaste", "assets/images/seensodyne.jpg", "80.00", "3","Duis labore aliquip adipisicing adipisicing. Sint do dolor exercitation consequat non culpa anim.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
[4,  "Curlogy", "assets/images/pommade.jpg", "200.99", "4","Duis labore aliquip adipisicing adipisicing. Ea laboris minim proident ea minim labore aute magna mollit excepteur magna nulla nisi.", 'Peace Phamaceutics, Ghana',  "Paracetamol"],
[ 5,"Versage perfume", "assets/images/perfume.avif", "450.0", "5","Duis labore aliquip adipisicing adipisicing. Dolore elit irure non laborum duis.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
[ 5,"Pearl essence", "assets/images/lotion.jpg", "90.70", "5","Duis labore aliquip adipisicing adipisicing. Dolore elit irure non laborum duis.", 'Peace Phamaceutics, Ghana', "Paracetamol"],
];

List  _cartItems = [];
List _priceCart = [];


get medecineItems => _medecineProduct;
get personalItems => _personalProduct;
get vitaminItems => _vitaminProduct;
get babyItems => _babyProduct;

get cartItems => _cartItems;
get priceCart => _priceCart;

void addItemToCart(index){
  _cartItems.add(index);
  notifyListeners();
}

void addItemToPriceCart(index){
  _priceCart.insert(_priceCart.length,index);
  notifyListeners();
}

void removeItemFromCart(index){
  _cartItems.remove(index);
  notifyListeners();
}
void removeItemFromPriceCart(index){
  _priceCart.remove(index);
  notifyListeners();
}

void removeAt(int index){
  _cartItems.removeAt(index);
  notifyListeners();
}

void removeAtPriceCart(int index){
  print('object 1');
for (int i=0; i < _priceCart.length; i++){
  print('object 2');
  print(i);
  // _priceCart.removeAt(index);
  if(_priceCart.contains(index)){
    print(i);
    print('object 3');
    _priceCart.removeAt(i);
  }
}

print('heyyyyy4');
notifyListeners();
}

void removeAllItems(){
  _cartItems = [];
  notifyListeners();
}

void removeAllItemsFromPriceCart(){
  _priceCart = [];
  notifyListeners();
}

double calculateTotal(){
  double totalPrice = 0;
  for (int i=0; i < _priceCart.length; i++){
   totalPrice += double.parse(_priceCart[i][3].toString());
  }
  return totalPrice;
}

void order(){
  
}






//   final String image, title, description, laboratory, activeSubstance;
//   final int price, id, pieceLeft;
//   final Color color;
//   final double imageSize;

//   ProductModel({
//     required this.id,
//     required this.title,
//     required this.image,
//     required this.price,
//     required this.description,
//     required this.laboratory,
//     required this.color,
//     required this.pieceLeft,
//     // required this.quantities,
//     required this.activeSubstance, 
//     required this.imageSize
//   });
// }

// List<ProductModel> medicineProduct = [
//   ProductModel(
//     id: 1,
//     title: "Doliprane", 
//     image: 'assets/images/doliprane.png', 
//     price: 200, 
//     pieceLeft: 8,
//     imageSize: 200,
//     // quantities: 20,
//     description: "Duis labore aliquip adipisicing adipisicing. Mollit non consectetur laborum mollit anim cupidatat irure laborum. Nulla qui qui mollit tempor ex nostrud. Ipsum sit commodo commodo id ipsum veniam. Occaecat culpa deserunt proident reprehenderit aliquip eiusmod aute. Excepteur non reprehenderit in fugiat Lorem sunt ea Lorem officia.", 
//     laboratory: 'Peace Phamaceutics, Ghana', 
//     color: Colors.blue,
//     activeSubstance: "Paracetamol"),

//     ProductModel(
//     id: 2,
//     title: "Omega", 
//     image: 'assets/images/doliprane.png', 
//     price: 200, 
//     pieceLeft: 3,
//     imageSize: 200,
//     // quantities: 8,
//     description: "Occaecat elit nulla duis eiusmod in minim qui laboris ipsum nisi ullamco nostrud. Magna aute occaecat commodo dolore sit in. Est duis deserunt minim nulla nostrud. Esse dolore duis anim ullamco excepteur cupidatat fugiat. Pariatur veniam labore commodo incididunt amet duis cupidatat eiusmod. Ex consectetur est cillum est sunt. Voluptate ipsum culpa enim velit anim nisi ea laboris velit adipisicing officia.", 
//     laboratory: 'Oceanic Pharmacy, Bangladesh', 
//     activeSubstance: "Vitamin",
//     color: Colors.blue.shade200),

//     ProductModel(
//     id: 3,
//     title: "Ibuprofene", 
//     image: 'assets/images/ibuprofene.png', 
//     price: 200, 
//     pieceLeft: 4,
//     imageSize: 200,
//     // quantities: 10,
//     description: "Proident dolor non proident deserunt ea. Lorem duis sit aliqua dolor minim ut est qui esse exercitation. Aliqua commodo Lorem ullamco do velit anim sit ut. Ipsum laboris culpa ut eiusmod duis Lorem. Reprehenderit ipsum consectetur nostrud enim elit consequat ad Lorem amet duis id. Nisi est commodo ex elit nulla. Laboris id proident dolore non eiusmod aliquip culpa ea sit duis dolore.", 
//     laboratory: 'Biosyn, Russia',
//     activeSubstance: "Amocixiline",
//     color: Colors.pink),

//     ProductModel(
//     id: 1,
//     title: "Doliprane", 
//     image: 'assets/images/doliprane.png', 
//     price: 200, 
//     pieceLeft: 8,
//     imageSize: 200,
//     // quantities: 20,
//     description: "Culpa commodo Lorem et qui nisi commodo.", 
//     laboratory: 'Peace Phamaceutics, Ghana', 
//     color: Colors.blue,
//     activeSubstance: "Paracetamol"),

//     ProductModel(
//     id: 2,
//     title: "Omega", 
//     image: 'assets/images/doliprane.png', 
//     price: 200, 
//     pieceLeft: 3,
//     imageSize: 200,
//     // quantities: 8,
//     description: "Adipisicing ea qui eu laboris amet laboris tempor dolore ex fugiat id laborum ipsum. Cillum exercitation incididunt consequat quis fugiat tempor elit. Fugiat reprehenderit duis ad ea ex. Nostrud commodo magna nisi adipisicing nulla officia est irure. Laboris duis deserunt pariatur sit aliquip cupidatat nostrud sunt esse fugiat ipsum veniam. Occaecat id aliqua Lorem nulla aute amet aliquip ullamco Lorem eu voluptate officia aliqua reprehenderit.", 
//     laboratory: 'Oceanic Pharmacy, Bangladesh', 
//     activeSubstance: "Vitamin",
//     color: Colors.blue.shade200),

//     ProductModel(
//     id: 3,
//     title: "Ibuprofene", 
//     image: 'assets/images/ibuprofene.png', 
//     imageSize: 200,
//     price: 200, 
//     pieceLeft: 4,
//     // quantities: 10,
//     description: "Reprehenderit nulla proident consequat in minim do ipsum fugiat. Aliqua minim adipisicing aute deserunt ex nostrud. Nulla fugiat enim do amet laborum id duis. Eiusmod qui est dolor do.", 
//     laboratory: 'Biosyn, Russia',
//     activeSubstance: "Amocixiline",
//     color: Colors.pink),
// ];


// List<ProductModel> perfumeProduct = [
//   ProductModel(
//     id: 1,
//     title: "Doliprane", 
//     image: 'assets/images/perfume.png', 
//     price: 200, 
//     pieceLeft: 8,
//     imageSize: 200,
//     // quantities: 20,
//     description: "Duis labore aliquip adipisicing adipisicing. Mollit non consectetur laborum mollit anim cupidatat irure laborum. Nulla qui qui mollit tempor ex nostrud. Ipsum sit commodo commodo id ipsum veniam. Occaecat culpa deserunt proident reprehenderit aliquip eiusmod aute. Excepteur non reprehenderit in fugiat Lorem sunt ea Lorem officia.", 
//     laboratory: 'Peace Phamaceutics, Ghana', 
//     color: Colors.blue,
//     activeSubstance: "Paracetamol"),

//     ProductModel(
//     id: 2,
//     title: "Omega", 
//     image: 'assets/images/perfume.png', 
//     price: 200, 
//     pieceLeft: 3,
//     imageSize: 200,
//     // quantities: 8,
//     description: "Occaecat elit nulla duis eiusmod in minim qui laboris ipsum nisi ullamco nostrud. Magna aute occaecat commodo dolore sit in. Est duis deserunt minim nulla nostrud. Esse dolore duis anim ullamco excepteur cupidatat fugiat. Pariatur veniam labore commodo incididunt amet duis cupidatat eiusmod. Ex consectetur est cillum est sunt. Voluptate ipsum culpa enim velit anim nisi ea laboris velit adipisicing officia.", 
//     laboratory: 'Oceanic Pharmacy, Bangladesh', 
//     activeSubstance: "Vitamin",
//     color: Colors.blue.shade200),

//     ProductModel(
//     id: 3,
//     title: "Ibuprofene", 
//     image: 'assets/images/perfume.png', 
//     price: 200, 
//     pieceLeft: 4,
//     imageSize: 200,
//     // quantities: 10,
//     description: "Proident dolor non proident deserunt ea. Lorem duis sit aliqua dolor minim ut est qui esse exercitation. Aliqua commodo Lorem ullamco do velit anim sit ut. Ipsum laboris culpa ut eiusmod duis Lorem. Reprehenderit ipsum consectetur nostrud enim elit consequat ad Lorem amet duis id. Nisi est commodo ex elit nulla. Laboris id proident dolore non eiusmod aliquip culpa ea sit duis dolore.", 
//     laboratory: 'Biosyn, Russia',
//     activeSubstance: "Amocixiline",
//     color: Colors.pink),

//     ProductModel(
//     id: 1,
//     title: "Doliprane", 
//     image: 'assets/images/perfume.png', 
//     price: 200, 
//     pieceLeft: 8,
//     imageSize: 200,
//     // quantities: 20,
//     description: "Culpa commodo Lorem et qui nisi commodo.", 
//     laboratory: 'Peace Phamaceutics, Ghana', 
//     color: Colors.blue,
//     activeSubstance: "Paracetamol"),

//     ProductModel(
//     id: 2,
//     title: "Omega", 
//     image: 'assets/images/perfume.png', 
//     price: 200, 
//     pieceLeft: 3,
//     imageSize: 200,
//     // quantities: 8,
//     description: "Adipisicing ea qui eu laboris amet laboris tempor dolore ex fugiat id laborum ipsum. Cillum exercitation incididunt consequat quis fugiat tempor elit. Fugiat reprehenderit duis ad ea ex. Nostrud commodo magna nisi adipisicing nulla officia est irure. Laboris duis deserunt pariatur sit aliquip cupidatat nostrud sunt esse fugiat ipsum veniam. Occaecat id aliqua Lorem nulla aute amet aliquip ullamco Lorem eu voluptate officia aliqua reprehenderit.", 
//     laboratory: 'Oceanic Pharmacy, Bangladesh', 
//     activeSubstance: "Vitamin",
//     color: Colors.blue.shade200),

//     ProductModel(
//     id: 3,
//     title: "Ibuprofene", 
//     image: 'assets/images/perfume.png', 
//     imageSize: 200,
//     price: 200, 
//     pieceLeft: 4,
//     // quantities: 10,
//     description: "Reprehenderit nulla proident consequat in minim do ipsum fugiat. Aliqua minim adipisicing aute deserunt ex nostrud. Nulla fugiat enim do amet laborum id duis. Eiusmod qui est dolor do.", 
//     laboratory: 'Biosyn, Russia',
//     activeSubstance: "Amocixiline",
//     color: Colors.pink),
// ];




// final List medecine = [
//   //[name, image, price, description, left in store]
//   ['Brut', '', '32.00', 'Lorem ipsum', 4],
//   ['Nivea', '', '32.00', 'Lorem ipsum', 4],
//   ['Hot ice', '', '22.00', 'Lorem ipsum', 4],
//   ['Dove', '', '29.00', 'Lorem ipsum', 4],
//   ['Brut', '', '32.00', 'Lorem ipsum', 4],
// ];



// final List medecine = [
//   //[name, image, price, description, left in store]
//   [Colors.yellow,'Paracetamol', '', '5.00', 'Lorem ipsum', 4],
//   ['Doliprane', '', '15.50', 'Lorem ipsum', 20],
//   ['Metronidazol', '', '5.00', 'Lorem ipsum', 3],
//   ['Paracetamol', '', '5.00', 'Lorem ipsum', 49],
//   ['Paracetamol', '', '5.00', 'Lorem ipsum', 3],
//   ['Paracetamol', '', '5.00', 'Lorem ipsum', 21],
//   ['Paracetamol', '', '5.00', 'Lorem ipsum', 32],
//   ['Paracetamol', '', '5.00', 'Lorem ipsum', 9],
//   ['Paracetamol', '', '5.00', 'Lorem ipsum', 0],
// ];


}