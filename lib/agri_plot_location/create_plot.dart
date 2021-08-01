// Package imports
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hero_agri/agri_plot_location/create_plot_continuous.dart';
import 'package:hero_agri/card/tile_card.dart';
import 'package:hero_agri/plot_action/manage_my_plot.dart';

class CreateMyPlotPage extends StatefulWidget {
  const CreateMyPlotPage({Key key}) : super(key: key);

  @override
  _CreateMyPlotPageState createState() => _CreateMyPlotPageState();
}

class _CreateMyPlotPageState extends State<CreateMyPlotPage> {
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.chevronCircleLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TileCard(
          insets: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'ละติจูด $latitude , ลองติจูด $longtitude',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Map Location
            Container(
              height: height * 0.5,
              child: GoogleMap(
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Expanded(
                child: Container(
              height: height,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  TileCard(
                    borderRadius: 0,
                    insets: EdgeInsets.all(20),
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Habitat
                        Row(
                          children: <Widget>[
                            Text(
                              'ที่อยู่',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                                child: TextField(
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Province
                        Row(
                          children: <Widget>[
                            Text(
                              'ตำบล',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: TextField(
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'อำเภอ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: TextField(
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'จังหวัด',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.w500),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(),
                        SizedBox(
                          height: 15,
                        ),
                        // Plant Size
                        Text(
                          'ขนาดพื้นที่เพาะปลูก',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.w500),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'ไร่',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.w500),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'งาน',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.w500),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'ตารางวา',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(),
                        SizedBox(
                          height: 15,
                        ),
                        // Plant Length
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'ระยะปลูก',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            Text(
                              'จำนวนต้นไม้ในแปลง',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.w500),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'เมตร',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.w500),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'ต้น',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            child:
                                Image.asset('assets/image/button/next_btn.png'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreatePlotCont()));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(height: 20,)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
