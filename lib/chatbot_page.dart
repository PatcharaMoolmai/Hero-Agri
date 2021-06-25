// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({ Key key }) : super(key: key);

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('ผู้ช่วยอัจฉริยะ'),
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