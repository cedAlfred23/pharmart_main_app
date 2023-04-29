// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:pharmart/Screens/Login/register_screen.dart';
import '../../Widgets/connect_button.dart';
import '../../Widgets/text_field.dart';

// This is the page to recover forgotten passwords

class PasswordForget extends StatefulWidget {
  const PasswordForget({super.key});

  @override
  State<PasswordForget> createState() => _PasswordForgetState();
}

class _PasswordForgetState extends State<PasswordForget> {
  @override
  Widget build(BuildContext context) {
    String _cpwd;
double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // This function leads to the registration  page
    void _getStarted(){
      Navigator.pop(context);
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
                    child: const RegisterScreen());
                });
    }

    final fieldController = TextEditingController();

    

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Scaffold(
        body: Container(
          height: h * 0.9,
          decoration: const BoxDecoration(
            // color: Colors.green.shade50,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
            topRight: Radius.circular(30))
          ),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Container(
                height: 10,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              const SizedBox(height: 40,),
              const Text('Forgot Password', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 50,),
              TextFieldInput(
                keyBoardType: TextInputType.emailAddress,
                w: w,
               fieldController: fieldController,
              // onChanged: (e) => _cpwd = e,
                texthint: 'Enter your email',),
              const SizedBox(height: 20,),
                 ConnectButton(w: w, h: h, 
                 onPressed: (){}, 
                 buttonName: 'Submit',
                 color: Colors.orange,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Text('Don\'t have an account?', style: TextStyle(fontSize: 12),),
                     TextButton(onPressed: _getStarted,
                     child: const Text('Sign up'))
                   ],
                 )])
        ),
      ),
    );
  }
}