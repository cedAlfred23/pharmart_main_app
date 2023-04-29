import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    Key? key,
    required this.h,
  }) : super(key: key);

  final double h;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: h * 0.08,
                decoration: const BoxDecoration(
                ),
                // color: Colors.amber,
                child: const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.notification_important_outlined),
                  ),
                  title: Text('Reminder'),
                  subtitle: Text('Have you taken your medecine today?'),
                ),
              ),
              const Divider(thickness: 1,)
            ],
          ),
        )
      ],
    );
  }
}