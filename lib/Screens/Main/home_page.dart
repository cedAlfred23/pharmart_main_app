// ignore_for_file: prefer_interpolation_to_compose_strings, unused_local_variable, avoid_print, prefer_typing_uninitialized_variables, prefer_final_fields, unused_field, prefer_const_constructors_in_immutables
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pharmart/Screens/Main/order_page.dart';
import 'package:pharmart/services/symptoma.dart';
import '../../Widgets/search_delegate.dart';
import '../../Widgets/service_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geocoding/geocoding.dart';
import '../pharmacy_products/pharmacy_shop.dart';

class HomePage extends StatefulWidget {
  final String imageS;
  final String contentS;
  final  String titleS;
  HomePage({
    Key? key, required this.imageS, required this.contentS, required this.titleS,
  }) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

bool _isLoggedIn = false;
bool _healthdatasuccess = true;
var _user;
String image = '', content = '', title = '';
double bh = 80;


//Location function
Position? _currentPosition;
String? _currentAddress;
bool isLoading = false;

Future<Position> _getPosition() async{

  LocationPermission permission = await Geolocator.checkPermission();
                if (permission == LocationPermission.denied) {
                  permission = await Geolocator.requestPermission();
                  if (permission == LocationPermission.deniedForever) {
                    return Future.error('Location not available');
                  }
                }

  return await Geolocator.getCurrentPosition();
}

void _getAddress(latitude, longitude) async{
  try{
    List<Placemark> placemark = await GeocodingPlatform.instance.placemarkFromCoordinates(latitude, longitude);

    Placemark place = placemark[0];

    setState(() {
      _currentAddress = '${place.locality}, ${place.street}, ${place.administrativeArea}';
    });
  }catch(e){
    print(e);
  }
}

location() async {
        setState(() {
          isLoading = true;
        });
        _currentPosition = await _getPosition();
        _getAddress(_currentPosition!.latitude, _currentPosition!.longitude);
        setState(() {
          isLoading = false;
        });
        print('Location is $_currentAddress');
              }




