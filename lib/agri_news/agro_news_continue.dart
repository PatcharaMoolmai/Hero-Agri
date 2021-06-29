// Package imports
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hero_agri/card/tile_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgroNewsContinuous extends StatelessWidget {
  const AgroNewsContinuous({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEE04B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TileCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'หัวข้อข่าว 1',
                    style: TextStyle(
                        fontFamily: 'Anakotmai',
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Colors.green),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${DateTime.now()}',
                    style: TextStyle(
                        fontFamily: 'Anakotmai',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.green[700]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    style: TextStyle(
                      fontFamily: 'Anakotmai',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.all(0),
              insets: EdgeInsets.all(20),
            )
          ],
        ),
      ),
    );
  }
}
