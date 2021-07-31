import "dart:convert";

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hero_agri/card/tile_card.dart';
import 'package:hero_agri/marketplace/marketplace_page.dart';
import 'package:hero_agri/navigator_tab_bar.dart';
import 'package:hero_agri/plot_action/plot_information.dart';

class MyPlotManagement extends StatefulWidget {
  const MyPlotManagement({Key key}) : super(key: key);

  @override
  _MyPlotManagementState createState() => _MyPlotManagementState();
}

class _MyPlotManagementState extends State<MyPlotManagement> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
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
          'แปลงเพาะปลูกของฉัน',
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          TileCard(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  upperSector(),
                  SizedBox(
                    height: 15,
                  ),
                  // Divider(
                  //   color: Color(0xFF2E964C),
                  // ),
                  activitySection()
                ],
              )),
          SizedBox(
            height: height * 0.1,
          ),
          GestureDetector(
            child: Image.asset('assets/image/button/add_activity_btn.png'),
          )
        ],
      ),
    );
  }

  Widget upperSector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          flex: 0,
          child: Container(
              width: 80,
              child: CircleAvatar(
                backgroundColor: Colors.green[50],
                child: FaIcon(
                  FontAwesomeIcons.appleAlt,
                  color: Colors.green[800],
                ),
              )),
        ),
        Flexible(
            // flex: 0,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'แปลงย่อยที่ 1',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF57BD37),
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      child: FaIcon(
                        FontAwesomeIcons.ellipsisV,
                        color: Color(0xFF57BD37),
                        size: 20,
                      ),
                      onTap: () {},
                    ),
                  ],
                )),
            // Plant type & status
            Row(
              children: <Widget>[
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'ชนิดพืช',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF57BD37),
                            fontWeight: FontWeight.w500),
                      ),
                      Text('ทุเรียน')
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'สถานะพืช',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF57BD37),
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.circle,
                        size: 15,
                        color: Color(0xFF57BD37),
                      ),
                      Text('ปกติ')
                    ],
                  ),
                )
              ],
            ),
            // Plant age & area
            Row(
              children: <Widget>[
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'อายุ',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF57BD37),
                            fontWeight: FontWeight.w500),
                      ),
                      Text(' 0 ปี 0 เดือน')
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'พื้นที่',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF57BD37),
                            fontWeight: FontWeight.w500),
                      ),
                      Text('0 ไร่')
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'พื้นที่',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF57BD37),
                      fontWeight: FontWeight.w500),
                ),
                Text('ตำแหน่งที่ตั้ง'),
                SizedBox(
                  width: 115,
                )
              ],
            )
          ],
        ))
      ],
    );
  }

  Widget activitySection() {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.4,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.dotCircle,
                    color: Color(0xFF57BD37),
                  ),
                  title: Text(
                    'การดูแลรักษา',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  subtitle: Text('ประจำวันที่ xxx'),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.dotCircle,
                    color: Color(0xFFF0972A),
                  ),
                  title: Text(
                    'ป้องกัน/กำจัดศัตรูพืช',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  subtitle: Text('ประจำวันที่ xxx'),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.dotCircle,
                    color: Color(0xFF776D60),
                  ),
                  title: Text(
                    'การพยากรณ์',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  subtitle: Text('ประจำวันที่ xxx'),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlotInformation()));
                  },
                  child: Image.asset(
                    'assets/image/button/more_plot_info_btn.png',
                    scale: 1.1,
                  )),
              TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MarketplacePage()));
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => HomePageTabbar(
                                  index: 2,
                                )),
                        (route) => false);
                  },
                  child: Image.asset(
                    'assets/image/button/find_production_factor_btn.png',
                    scale: 1.1,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
