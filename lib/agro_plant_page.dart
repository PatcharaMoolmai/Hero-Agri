// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hero_agri/card/tile_card.dart';

// Project import

class AgroPlantPage extends StatelessWidget {
  const AgroPlantPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int plant_count = 0;
    List<Widget> weekPlantList = <Widget>[];
    while (plant_count < 5) {
      weekPlantList.add(
        TileCard(
          insets: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'หัวข้อ',
                style: TextStyle(
                    fontFamily: 'Anakotmai',
                    fontSize: 25,
                    color: Colors.amber,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                style: TextStyle(
                    fontFamily: 'Anakotmai',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      );
      plant_count++;
    }
    return Container(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text(
              'นวัตกรรมการเกษตร 52 สัปดาห์',
              style: TextStyle(
                  fontFamily: 'Anakotmai',
                  color: Colors.amber,
                  fontWeight: FontWeight.w500),
            ),
            backgroundColor: Color(0xFF57BD37),
            centerTitle: true,
          ),
          Expanded(
            // height: 500,
            child: ListView(
            children: weekPlantList,
          ),
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
