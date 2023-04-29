
// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:pharmart/Screens/Login/password.dart';
import 'package:pharmart/Screens/Login/register_screen.dart';
import 'package:pharmart/Screens/Main/splash_screen.dart';
import '../../Widgets/connect_button.dart';
import '../../Widgets/text_field.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';


class LoginPage extends StatefulWidget {
   const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   @override
  void initState() {
    super.initState();
    // Call your function here
    connect(context);
  }

  @override
  void dispose(){
    super.dispose();
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






_signUserIn(context, _mail, _pwd) async {
   // Check if email is valid.
  bool isValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(_mail.text);

  String auth = "chatappauthkey231r4";
  if (_mail.text.isNotEmpty && _pwd.text.isNotEmpty) {
    if (isValid == true) {
    IOWebSocketChannel channel;
    try {
      // Create connection.
      channel = IOWebSocketChannel.connect('ws://localhost:3000/login$_mail');
      print("Connected to webSocket");
      Navigator.pop;
    } catch (e) {
      var snackBar = const SnackBar(
            backgroundColor: Colors.amber,
            content: Text('Error on connecting to websocket', style: TextStyle(color: Colors.black),),
          );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("Error on connecting to websocket: $e"
      );
      return;
    }
    // Data that will be sent to Node.js
    String signUpData =
        "{'auth':'$auth','cmd':'login','email':'${_mail.text}','hash':'${_pwd.text}'}";
    // Send data to Node.js
    channel.sink.add(signUpData);
    // listen for data from the server
    channel.stream.listen((event) async {
      event = event.replaceAll(RegExp("'"), '"');
      var loginData = json.decode(event);
      print(loginData);
      // Check if the status is successful
      if(loginData["status"] == 'succes'){
        // Close connection.
        channel.sink.close();
        String _user = loginData["username"]; 
        String _phoneNumber = loginData["phoneNumber"]; 
        print(_user);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('loggedin', true);
        await prefs.setString('mail', _mail.text);
        await prefs.setString('user', _user);
        await prefs.setString('phoneNumber', _phoneNumber);
        // Return user to login if successful
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SplashScreen()),
        );
      } else if(loginData["status"] == 'wrong_pass'){
        channel.sink.close();
      var snackBar = const SnackBar(
            backgroundColor: Colors.amber,
            content: Text('Wrong Password', style: TextStyle(color: Colors.black),),
          );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("Wrong Password");
      }
      else if(loginData["status"] == 'wrong_mail'){
        channel.sink.close();
        var snackBar = const SnackBar(
            backgroundColor: Colors.amber,
            content: Text('Wrong Email', style: TextStyle(color: Colors.black),),
          );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("Wrong Email");
      }
       else {
        channel.sink.close();
var snackBar = const SnackBar(
            backgroundColor: Colors.amber,
            content: Text('Error signing in', style: TextStyle(color: Colors.black),),
          );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("Error signing in");
      }
    });
    }else{
      var snackBar = const SnackBar(
            backgroundColor: Colors.amber,
            content: Text('Enter a correct email', style: TextStyle(color: Colors.black),),
          );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      
      print("Enter a correct email");
    }
  } else {
      var snackBar = const SnackBar(
            backgroundColor: Colors.amber,
            content: Text('Password or email are empty', style: TextStyle(color: Colors.black),),
          );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    print("Password or email are empty");
  }
  // Navigator.pop(context);
}


  @override
  Widget build(BuildContext context) {
  final _mail = TextEditingController();
  final _pwd = TextEditingController();

  double w = MediaQuery.of(context).size.width;
  double h = MediaQuery.of(context).size.height;



    void _password() {
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
                    child: const PasswordForget());
                });
    }

    void _getStarted() {
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
                  'Log into your account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFieldInput(
                  keyBoardType: TextInputType.emailAddress,
                  w: w,
                  fieldController: _mail,
                  texthint: 'Enter your email', 
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldInput(
                  keyBoardType: TextInputType.text,
                  w: w,
                  fieldController: _pwd,
                  texthint: 'Enter your password', 
                  
                ),
                const SizedBox(
                  height: 20,
                ),
                ConnectButton(
                  w: w,
                  h: h,
                  onPressed: () => _signUserIn(context, _mail, _pwd),
                  buttonName: 'Login',
                  color: Colors.orange,
                ),
                const SizedBox(
                  height: 0,
                ),
                Container(
                    alignment: const Alignment(0.7, 0),
                    child: TextButton(
                        onPressed: _password,
                        child:
                            const Text('Forget Password', style: TextStyle(fontSize: 12)))),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Or continue with...',
                  style: TextStyle(fontSize: 12),
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
                //   height: 10,
                // ),
                // AuthButton(
                //     w: w,
                //     h: h,
                //     authType: 'Facebook',
                //     path: 'assets/images/facebook.png'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 12),
                    ),
                    TextButton(onPressed: _getStarted, child: const Text('Sign up'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}