// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hero_agri/card/tile_card.dart';
// Project import

class ManageActioneePage extends StatefulWidget {
  const ManageActioneePage({Key key}) : super(key: key);

  @override
  _ManageActioneePageState createState() => _ManageActioneePageState();
}

class _ManageActioneePageState extends State<ManageActioneePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF57BD37),
      appBar: AppBar(
        title: Text(
          'จัดการผู้รับผิดชอบ',
          style: TextStyle(
              fontFamily: 'Anakotmai',
              fontSize: 20,
              color: Colors.amber,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: TileCard(
          padding: EdgeInsets.zero,
          elevation: 0,
          child: Column(),
        ),
      ),
    );
  }
}
