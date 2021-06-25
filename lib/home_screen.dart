// Package imports
import 'package:hero_agri/chatbot_page.dart';
import 'package:hero_agri/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color appBarGreen = const Color.fromARGB(87, 189, 55, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: IconButton(
                  icon: Icon(Icons.file_copy),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatbotPage()));
                    print('alert chatbot');
                  }),
            ),
            // Text('Hero Agri logo'),
            Image.asset('assets/image/logo.png',height: 50,),
            Container(
              child: IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationPage()));
                    print('alert notification');
                  }),
            ),
          ],
        ),
        backgroundColor: Color(0xFF57BD37),
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.notifications), onPressed: (){print('alert notification');})
        // ],
      ),
    );
  }
}
