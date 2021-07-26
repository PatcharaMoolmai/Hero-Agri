import "dart:convert";

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hero_agri/card/tile_card.dart';

class PlotActionHistory extends StatefulWidget {
  const PlotActionHistory({Key key}) : super(key: key);

  @override
  _PlotActionHistoryState createState() => _PlotActionHistoryState();
}

class _PlotActionHistoryState extends State<PlotActionHistory> {
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
        backgroundColor: Color(0xFF57BD37),
        title: Text(
          'ประวัติกิจกรรม',
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
      ),
    );
  }
}
