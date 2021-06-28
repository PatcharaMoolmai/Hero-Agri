// Package imports
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hero_agri/card/tile_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgroNewsContinuous extends StatelessWidget {
  const AgroNewsContinuous({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEE04B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text('Hello')
          ],
        ),
      ),
    );
  }
}