import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hero_agri/card/tile_card.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({this.index});

  final index;

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  // google maps
  Completer<GoogleMapController> _controller = Completer();
  double latitude = 37.42796133580664;
  double longtitude = -122.085749655962;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  // ActivityPage activityPage;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: FaIcon(FontAwesomeIcons.chevronCircleLeft),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Color(0xFF57BD37),
            // bottom: TabBar(
            //   indicator: BoxDecoration(color: Colors.white),
            //   tabs: <Widget>[
            //     Tab(
            //       child: Text('หมวดหมู่กิจกรรม'),
            //     ),
            //     Tab(
            //       child: Text('พื้นที่ของฉัน'),
            //     ),
            //     Tab(
            //       child: Text('พืช'),
            //     ),
            //   ],
            // ),
          ),
          body: Column(
            children: <Widget>[
              Container(
                  constraints: BoxConstraints(maxHeight: 150.0),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Material(
                      // color: Colors.indigo,

                      child: TabBar(
                        // isScrollable: true,
                        labelPadding: EdgeInsets.symmetric(horizontal: 10),
                        indicator: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        unselectedLabelColor: Colors.green,
                        tabs: [
                          Tab(
                            child: Text('หมวดหมู่กิจกรรม'),
                          ),
                          Tab(
                            child: Text('พื้นที่ของฉัน'),
                          ),
                          Tab(
                            child: Text('พืช'),
                          ),
                        ],
                      ),
                    ),
                  )),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(child: manageActivity()),
                    Center(child: mapActivity()),
                    Center(child: managePlant()),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget manageActivity() {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final List<String> activityList = [
      'การดูแลรักษา',
      'การป้องกัน',
      'การพยากรณ์',
      'กิจกรรมพิเศษ'
    ];
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'กิจกรรม',
            style: TextStyle(
                fontFamily: 'Anakotmai',
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                // enlargeCenterPage: true,
                enableInfiniteScroll: false,
                height: height * 0.7,
                // initialPage: 1,
                // autoPlay: true,
              ),
              items: activityList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        child: Column(
                      children: <Widget>[
                        Container(
                          child: TileCard(
                            insets: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        'สัปดาห์ที่ ${activityList.indexOf(i) + 1} :',
                                        style: TextStyle(
                                          fontFamily: 'Anakotmai',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: TileCard(
                                        elevation: 0,
                                        insets: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'ระยะเวลา...',
                                          style: TextStyle(
                                            fontFamily: 'Anakotmai',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TileCard(
                                    elevation: 0,
                                    insets: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    child: ListTile(
                                      title: Text(
                                        '$i',
                                        style: TextStyle(
                                          fontFamily: 'Anakotmai',
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      leading:
                                          FaIcon(FontAwesomeIcons.dotCircle),
                                    ))
                              ],
                            ),
                            padding: EdgeInsets.all(2),
                            color: Color(0xFF57BD37),
                          ),
                        ),
                        Container(
                          height: height * 0.45,
                          width: width,
                          child: TileCard(
                              child: Container(
                            height: height * 0.4,
                            child: ListView(
                              children: <Widget>[
                                // plot activity list
                                TileCard(
                                    elevation: 0,
                                    color: Color(0xFFE4F3DA),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Flexible(
                                            child: Text(
                                          'แปลงย่อยที่ 1',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                        Flexible(
                                            child: Column(
                                          children: <Widget>[
                                            Text(
                                              'จำนวน',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              'x กก.',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF57BD37)),
                                            )
                                          ],
                                        )),
                                        Flexible(
                                            child: Column(
                                          children: <Widget>[
                                            Text(
                                              'ประเภท',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              'ชีวภาพ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF57BD37)),
                                            )
                                          ],
                                        )),
                                      ],
                                    )),
                                // Actionee
                                Text(
                                  'ผู้รับผิดชอบ',
                                  style: TextStyle(
                                      color: Color(0xFF57BD37),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text('นาย ก',
                                            style: TextStyle(
                                                color: Color(0xFF57BD37),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18)),
                                        subtitle: Text('เบอร์โทร',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18)),
                                        leading: FaIcon(
                                          FontAwesomeIcons.userCircle,
                                          color: Color(0xFF57BD37),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                TileCard(
                                    elevation: 0,
                                    color: Color(0xFFE4F3DA),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Flexible(
                                            child: Text(
                                          'แปลงย่อยที่ 2',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                        Flexible(
                                            child: Column(
                                          children: <Widget>[
                                            Text(
                                              'จำนวน',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              'x กก.',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF57BD37)),
                                            )
                                          ],
                                        )),
                                        Flexible(
                                            child: Column(
                                          children: <Widget>[
                                            Text(
                                              'ประเภท',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              'ชีวภาพ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF57BD37)),
                                            )
                                          ],
                                        )),
                                      ],
                                    )),
                              ],
                            ),
                          )),
                        )
                      ],
                    ));
                  },
                );
              }).toList(),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ActivityPage()));
            },
          )
        ],
      ),
    );
  }

  Widget mapActivity() {
    final double height = MediaQuery.of(context).size.height;
    return // Map Location
        Container(
      height: height * 0.8,
      child: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Widget managePlant() {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            Container(
              width: width * 0.5,
              child: TileCard(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TileCard(
                    child: Text('รูปต้นไม้'),
                    color: Colors.lightGreen,
                  ),
                  Column(
                    children: [
                      Text('ชนิดพืช',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey[600])),
                      Text('data',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Color(0xFF57BD37))),
                      Text('พันธุ์พืช',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey[600])),
                      Text('data',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Color(0xFF57BD37)))
                    ],
                  )
                ],
              )),
            ),
            Container(
              width: width * 0.5,
              child: TileCard(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TileCard(
                    child: Text('รูปต้นไม้'),
                    color: Colors.lightGreen,
                  ),
                  Column(
                    children: [
                      Text('ชนิดพืช',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey[600])),
                      Text('data',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Color(0xFF57BD37))),
                      Text('พันธุ์พืช',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey[600])),
                      Text('data',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Color(0xFF57BD37)))
                    ],
                  )
                ],
              )),
            )
          ],
        ),
        Row(
          children: [
            Container(
              width: width * 0.5,
              child: TileCard(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TileCard(
                    child: Text('รูปต้นไม้'),
                    color: Colors.lightGreen,
                  ),
                  Column(
                    children: [
                      Text('ชนิดพืช',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey[600])),
                      Text('data',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Color(0xFF57BD37))),
                      Text('พันธุ์พืช',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey[600])),
                      Text('data',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Color(0xFF57BD37)))
                    ],
                  )
                ],
              )),
            ),
            Container(
              width: width * 0.5,
              child: TileCard(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TileCard(
                    child: Text('รูปต้นไม้'),
                    color: Colors.lightGreen,
                  ),
                  Column(
                    children: [
                      Text('ชนิดพืช',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey[600])),
                      Text('data',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Color(0xFF57BD37))),
                      Text('พันธุ์พืช',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey[600])),
                      Text('data',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Color(0xFF57BD37)))
                    ],
                  )
                ],
              )),
            )
          ],
        ),
        Row(
          children: [
            Container(
              width: width * 0.5,
              child: TileCard(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TileCard(
                    child: Text('รูปต้นไม้'),
                    color: Colors.lightGreen,
                  ),
                  Column(
                    children: [
                      Text('ชนิดพืช',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey[600])),
                      Text('data',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Color(0xFF57BD37))),
                      Text('พันธุ์พืช',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey[600])),
                      Text('data',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Color(0xFF57BD37)))
                    ],
                  )
                ],
              )),
            ),
          ],
        )
      ],
    ));
  }
}
