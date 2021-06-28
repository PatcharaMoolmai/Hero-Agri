// Package imports
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hero_agri/agri_news/agro_news_continue.dart';
import 'package:hero_agri/card/tile_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgroNewsPage extends StatefulWidget {
  const AgroNewsPage({Key key}) : super(key: key);

  @override
  _AgroNewsPageState createState() => _AgroNewsPageState();
}

class _AgroNewsPageState extends State<AgroNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ข่าวสาร',
          style: TextStyle(
              fontFamily: 'Anakotmai',
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white),
        ),
        // leading: IconButton(
        //   icon: FaIcon(FontAwesomeIcons.chevronCircleLeft),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        centerTitle: true,
        backgroundColor: Color(0xFF57BD37),
      ),
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
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(child: buildNews()),
            // GestureDetector(
            //   child: Expanded(child: buildNews()),
            //   // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AgroNewsPage()));},
            // )
          ],
        ),
      ),
    );
  }

  Widget buildNews() {
    return ListView(
      children: <Widget>[
        GestureDetector(
            child: TileCard(
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
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                    style: TextStyle(
                      fontFamily: 'Anakotmai',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              padding: EdgeInsets.all(15),
              insets: EdgeInsets.all(20),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AgroNewsContinuous()));
            }),
        TileCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'หัวข้อข่าว 2',
                style: TextStyle(
                    fontFamily: 'Anakotmai',
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.green),
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                style: TextStyle(
                  fontFamily: 'Anakotmai',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              )
            ],
          ),
          padding: EdgeInsets.all(15),
          insets: EdgeInsets.all(20),
        ),
      ],
    );
  }
}
