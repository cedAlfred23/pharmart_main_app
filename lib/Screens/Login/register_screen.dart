// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, unused_element, duplicate_ignore

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/auth_button.dart';
import '../../Widgets/connect_button.dart';
import '../../Widgets/text_field.dart';
import 'login_screen.dart';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
 @override
  void initState() {
    super.initState();
    // Call your function here
    connect(context);
  }




Future<void> connect(context) async {
  // Check internet connection with singleton (no custom values allowed)
  await execute(InternetConnectionChecker());



  // Create customized instance which can be registered via dependency injection
  final InternetConnectionChecker customInstance =
      InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 1),
    checkInterval: const Duration(seconds: 1),
  );

  // Check internet connection with created instance
  await execute(customInstance);
}

Future<void> execute(
  InternetConnectionChecker internetConnectionChecker,
) async {
  // Simple check to see if we have Internet
  // ignore: avoid_print
  print('''The statement 'this machine is connected to the Internet' is: ''');
  final bool isConnected = await InternetConnectionChecker().hasConnection;
  // ignore: avoid_print
  print(
    isConnected.toString(),
  );
  // returns a bool

  // We can also get an enum instead of a bool
  // ignore: avoid_print
  print(
    'Current status: ${await InternetConnectionChecker().connectionStatus}',
  );
  // Prints either InternetConnectionStatus.connected
  // or InternetConnectionStatus.disconnected

  // actively listen for status updates
  final StreamSubscription<InternetConnectionStatus> listener =
      InternetConnectionChecker().onStatusChange.listen(
    (InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          // ignore: avoid_print
          print('Data connection is available.');
          break;
        case InternetConnectionStatus.disconnected:
            var snackBar = const SnackBar(
            backgroundColor: Colors.amber,
            content: Text('Network Error', style: TextStyle(color: Colors.black),));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // ignore: avoid_print
          print('You are disconnected from the internet.');

          break;
      }
    },
  );
  

  // close listener after 30 seconds, so the program doesn't run forever
  await Future<void>.delayed(const Duration(seconds: 10));
  await listener.cancel();
}


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final _mail = TextEditingController();
    final _user = TextEditingController();
    final _pwd = TextEditingController();
    final _cpwd = TextEditingController();
    final _phoneNumber = TextEditingController();

_signUp(context, _mail, _user, _pwd, _cpwd, _phoneNumber) async {
   showDialog(context: context, 
    builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    });

  // Check if email is valid.
  bool isValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(_mail.text);
  
  String auth = "chatappauthkey231r4";

// Check if email is valid

  if (_mail.text.isNotEmpty && _pwd.text.isNotEmpty) {
    if (isValid == true) {
      if (_pwd.text == _cpwd.text) {
    IOWebSocketChannel channel;
    
    try {
      // Create connection.
      channel = IOWebSocketChannel.connect('ws://localhost:3000/signup$_mail');
      print("Connected to webSocket");
      
    } catch (e) {
      print("Error on connecting to websocket: $e");
      return;
    }
    
    // Data that will be sent to Node.js
    String signUpData =
        "{'auth':'$auth','cmd':'signup','email':'${_mail.text}','username':'${_user.text}','hash':'${_pwd.text}','phoneNumber':'${_phoneNumber.text}'}";
    // Send data to Node.js
    channel.sink.add(signUpData);
    // listen for data from the server
    channel.stream.listen((event) async {
      event = event.replaceAll(RegExp("'"), '"');
      var signUpData = json.decode(event);
      // Check if the status is successful
      if (signUpData["status"] == 'success') {
        // Close connection.
        channel.sink.close();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('loggedin', true);
        await prefs.setString('mail', _mail.text);
        await prefs.setString('phoneNumber', _phoneNumber.text);
        // Return user to login if successful

          double h = MediaQuery.of(context).size.height;
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
                    child: const LoginPage());
                });
    
      }else if(signUpData["status"] == 'user_exists'){
channel.sink.close();
        {
          Navigator.pop(context);
          var snackBar = const SnackBar(
            backgroundColor: Colors.amber,
            content: Text('User already exist', style: TextStyle(color: Colors.black),),
          );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
          print("User already exist");
        }
      } else {

channel.stream.listen((msg) {
    // Just making sure it is not empty
    if (msg!.isNotEmpty) {
      // channel?.sink.add(msg);
      // _message;
      
      print(msg);
      // print(event);
      // Now only close the connection and we are done here!
      channel.sink.close();
    }
  });
   Navigator.pop(context);
   var snackBar = const SnackBar(
            backgroundColor: Colors.amber,
            content: Text('Error signing up', style: TextStyle(color: Colors.black),),
          );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("Error signing up");
        channel.sink.close();
      }
    });
      }
      else{
        Navigator.pop(context);
        var snackBar = const SnackBar(
            backgroundColor: Colors.amber,
            content: Text('Password are not equal', style: TextStyle(color: Colors.black),),
          );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("Password are not equal");
      }
    }
    else{
      Navigator.pop(context);
       var snackBar = const SnackBar(
            backgroundColor: Colors.amber,
            content: Text('Enter a correct email', style: TextStyle(color: Colors.black),),
          );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("Enter a correct email");
    }
    }
    else{
      Navigator.pop(context);
     var snackBar = const SnackBar(
            backgroundColor: Colors.amber,
            content: Text('Fill all fields', style: TextStyle(color: Colors.black),),
          );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  
}

    // final TextEditingController _email = TextEditingController();

// String get _mail() => _email.text;

     // this is the function when the signin button is clicked leads to the login page
    void _login() {
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
                    child: const LoginPage());
                });
    }

    

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: h * 0.9,
            decoration: const BoxDecoration(
                // color: Colors.green.shade50,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(30))),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 10,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(10)),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Create an account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFieldInput(
                  keyBoardType: TextInputType.emailAddress,
                    w: w,
                    fieldController: _mail,
                    texthint: 'Email'),
                const SizedBox(
                  height: 10,
                ),
                TextFieldInput(
                  keyBoardType: TextInputType.emailAddress,
                    w: w,
                    fieldController: _user,
                    texthint: 'Username'),
                    const SizedBox(
                  height: 10,
                ),
                TextFieldInput(
                  keyBoardType: TextInputType.text,
                    w: w,
                    fieldController: _phoneNumber,
                    texthint: 'Phone Number'),
                    const SizedBox(
                  height: 10,
                ),
                TextFieldInput(
                  keyBoardType: TextInputType.text,
                    w: w,
                    fieldController: _pwd,
                    texthint: 'Password'),
                const SizedBox(
                  height: 10,
                ),
                TextFieldInput(
                  keyBoardType: TextInputType.text,
                    w: w,
                    fieldController: _cpwd,
                    texthint: 'Confirm Password'),
                const SizedBox(
                  height: 20,
                ),
                ConnectButton(
                  w: w,
                  h: h,
                  onPressed: () => _signUp(context, _mail, _user, _pwd, _cpwd, _phoneNumber),
                  buttonName: 'Create an account',
                  color: Colors.orange,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 12),
                    ),
                    TextButton(onPressed: _login, child: const Text('Sign in'))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // AuthButton(
                //   w: w,
                //   h: h,
                //   path: 'assets/images/google.png',
                //   authType: 'Google',
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // AuthButton(
                //     w: w,
                //     h: h,
                //     authType: 'Facebook',
                //     path: 'assets/images/facebook.png')
              ],
            ),
          ),
        ),
      ),
    );
  }
}