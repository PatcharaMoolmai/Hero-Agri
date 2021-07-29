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

  Future<String> loadJsonData() async {
    var jsonText =
        await rootBundle.loadString('assets/json/plot_activity.json');
    setState(() => data = json.decode(jsonText));
    return 'success';
  }

  Future<List<ActivityModel>> readJsonData() async {
    //read json file
    final jsondata =
        await rootBundle.loadString('assets/json/plot_activity.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;
    //map json and initialize using DataModel
    return list.map((e) => ActivityModel.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
    this.readJsonData();
  }

  @override
  Widget build(BuildContext context) {
    List activityCaring = data[0]["activity_caring"];
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
                      'สัปดาห์ที่ 1',
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
                  activityTable(),

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
    // hard code BRUH fix!!
    List activityCaring = data[0]["activity_caring"];
    List activityWeathering = data[0]["activity_weathering"];
    List activityProtection = data[0]["activity_protection"];
    List activitySpecial = data[0]["activity_special"];
    final double width = MediaQuery.of(context).size.width;
    return Container(
        child: Table(
            // border: TableBorder.all(width: 1.0, color: Colors.black),
            border: TableBorder.symmetric(
                inside: BorderSide(
              width: 1,
              color: Color(0xFF57BD37),
            )),
            // border: TableBorder(
            //     verticalInside: BorderSide(
            //         width: 1,
            //         color: Color(0xFF57BD37),
            //         style: BorderStyle.solid)),
            children: [
          for (int i = 0; i < 52; i++)
            TableRow(children: [
              TableCell(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text('สัปดาห์ที้่ ${i + 1}'),
                    VerticalDivider(),
                    GestureDetector(
                      child: Column(
                        children: [
                          // Special
                          Container(
                            width: width * 0.5,
                            child: TileCard(
                              elevation: 0,
                              color: Colors.blue[400],
                              borderRadius: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'กิจกรรมพิเศษ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // should be listview
                                  TileCard(
                                      borderRadius: 50,
                                      insets: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      color: Colors.blue[200],
                                      child: Text(activitySpecial[0]['th_name'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500)))
                                ],
                              ),
                            ),
                          ),
                          // Caring
                          Container(
                            width: width * 0.5,
                            child: TileCard(
                              elevation: 0,
                              color: Color(0xFF57BD37),
                              borderRadius: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'การดูแลรักษา',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // should be listview
                                  Container(
                                    height: 40,
                                    width: width * 0.2,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        TileCard(
                                            borderRadius: 50,
                                            insets: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 5),
                                            color: Colors.lightGreenAccent[700],
                                            child: Text(
                                                activityCaring[0]['th_name'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500))),
                                        TileCard(
                                            borderRadius: 50,
                                            insets: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 5),
                                            color: Colors.lightGreenAccent[700],
                                            child: Text(
                                                activityCaring[1]['th_name'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500))),
                                        TileCard(
                                            borderRadius: 50,
                                            insets: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 5),
                                            color: Colors.lightGreenAccent[700],
                                            child: Text(
                                                activityCaring[2]['th_name'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500))),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // Weathering
                          Container(
                            width: width * 0.5,
                            child: TileCard(
                              elevation: 0,
                              color: Colors.brown[400],
                              borderRadius: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'การดูแลรักษา',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // should be listview
                                  Container(
                                    height: 40,
                                    width: width * 0.2,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        TileCard(
                                            borderRadius: 50,
                                            insets: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 5),
                                            color: Colors.grey,
                                            child: Text(
                                                activityWeathering[0]
                                                    ['th_name'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500)))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // Caring
                          Container(
                            width: width * 0.5,
                            child: TileCard(
                              elevation: 0,
                              color: Colors.amber,
                              borderRadius: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'การดูแลรักษา',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // should be listview
                                  Container(
                                    height: 40,
                                    width: width * 0.2,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        TileCard(
                                            borderRadius: 50,
                                            insets: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 5),
                                            color: Colors.amber[300],
                                            child: Text(
                                                activityProtection[0]
                                                    ['th_name'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500))),
                                        TileCard(
                                            borderRadius: 50,
                                            insets: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 5),
                                            color: Colors.amber[300],
                                            child: Text(
                                                activityProtection[1]
                                                    ['th_name'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500))),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyPlotManagement()));
                      },
                    )
                  ],
                ),
              ))
            ])
        ]));
  }
}
