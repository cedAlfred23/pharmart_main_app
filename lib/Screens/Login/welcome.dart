// ignore_for_file: no_leading_underscores_for_local_identifiers, slash_for_doc_comments, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:pharmart/Screens/Login/register_screen.dart';
// import '../../Widgets/bottom_sheet.dart';
import '../../Widgets/connect_button.dart';
import 'login_screen.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;


    /**
     * The get started button open the signup or registration page 
     * to let the user create an account by either giving his email, nameee and  password
     * or going by google sign up
     */

    void _getStarted(){
      showModalBottomSheet(
        backgroundColor: Colors.grey.shade100,
         shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(10.0),
  ),
          useRootNavigator: true,
          isScrollControlled: true,
          context: context, builder: (BuildContext context) {
          return SizedBox(
            height: h*0.9,
            child: const RegisterScreen());
                });
    }
    
    // ignore: slash_for_doc_comments
    /**
     * The login button open the login page where the user can sign in using their email and password
     * 
     */
    void _login(){
      showModalBottomSheet(
        backgroundColor: Colors.grey.shade100,
         shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(10.0),
  ),
                  useRootNavigator: true,
                  isScrollControlled: true,
                  context: context, 
                  builder: (BuildContext context) {
                  return SizedBox(
                    height: h*0.9,
                    child: const LoginPage());
                });
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            // logo phamart
            Image.asset('assets/images/logo_color.png', height: 150,),

            // sizedbox
            SizedBox(height: h * 0.15,),

              // Hey welcome
              const Text('Hey! Welcome', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              
              const SizedBox(height: 10,),
              // We delieveer you good medecine
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('Get your diagnosis, talk with a pharmacist and get you delivered your medecines as quick as possible.', style: TextStyle(fontSize: 12, height: 1.5, color: Colors.grey.shade600), textAlign: TextAlign.center,),
              ),
              const SizedBox(height: 20,),

            // Button for sign up
            ConnectButton(w: w, h: h, 
            onPressed: _getStarted,
            buttonName: 'Get Started',
             color: Colors.orange,
             ),
             // Button for sign in
            const SizedBox(height: 20,),
             ConnectButton(w: w, h: h, 
             onPressed: _login, 
             buttonName: 'Login',
             color: Colors.grey.shade200,),
                      const Spacer()
          ],
        ),
      ),
    );
  }
}