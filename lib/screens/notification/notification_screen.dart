import 'package:flutter/material.dart';
import 'package:sp_manager/screens/home/main_home_screen.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notification'),
        backgroundColor: Colors.purple[900],
        leading: Container(
          padding: EdgeInsets.only(
              top: 5
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.navigate_before,size: 30),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainHomeScreen()),
                  );
                },
              ),
            ],
          ),
        )
      ),
      body: Container(
        child: Text('Notification List'),
      ),
    );
  }
}
