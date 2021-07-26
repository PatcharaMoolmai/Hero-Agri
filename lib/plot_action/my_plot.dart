import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hero_agri/card/tile_card.dart';
import 'package:hero_agri/plot_action/action_history.dart';
import 'package:hero_agri/plot_action/my_plot_continuous.dart';
import 'package:intl/intl.dart';

class CustomizePlot extends StatefulWidget {
  const CustomizePlot({Key key}) : super(key: key);

  @override
  _CustomizePlotState createState() => _CustomizePlotState();
}

class _CustomizePlotState extends State<CustomizePlot> {
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
          'แปลงเพาะปลูกของฉัน',
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlotActionHistory()));
                },
                child: FaIcon(
                  FontAwesomeIcons.history,
                  color: Colors.amber,
                ),
              )),
        ],
      ),
      body: ListView(
        children: <Widget>[
          // Top body
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'สัปดาห์ที่ n',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF2E964C)),
                    ),
                    Text(
                      '${DateFormat.yMMMd().format(DateTime.now())}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF2E964C)),
                    ),
                  ],
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
                            'บันทึกกิจกรรม/เหตุการณ์',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFF2E964C)),
                          ),
                        ],
                      )),
                ))
              ],
            ),
          ),
          TileCard(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  plantDetail(),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: Color(0xFF2E964C),
                  ),
                  // activityTable(),
                  TextButton(
                      child: Text('Plot action (Temporaly)'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyPlotManagement()));
                      })
                ],
              ))
        ],
      ),
    );
  }

  Widget plantDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.zero,
              child: Text(
                'แปลงย่อยที่ 1',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF57BD37),
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'พันธ์พืช',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF57BD37),
                      fontWeight: FontWeight.w500),
                ),
                Text('หมอนทอง'),
                // SizedBox(
                //   width: 115,
                // )
              ],
            )
          ],
        )),
        Flexible(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'สถานะพืช',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF57BD37),
                    fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.circle,
                    size: 15,
                    color: Color(0xFF57BD37),
                  ),
                  Text('ปกติ')
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget activityTable() {
    // List<Widget> tableWidget = [];
    // int weekCount = 0;
    // while (weekCount < 52) {
    //   tableWidget.add(Table());
    // }
    // return Table();
  }
}

class Table {
  int id;
  String activity;
}
