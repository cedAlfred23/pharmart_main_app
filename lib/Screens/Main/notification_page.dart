// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import '../../Widgets/notification_tile.dart';
class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Container(
      //     alignment: Alignment(-1,0),
      //     child: Text('Notifications', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
      // ),
      body: Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blue,
              pinned: true,
              // floating: true,
              // title: Text('hello'),
              automaticallyImplyLeading: false,
              expandedHeight: 60,
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text('Notifications', style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  NotificationTile(h: h),
                  NotificationTile(h: h),
                  NotificationTile(h: h),
                  NotificationTile(h: h),
                  NotificationTile(h: h),
                  NotificationTile(h: h),
                  NotificationTile(h: h),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}