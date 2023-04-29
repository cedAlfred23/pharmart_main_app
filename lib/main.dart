import 'package:flutter/material.dart';
import 'package:pharmart/Screens/pharmacy_products/Models/product_model.dart';
import 'package:pharmart/services/notification_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_zimkit/services/services.dart';
import 'Screens/Onboarding/login_or_signup.dart';
import 'Screens/Onboarding/onboarding_screen.dart';


void main() async {
  ZIMKit().init(
    appID: 1710962243,
    appSign: "bbcd721ab23af6aef013e193fc6e6c3a564faebb65d5834bb25a44fa75a91644",
  );
  WidgetsFlutterBinding.ensureInitialized();
  bool isFirstTime = await isFirstTimeCheked();
    WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(MyApp(isFirstTime: isFirstTime));
}

Future<bool> isFirstTimeCheked() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  if (isFirstTime) {
    await prefs.setBool('isFirstTime', false);
  }
  return isFirstTime;
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  const MyApp({Key? key, required this.isFirstTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ProductModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      home: isFirstTime ? const OnboardingScreen() : const LogSign(),
    ),);
  }
}