   @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
    location();
  }

  void _loadSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoggedIn = prefs.getBool('loggedin') ?? false;
      _user = prefs.getString('user') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Variable declarations
    final searchController = TextEditingController();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        //  leading:  Padding(
        //   padding: const EdgeInsets.all(5.0),
        //   child: CircleAvatar(
        //       child: Image.asset('assets/images/profil.jpg', ),
        //     ),),
        // leading:  
        // Padding(
        //   padding: const EdgeInsets.all(5.0),
        //   child: GestureDetector(
        //     onTap: ()async{
        //           SharedPreferences prefs = await SharedPreferences.getInstance();
        //           // Set loggedIn back to false
        //           prefs.setBool('loggedin', false);
        //           // Delete mail user.
        //           prefs.remove('mail');

        //           // Navigate to homepage.
        //            // ignore: use_build_context_synchronously
        //            Navigator.push(
        //            context,
        //             PageRouteBuilder(
        //               pageBuilder: (c, a1, a2) => const LogSign(),
        //               transitionsBuilder: (c, anim, a2, child) =>
        //                   FadeTransition(opacity: anim, child: child),
        //               transitionDuration: const Duration(milliseconds: 200),
        //             ),
        //           );
        //      },
        //     child: Icon(CupertinoIcons.square_arrow_right_fill, color: Colors.black,)
        //   ),
        // ),
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: GestureDetector(
          onTap: (){},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Current location',style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.w200),),
              // ignore: unnecessary_null_comparison
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_pin, color: Colors.grey.shade700, size: 10,),
                  _currentAddress !=null ?
              Text(_currentAddress!, style: TextStyle(color: Colors.grey.shade700, fontSize: 12, fontWeight: FontWeight.w900),)
              : Text('Location unavailable', style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 12, fontWeight: FontWeight.w200)),
                ],
              ),
            ],
          ),
        ),

        actions: [
          Row(
            children: [
              // IconButton(
              //   onPressed: () {
              //     showSearch(
              //       context: context,
              //       delegate: CustomSearchDelegate(),
              //     );
              //   },
              //   splashRadius: 10,
              //   // ignore: prefer_const_constructors
              //   icon: Icon(
              //     CupertinoIcons.search,
              //     // Icons.search,
              //     color: Colors.black,
              //     size: 25,
              //   )),
                IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Cart()));
                },
                splashRadius: 10,
                // ignore: prefer_const_constructors
                icon: Icon(
                  CupertinoIcons.cart,
                  // Icons.search,
                  color: Colors.black,
                  size: 25,
                )),
            ],
          )
        ],
      ),

      // Main body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                 'Hi $_user 👋',
                 style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
               ),
               // ignore: prefer_const_constructors
               Text(
                 'How are you doing today?'
               ,
                   // ignore: prefer_const_constructors
                   style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.w900,
                       color: Colors.grey.shade400)),
              const SizedBox(
                height: 20,
              ),
              Slidable(
                enabled: true,
                endActionPane: const ActionPane(motion: Drawer(backgroundColor: Colors.amber ), children: []),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0)),
                            child: Container(
                              height: h * 0.3,
                              width: w,
                              color: Colors.grey.shade200,
                              child: _healthdatasuccess? 
                              Image.network(
  widget.imageS,
  fit: BoxFit.cover,
  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//      // Future.delayed(Duration(seconds: 1), () {
//   // final context = _myWidgetKey.currentContext;
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       // margin: const EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 50.0),
//         behavior: SnackBarBehavior.floating,
//       content: Text('Delayed function complete!')),
//   );
// // });
    if (loadingProgress == null) {
     
      return child;
    }
    return const Center(
      child: 
      Center(child: CupertinoActivityIndicator(radius: 15,), )
      // CircularProgressIndicator(
      //   value: loadingProgress.expectedTotalBytes != null ? 
      //     loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
      // ),
    );
  },
  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
    
    return const Center(
      child: Text('Failed to load image')
    );
  },
  frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
    if (wasSynchronouslyLoaded) {
      return child;
    }
    return AnimatedOpacity(
      child: child,
      opacity: frame == null ? 0 : 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  },
)
                              // Image.network(widget.imageS,fit: BoxFit.cover,
                              //   errorBuilder: (BuildContext context, 
                              //   Object exception, StackTrace? stackTrace)
                              //    {return const Center(child: CupertinoActivityIndicator(radius: 15,), ); }) 
                                  : Image.asset("assets/images/food.png"),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            // height: h * 0.1,
                            width: w,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'TIP OF THE DAY',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black.withOpacity(0.3)),
                                  ),
                                  const SizedBox(
                              height: 8,
                          ),
                                  Text(
                                    _healthdatasuccess? widget.titleS : "",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900, ),
                                  ),
                                  const SizedBox(
                              height: 1,
                          ),
                                  Text(
                                    _healthdatasuccess? widget.contentS: "" 
                                    , style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w200),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
                
              const SizedBox(
                height: 13,
              ),

                  GestureDetector(
                    onTap: () {
                  // showSearch(
                  //   context: context,
                  //   delegate: CustomSearchDelegate(),
                  // );
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const 
                  // SymptomCheckerPage()
                  Symptoma()
                  )));
                                },
                    child: ServiceTile(
                        w: w,
                        title: 'Get a diagnosis',
                        subtitle: '',
                        path: 'assets/images/page1.gif',
                        color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                   GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => const PharmacyShop()))
                  // showSearch(
                  //   context: context,
                  //   delegate: CustomSearchDelegate(),
                  );
                },
                    child: ServiceTile(
                        w: w,
                        title: 'Find a Product',
                        subtitle: '',
                        path: 'assets/images/page3.gif',
                        color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  
                //   GestureDetector(
                //     onTap: () {
                //   showSearch(
                //     context: context,
                //     delegate: CustomSearchDelegate(),
                //   );
                // },
                //     child: ServiceTile(
                //         w: w,
                //         title: 'Find a medecine',
                //         subtitle: 'subtitle',
                //         path: 'assets/images/page1.gif',
                //         color: Colors.blue),
                //   ),
              const SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

