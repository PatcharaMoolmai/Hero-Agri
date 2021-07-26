import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hero_agri/card/tile_card.dart';

class PlotInformation extends StatefulWidget {
  const PlotInformation({Key key}) : super(key: key);

  @override
  _PlotInformationState createState() => _PlotInformationState();
}

class _PlotInformationState extends State<PlotInformation> {
  // Google maps API
  Completer<GoogleMapController> _controller = Completer();
  double latitude = 37.42796133580664;
  double longtitude = -122.085749655962;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

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
          'ข้อมูลพื้นที่เพาะปลูก',
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // Map Location
                Container(
                  height: height * 0.2,
                  child: GoogleMap(
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TileCard(
                    child: Text('a'),
                  ),
                )
              ],
            ),
            // Pic
            // Meter
            Container(
              height: height * 0.69,
              child: ListView(
                children: [plotMeterGauge(), plotMeter(), plotGraph()],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget plotMeterGauge() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // Rain meter
        Container(
          // width: 180,
          child: TileCard(
            padding: EdgeInsets.all(5),
            insets: EdgeInsets.all(10),
            borderRadius: 2,
            child: Column(
              children: [
                Text(
                  'ปริมาณน้ำฝน',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Color(0xFF57BD37)),
                ),
                Container(
                  height: 150,
                  child: FAProgressBar(
                    size: 30,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      // color: Color(0xFF57BD37),
                      color: Colors.grey[400],
                      width: 0.5,
                    ),
                    progressColor: Colors.lightBlue[400],
                    direction: Axis.vertical,
                    verticalDirection: VerticalDirection.up,
                    currentValue: 80,
                  ),
                )
              ],
            ),
          ),
        ),

        // moisture meter
        Container(
          // width: 180,
          child: TileCard(
            padding: EdgeInsets.all(5),
            insets: EdgeInsets.all(10),
            borderRadius: 2,
            child: Column(
              children: [
                Text(
                  'ปริมาณความชื้น',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Color(0xFF57BD37)),
                ),
                Container(
                  height: 150,
                  child: FAProgressBar(
                    size: 30,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      // color: Color(0xFF57BD37),
                      color: Colors.grey[400],
                      width: 0.5,
                    ),
                    progressColor: Color(0xFF57BD37),
                    direction: Axis.vertical,
                    verticalDirection: VerticalDirection.up,
                    currentValue: 80,
                  ),
                )
              ],
            ),
          ),
        ),
        // temp meter
        Container(
          // width: 180,
          child: TileCard(
            padding: EdgeInsets.all(5),
            insets: EdgeInsets.all(10),
            borderRadius: 2,
            child: Column(
              children: [
                Text(
                  'อุณหภูมิ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Color(0xFF57BD37)),
                ),
                Container(
                  height: 150,
                  child: FAProgressBar(
                    size: 30,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      // color: Color(0xFF57BD37),
                      color: Colors.grey[400],
                      width: 0.5,
                    ),
                    progressColor: Colors.red[300],
                    direction: Axis.vertical,
                    verticalDirection: VerticalDirection.up,
                    currentValue: 80,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget plotMeter() {
    return Column(
      children: <Widget>[
        // temperature
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TileCard(
              padding: EdgeInsets.all(2),
              insets: EdgeInsets.all(10),
              borderRadius: 2,
              child: Column(
                children: [
                  Text(
                    '01N-PYO-C',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Color(0xFF57BD37)),
                  ),
                  FaIcon(
                    FontAwesomeIcons.temperatureHigh,
                    color: Color(0xFF57BD37),
                  ),
                  Text(
                    '33.5 °C',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xFF57BD37)),
                  )
                ],
              ),
            ),
            // moisture
            TileCard(
              padding: EdgeInsets.all(2),
              insets: EdgeInsets.all(10),
              borderRadius: 2,
              child: Column(
                children: [
                  Text(
                    '01N-EM5',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Color(0xFF57BD37)),
                  ),
                  FaIcon(
                    FontAwesomeIcons.water,
                    color: Colors.lightBlue[400],
                  ),
                  Text(
                    '39.5%',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xFF57BD37)),
                  )
                ],
              ),
            ),
            // don't know yet
            TileCard(
              padding: EdgeInsets.all(2),
              insets: EdgeInsets.all(10),
              borderRadius: 2,
              child: Column(
                children: [
                  Text(
                    '01N-PYO-C',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Color(0xFF57BD37)),
                  ),
                  FaIcon(
                    FontAwesomeIcons.thLarge,
                    color: Color(0xFF57BD37),
                  ),
                  Text(
                    '0 mm',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xFF57BD37)),
                  )
                ],
              ),
            ),
            // CO2 need icon
            TileCard(
              padding: EdgeInsets.all(2),
              insets: EdgeInsets.all(10),
              borderRadius: 2,
              child: Column(
                children: [
                  Text(
                    '01N-PYO-C',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Color(0xFF57BD37)),
                  ),
                  FaIcon(
                    FontAwesomeIcons.cloudMeatball,
                    color: Color(0xFF57BD37),
                  ),
                  Text(
                    '291 ppm',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xFF57BD37)),
                  )
                ],
              ),
            ),
          ],
        ),
        // Meter Row 2
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // temp
            TileCard(
              padding: EdgeInsets.all(2),
              insets: EdgeInsets.all(10),
              borderRadius: 2,
              child: Column(
                children: [
                  Text(
                    '01N-PYO-E',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Color(0xFF57BD37)),
                  ),
                  FaIcon(
                    FontAwesomeIcons.temperatureHigh,
                    color: Color(0xFF57BD37),
                  ),
                  Text(
                    '33.5 °C',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xFF57BD37)),
                  )
                ],
              ),
            ),
            // water
            TileCard(
              padding: EdgeInsets.all(2),
              insets: EdgeInsets.all(10),
              borderRadius: 2,
              child: Column(
                children: [
                  Text(
                    '01N-PYO-E',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Color(0xFF57BD37)),
                  ),
                  FaIcon(
                    FontAwesomeIcons.water,
                    color: Colors.lightBlue[400],
                  ),
                  Text(
                    '33.5 °C',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xFF57BD37)),
                  )
                ],
              ),
            ),
            // electricity
            Container(
              width: 180,
              child: TileCard(
                padding: EdgeInsets.all(2),
                insets: EdgeInsets.all(10),
                borderRadius: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '01N-PYO-E',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF57BD37)),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.bolt,
                          color: Color(0xFF57BD37),
                        ),
                        Text(
                          '33.5 °C',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF57BD37)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        // Meter Row 3
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // light
            Container(
              width: 180,
              child: TileCard(
                padding: EdgeInsets.all(2),
                insets: EdgeInsets.all(10),
                borderRadius: 2,
                child: Column(
                  children: [
                    Text(
                      '01N-PYO-E',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF57BD37)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.sun,
                          color: Colors.amber,
                        ),
                        Text(
                          '62690 lux',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF57BD37)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            // wind
            Container(
              width: 180,
              child: TileCard(
                padding: EdgeInsets.all(2),
                insets: EdgeInsets.all(10),
                borderRadius: 2,
                child: Column(
                  children: [
                    Text(
                      '01N-PYO-E',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF57BD37)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.wind,
                          color: Colors.lightBlue[400],
                        ),
                        Text(
                          '959.5 hPa',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF57BD37)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        // Meter Row 4
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 180,
              child: TileCard(
                padding: EdgeInsets.all(2),
                insets: EdgeInsets.all(10),
                borderRadius: 2,
                child: Column(
                  children: [
                    Text(
                      '01N-PYO-E',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF57BD37)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.thLarge,
                          color: Color(0xFF57BD37),
                        ),
                        Text(
                          '959.5 hPa',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF57BD37)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 180,
              child: TileCard(
                padding: EdgeInsets.all(2),
                insets: EdgeInsets.all(10),
                borderRadius: 2,
                child: Column(
                  children: [
                    Text(
                      '01N-PYO-E',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF57BD37)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.thLarge,
                          color: Color(0xFF57BD37),
                        ),
                        Text(
                          '959.5 hPa',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF57BD37)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        // Meter Row 5
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 180,
              child: TileCard(
                padding: EdgeInsets.all(2),
                insets: EdgeInsets.all(10),
                borderRadius: 2,
                child: Column(
                  children: [
                    Text(
                      '01N-PYO-E',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF57BD37)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.thLarge,
                          color: Color(0xFF57BD37),
                        ),
                        Text(
                          '959.5 hPa',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF57BD37)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 180,
              child: TileCard(
                padding: EdgeInsets.all(2),
                insets: EdgeInsets.all(10),
                borderRadius: 2,
                child: Column(
                  children: [
                    Text(
                      '01N-PYO-E',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF57BD37)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.thLarge,
                          color: Color(0xFF57BD37),
                        ),
                        Text(
                          '959.5 hPa',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF57BD37)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget plotGraph() {
    return Column(
      children: <Widget>[
        // Air graph
        Padding(
            // width: 180,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '01-PYO Air',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Color(0xFF57BD37)),
                ),
                Text(
                    'กราฟแสดงปริมาณสภาพอากาศ อุณหภูมิ ความชื้นและคาร์บอนไดออกไซด์',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Color(0xFF57BD37))),
                TileCard(
                  padding: EdgeInsets.all(5),
                  insets: EdgeInsets.all(10),
                  borderRadius: 2,
                  child: Column(
                    children: [
                      Text(
                        '01-PYO Air\'s Graph',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF57BD37)),
                      )
                    ],
                  ),
                ),
              ],
            )),
        // moisture graph
        Padding(
            // width: 180,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '01-PYO NPKC',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Color(0xFF57BD37)),
                ),
                Text('กราฟแสดงแร่ธาตุและการนำไฟฟ้าของดิน',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Color(0xFF57BD37))),
                TileCard(
                  padding: EdgeInsets.all(5),
                  insets: EdgeInsets.all(10),
                  borderRadius: 2,
                  child: Column(
                    children: [
                      Text(
                        '01-PYO NPKC\'s Graph',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF57BD37)),
                      )
                    ],
                  ),
                ),
              ],
            )),
        Padding(
            // width: 180,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '01-PYO SMTPH',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Color(0xFF57BD37)),
                ),
                Text('กราฟแสดงอุณหภูมิ ความชื้น และการนำไฟฟ้าของดิน',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Color(0xFF57BD37))),
                TileCard(
                  padding: EdgeInsets.all(5),
                  insets: EdgeInsets.all(10),
                  borderRadius: 2,
                  child: Column(
                    children: [
                      Text(
                        '01-PYO SMTPH\'s Graph',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF57BD37)),
                      )
                    ],
                  ),
                ),
              ],
            )),
        Padding(
            // width: 180,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '01-PYO Rain Light',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Color(0xFF57BD37)),
                ),
                TileCard(
                  padding: EdgeInsets.all(5),
                  insets: EdgeInsets.all(10),
                  borderRadius: 2,
                  child: Column(
                    children: [
                      Text(
                        '01-PYO Rain Light\'s Graph',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF57BD37)),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
