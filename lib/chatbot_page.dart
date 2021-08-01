// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({Key key}) : super(key: key);

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.chevronCircleLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('ผู้ช่วยอัจฉริยะ'),
        backgroundColor: Color(0xFF57BD37),
        centerTitle: true,
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.notifications), onPressed: (){print('alert notification');})
        // ],
      ),
    );
  }
}
