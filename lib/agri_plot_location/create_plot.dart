// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hero_agri/card/tile_card.dart';

// Project import

class CreateMyPlotPage extends StatefulWidget {
  const CreateMyPlotPage({Key key}) : super(key: key);

  @override
  _CreateMyPlotPageState createState() => _CreateMyPlotPageState();
}

class _CreateMyPlotPageState extends State<CreateMyPlotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.yellow,
            Colors.green,
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AppBar(
              title: TileCard(
                child: Text('ตำแหน่งที่ตั้ง'),
                elevation: 0,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            // Image.asset('')
          ],
        ),
      ),
    );
  }
}
