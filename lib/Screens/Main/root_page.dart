// ignore_for_file: unused_local_variable
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pharmart/Screens/Main/map_page.dart';
import 'package:pharmart/Screens/Main/profile_page.dart';
import 'package:pharmart/Screens/Main/chatpage.dart';
import 'package:web_socket_channel/io.dart';
import 'home_page.dart';
// import 'notification_page.dart';


class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}


class _RootPageState extends State<RootPage> {
  late int _selectedIndex;
  String image = '', content = '', title = '';

//Function to get health tip data from backend
_getHealthTip() async {
  print('health tip');
  String auth = "chatappauthkey231r4";
   IOWebSocketChannel channel;
    try {
      // Create connection.
      channel = IOWebSocketChannel.connect('ws://localhost:3000/healthtip');
      print("Connected to webSocket");

    } catch (e) {
      print("Error on connecting to websocket: $e"
      );
      return;
    }
    // Data that will be sent to Node.js
    String healthData =
        "{'auth':'$auth','cmd':'healthtip'}";
    // Send data to Node.js
    channel.sink.add(healthData);
  channel.stream.listen(
    (event) async {
      event = event.replaceAll(RegExp("'"), '"');
      var healthTipData = json.decode(event);
      // print(healthTipData);

      setState(() {
        image = healthTipData['image'];
        content = healthTipData['content'];
        title = healthTipData['title'];
      });
      _pages= [
        () => HomePage(imageS: image, contentS: content, titleS: title),
        () => const ProviderScope(child:  MapPage()),
        () => const ChatPage(),
        // () => const Notifications(),
        () => const Profil(),
      ];
      print(content);
    });
    return content;
}

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

   List<Widget Function()> _pages = [
        () => HomePage(imageS: '', contentS: '', titleS: ''),
        () => const ProviderScope(child:  MapPage()),
        () => const ChatPage(),
        () => const Profil(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _getHealthTip();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
 
    return Scaffold(

//       bottomNavigationBar: 
// BottomNavigationBar(
//       currentIndex: _selectedIndex,
//       onTap: _navigateBottomBar,
//       type: BottomNavigationBarType.fixed,
//       items: const [
//         BottomNavigationBarItem(icon: Icon(CupertinoIcons.home, ), label: 'Home',),
//         BottomNavigationBarItem(icon: Icon(CupertinoIcons.location, ), label: ''),
//         BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart, ), label: ''),
//         BottomNavigationBarItem(icon: Icon(CupertinoIcons.info, ), label: ''),
//         BottomNavigationBarItem(icon: Icon(CupertinoIcons.person, ), label: ''),
//       ]),






      bottomNavigationBar: Container(
        color: Colors.blue,
        padding: const EdgeInsets.only(top: 6, bottom: 20, left: 20, right: 20),
        child: GNav(
          iconSize: 18,
          selectedIndex: _selectedIndex,
          onTabChange: _navigateBottomBar,
          color: Colors.grey.shade400,
          tabBackgroundColor: Colors.lightBlue.shade50,
          padding: const EdgeInsets.all(12),
          activeColor: Colors.black,
          gap: 8,
          tabs: const [
            GButton(icon: CupertinoIcons.home, text: 'Home'),
            GButton(icon: CupertinoIcons.location, text: 'Location'),
            GButton(icon: CupertinoIcons.chat_bubble_2, text: 'Chats'),
            // GButton(icon: CupertinoIcons.info, text: 'Notifications'),
            GButton(icon: CupertinoIcons.person, text: 'Settings'),
          ]),
      ),
       
      body: _pages[_selectedIndex](),
    );
  }
}