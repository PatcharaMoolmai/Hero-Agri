import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hero_agri/card/tile_card.dart';
import 'package:hero_agri/data_model/activity_model.dart';
import 'package:hero_agri/plot_action/action_history.dart';
import 'package:hero_agri/plot_action/my_plot_continuous.dart';
import 'package:intl/intl.dart';

class CustomizePlot extends StatefulWidget {
  const CustomizePlot({Key key}) : super(key: key);

  @override
  _CustomizePlotState createState() => _CustomizePlotState();
}

class _CustomizePlotState extends State<CustomizePlot> {
  List data;
  List _activityCaring;
  List _activityProtection;
  List _activityWeathering;
  List _activitySpecial;

  Future<String> loadJsonData() async {
    var jsonText =
        await rootBundle.loadString('assets/json/plot_activity.json');
    setState(() => data = json.decode(jsonText));
    return 'success';
  }

  Future<void> readJsonData() async {
    //read json file
    final String response =
        await rootBundle.loadString('assets/json/plot_activity.json');
    final _data = await json.decode(response);
    setState(() {
      _activityCaring = _data[0]["activity_caring"];
      _activityProtection = _data[0]["activity_protection"];
      _activityWeathering = _data[0]["activity_weathering"];
      _activitySpecial = _data[0]["activity_special"];
    });
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
    this.readJsonData();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    print(_activityWeathering);
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
      body: Column(
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
                      // Need to flexible
                      'สัปดาห์ที่ 11',
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
                  // Text(activityCaring[0]['th_name'].toString()),
                  // Text(activityCaring[1]['th_name'].toString()),
                  // Text(activityCaring[2]['th_name'].toString()),

                  // read json flexible (unsuccess rn)
                  // FutureBuilder(
                  //     future: readJsonData(),
                  //     builder: (context, data) {
                  //       if (data.hasError) {
                  //         return Center(child: Text("${data.error}"));
                  //       } else if (data.hasData) {
                  //         var items = data.data as List<ActivityModel>;
                  //         print(items);
                  //         return Text(items.length.toString());
                  //       } else {
                  //         // show circular progress while data is getting fetched from json file
                  //         return Center(
                  //           child: CircularProgressIndicator(),
                  //         );
                  //       }
                  //     }),
                  // Method was call on null in THIS FIX RN!!!!
                  Container(
                    height: height * 0.58,
                    child: ListView(
                      children: [activityTable()],
                    ),
                  )

                  // TextButton(
                  //     child: Text('Plot action (Temporaly)'),
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => MyPlotManagement()));
                  //     })
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
    int count = 0;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
        child: Table(
            // border: TableBorder.all(width: 1.0, color: Colors.black),
            border: TableBorder.symmetric(
                inside: BorderSide(
              width: 1,
              color: Color(0xFF57BD37).withOpacity(0.7),
            )),
            children: [
          for (int i = 0; i < 52; i++)
            TableRow(children: [
              TableCell(
                  child: Container(
                // This week check
                color: i == 10 ? Colors.green[700] : Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 8,
                        // with time checking
                        child: new Text(
                          'สัปดาห์ที่ ${i + 1}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: i == 10
                                  ? Colors.amber
                                  : Color(0xFF57BD37)
                                      .withOpacity(i < 10 ? 0.5 : 1)),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      // Container(
                      //     // height: height * 0.15,
                      //     child: VerticalDivider(color: Color(0xFF57BD37))),
                      Flexible(
                          flex: 16,
                          child: GestureDetector(
                            child: activityDetail(i),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyPlotManagement()));
                            },
                          ))
                    ],
                  ),
                ),
              )),
            ])
        ]));
  }

  Widget activityDetail(int index) {
    List<Widget> activityDetail = [];
    if (index % 4 <= 2) {
      activityDetail.add(activityProtection(index));
    }
    if (index % 4 <= 1) {
      activityDetail.add(activityWeathering(index));
    }
    if (index % 4 == 0) {
      activityDetail.add(activitySpecial(index));
    }
    if (index % 4 <= 3) {
      activityDetail.add(activityCaring(index));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: activityDetail,
    );
  }

  // Caring part
  Widget activityCaring(int index) {
    final double width = MediaQuery.of(context).size.width;
    List<Widget> rowActivity = [];

    double opacity;
    if (index < 10) {
      opacity = 0.5;
    } else {
      opacity = 1;
    }

    if (index % 3 <= 1) {
      rowActivity.add(TileCard(
          borderRadius: 50,
          elevation: 0,
          insets: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: Colors.lightGreenAccent[700].withOpacity(opacity),
          child: Text(_activityCaring[0]["th_name"],
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500))));
    }
    if (index % 3 <= 2) {
      rowActivity.add(TileCard(
          borderRadius: 50,
          elevation: 0,
          insets: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: Colors.lightGreenAccent[700].withOpacity(opacity),
          child: Text(_activityCaring[1]["th_name"],
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500))));
    }
    if (index % 3 == 0) {
      rowActivity.add(TileCard(
          borderRadius: 50,
          elevation: 0,
          insets: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: Colors.lightGreenAccent[700].withOpacity(opacity),
          child: Text(_activityCaring[2]["th_name"],
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500))));
    }
    return Container(
        constraints: BoxConstraints(maxWidth: width * 0.8),
        // width: width * 0.6,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: TileCard(
            insets: EdgeInsets.symmetric(horizontal: 10),
            elevation: 0,
            color: Color(0xFF57BD37).withOpacity(opacity),
            borderRadius: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'การดูแลรักษา',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: rowActivity,
                )
              ],
            ),
          ),
        ));
  }

  // Protection Part
  Widget activityProtection(int index) {
    final double width = MediaQuery.of(context).size.width;
    List<Widget> rowActivity = [];

    double opacity;
    if (index < 10) {
      opacity = 0.5;
    } else {
      opacity = 1;
    }

    if (index % 2 <= 1) {
      rowActivity.add(TileCard(
          borderRadius: 50,
          elevation: 0,
          insets: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: Colors.amber[300].withOpacity(opacity),
          child: Text(_activityProtection[0]["th_name"],
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500))));
    }
    if (index % 2 == 0) {
      rowActivity.add(TileCard(
          borderRadius: 50,
          elevation: 0,
          insets: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: Colors.amber[300].withOpacity(opacity),
          child: Text(_activityProtection[1]["th_name"],
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500))));
    }
    return Container(
        // width: width * 0.5,
        constraints: BoxConstraints(maxWidth: width * 0.8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: TileCard(
            insets: EdgeInsets.symmetric(horizontal: 10),
            elevation: 0,
            color: Colors.amber.withOpacity(opacity),
            borderRadius: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'การป้องกัน',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: rowActivity,
                )
              ],
            ),
          ),
        ));
  }

  // Weathering Part
  Widget activityWeathering(int index) {
    final double width = MediaQuery.of(context).size.width;
    List<Widget> rowActivity = [];

    double opacity;
    if (index < 10) {
      opacity = 0.5;
    } else {
      opacity = 1;
    }

    // method
    rowActivity.add(TileCard(
        borderRadius: 50,
        elevation: 0,
        insets: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: Colors.grey.withOpacity(opacity),
        child: Text(_activityWeathering[0]["th_name"],
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w500))));
    return Container(
        // width: width * 0.5,
        constraints: BoxConstraints(maxWidth: width * 0.8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: TileCard(
            insets: EdgeInsets.symmetric(horizontal: 10),
            elevation: 0,
            color: Colors.brown[400].withOpacity(opacity),
            borderRadius: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'การพยากรณ์',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: rowActivity,
                )
              ],
            ),
          ),
        ));
  }

  // Special Part
  Widget activitySpecial(int index) {
    final double width = MediaQuery.of(context).size.width;
    List<Widget> rowActivity = [];

    double opacity;
    if (index < 10) {
      opacity = 0.5;
    } else {
      opacity = 1;
    }

    rowActivity.add(TileCard(
        borderRadius: 50,
        insets: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: Colors.blue[200].withOpacity(opacity),
        child: Text(_activitySpecial[0]["th_name"],
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w500))));
    return Container(
        // width: width * 0.5,
        constraints: BoxConstraints(maxWidth: width * 0.8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: TileCard(
            insets: EdgeInsets.symmetric(horizontal: 10),
            elevation: 0,
            color: Colors.blue[400].withOpacity(opacity),
            borderRadius: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'กิจกรรมพิเศษ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: rowActivity,
                )
              ],
            ),
          ),
        ));
  }
}
