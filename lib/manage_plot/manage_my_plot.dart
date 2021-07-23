// Package import
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hero_agri/card/tile_card.dart';
import 'package:hero_agri/manage_plot/my_plot.dart';
import 'package:intl/intl.dart';

// Project import

class ManageMyPlot extends StatefulWidget {
  const ManageMyPlot({Key key}) : super(key: key);

  @override
  _ManageMyPlotState createState() => _ManageMyPlotState();
}

class _ManageMyPlotState extends State<ManageMyPlot> {
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
          'นวัตกรรมการเกษตร',
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: GestureDetector(
                onTap: () {},
                child: FaIcon(
                  FontAwesomeIcons.solidBell,
                  color: Colors.amber,
                ),
              )),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${DateFormat.yMMMd().format(DateTime.now())}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xFF2E964C)),
                ),
                GestureDetector(
                    child: TileCard(
                  elevation: 0,
                  color: Color(0xFF57BD37),
                  insets: EdgeInsets.all(1.5),
                  child: TileCard(
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      child: Row(
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.plus,
                            size: 20,
                            color: Color(0xFF2E964C),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'หมวดหมู่กิจกรรม',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color(0xFF2E964C)),
                          ),
                        ],
                      )),
                ))
              ],
            ),
          ),
          GestureDetector(
            child: myPlot(),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomizePlot()));
            },
          )
        ],
      ),
    );
  }

  Widget myPlot() {
    // For  the future
    List<Widget> myPlotList = <Widget>[];
    return Column(
      children: <Widget>[
        ListTile(
          leading: FaIcon(FontAwesomeIcons.seedling, color: Color(0xFF2E964C)),
          title: Text(
            'แปลงเพาะปลูกของฉัน',
            style: TextStyle(
                fontSize: 22,
                color: Color(0xFF2E964C),
                fontWeight: FontWeight.w500),
          ),
        ),
        TileCard(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            // insets: EdgeInsets.only(left: 20,right: 5,top: 15,bottom: 15),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 0,
                      child: Container(
                        width: 80,
                        child: TileCard(
                          child: FaIcon(
                            FontAwesomeIcons.appleAlt,
                            color: Colors.white,
                          ),
                          elevation: 0,
                          color: Color(0xFF57BD37),
                        ),
                      ),
                    ),
                    Flexible(
                        // flex: 0,
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Row(
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
                        ),
                        // Plant type & status
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(),
                SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                        child: CircleAvatar(
                      child: Image.asset(
                        'assets/image/robot.png',
                      ),
                      radius: 40,
                      backgroundColor: Colors.transparent,
                    )),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.green[100]),
                      padding:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                      child: Text(
                        'แปลงที่ 1 ติดดอก',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ))
      ],
    );
  }
}
