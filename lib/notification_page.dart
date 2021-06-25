// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({ Key key }) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('การแจ้งเตือน'),
          ],
        ),
        backgroundColor: Colors.green,
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.notifications), onPressed: (){print('alert notification');})
        // ],
      ),
      
    );
  }
}