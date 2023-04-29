// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, duplicate_ignore

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmart/Screens/Onboarding/login_or_signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/connect_button.dart';

class Profil extends StatefulWidget {
  
 const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  bool _isLoggedIn = false;
  var _user;

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
  }

  void _loadSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoggedIn = prefs.getBool('loggedin') ?? false;
      _user = prefs.getString('user') ?? '';
    });
  }

 // ignore: unused_field
 File? _imageFile;
String path = '/Users/cgbaguidi/Documents/Capstone/pharmart/assets/images/profil.jpg';

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        path = pickedFile.path;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: SafeArea(
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Stack(
                    children: [
                  SizedBox(
                    height: h*0.3,
                    child: Center(
                      child: 
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 150,
                          width: 150,
                          color: Colors.grey,
                          child: Image.asset(path, fit: BoxFit.cover,),
                        ),
                      )
                    ),
                  ),
                  // Positioned(
                  //       bottom: 50,
                  //       right: 120,
                  //       child: Container(
                  //                         decoration: BoxDecoration(
                  //       color: Colors.amber.shade100,
                  //       borderRadius: BorderRadius.circular(100)
                  //                         ),
                  //                         child: IconButton(
                  //       onPressed: 
                  //         _pickImage
                  //       ,
                  //       icon: const Icon(Icons.add_a_photo)),
                  //                       ),
                  //     ),
                    ],
                  ),
                  SizedBox(

                    height: h*0.5,
                    
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: Colors.blue,
                        //       borderRadius: BorderRadius.circular(12)),
                        //     padding: const EdgeInsets.all(12 ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           const Text('Name'),
                        //           Text('$_user')
                        //         ],
                        //       ),
                        //       const Icon(Icons.edit)
                        //     ],
                        //   ),
                        //   ),
                        // ),
                        const SizedBox(height: 15,),

                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: Colors.blue,
                        //       borderRadius: BorderRadius.circular(12)),
                        //     padding: const EdgeInsets.all(12 ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: const [
                        //           Text('Location'),
                        //           Text('Block Factory')
                        //         ],
                        //       ),
                        //       const Icon(Icons.edit)
                        //     ],
                        //   ),
                        //   ),
                        // ),
                        const SizedBox(height: 15,),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: Colors.blue,
                        //       borderRadius: BorderRadius.circular(12)),
                        //     padding: const EdgeInsets.all(12 ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: const [
                        //           Text('Payment Method'),
                        //           Text('Credit Card: 123456789')
                        //         ],
                        //       ),
                        //       const Icon(Icons.edit)
                        //     ],
                        //   ),
                        //   ),
                        // ),
                        const SizedBox(height: 15,),

                        ConnectButton(w: w, h: h , 
             onPressed: ()async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  // Set loggedIn back to false
                  prefs.setBool('loggedin', false);
                  // Delete mail user.
                  prefs.remove('mail');
 
                  // Navigate to homepage.
                   // ignore: use_build_context_synchronously
                   Navigator.push(
                   context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => const LogSign(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: const Duration(milliseconds: 200),
                    ),
                  );
             },
             buttonName: 'Logout',
             color: Colors.red,),
                        // image != null ? Image.file(image!) : Text('No image selected')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}