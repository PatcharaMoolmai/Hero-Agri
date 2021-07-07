// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hero_agri/card/tile_card.dart';
import 'package:hero_agri/card/tile_expandable.dart';
// Project import

class AddActioneePage extends StatefulWidget {
  const AddActioneePage({Key key}) : super(key: key);

  @override
  _AddActioneePageState createState() => _AddActioneePageState();
}

class _AddActioneePageState extends State<AddActioneePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF57BD37),
      appBar: AppBar(
        title: Text(
          'เพิ่มผู้รับผิดชอบ',
          style: TextStyle(
              fontFamily: 'Anakotmai',
              fontSize: 20,
              color: Colors.amber,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: TileCard(
          padding: EdgeInsets.zero,
          insets: EdgeInsets.symmetric(horizontal: 20),
          elevation: 0,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'ชื่อ-นามสกุล',
                      style: TextStyle(
                          fontFamily: 'Anakotmai',
                          fontSize: 20,
                          color: Color(0xFF57BD37),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(
                          fontFamily: 'Anakotmai',
                        ),
                        hintText: 'ชื่อ-สกุล',
                        filled: true,
                        fillColor: Color(0xFFF8F9F9),
                        labelStyle: TextStyle(
                            fontFamily: 'Anakotmai',
                            fontWeight: FontWeight.w500),
                        enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(5.0)
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'เบอร์โทรศัพท์',
                      style: TextStyle(
                          fontFamily: 'Anakotmai',
                          fontSize: 20,
                          color: Color(0xFF57BD37),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(
                          fontFamily: 'Anakotmai',
                        ),
                        hintText: 'เบอร์โทรศัพท์',
                        filled: true,
                        fillColor: Color(0xFFF8F9F9),
                        labelStyle: TextStyle(
                            fontFamily: 'Anakotmai',
                            fontWeight: FontWeight.w500),
                        enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(5.0)
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.zero,
                          child: Text(
                            'กิจกรรมที่รับมอบหมาย: ',
                            style: TextStyle(
                                fontFamily: 'Anakotmai',
                                fontSize: 20,
                                color: Color(0xFF57BD37),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        TileExpandableCard(
                            color: Color(0xFFF8F9F9),
                            elevation: 0,
                            collapsedHeader: Text('เลือก',
                                style: TextStyle(
                                  fontFamily: 'Anakotmai',
                                )),
                            child: Container()),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'แปลงย่อยที่รับผิดชอบ',
                      style: TextStyle(
                          fontFamily: 'Anakotmai',
                          fontSize: 20,
                          color: Color(0xFF57BD37),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TileExpandableCard(
                      color: Color(0xFFF8F9F9),
                      elevation: 0,
                      collapsedHeader: Text('เลือก',
                          style: TextStyle(
                            fontFamily: 'Anakotmai',
                          )),
                      child: Container()),
                  Container(
                    child: Text(
                      'บันทึกช่วยจำ',
                      style: TextStyle(
                          fontFamily: 'Anakotmai',
                          fontSize: 20,
                          color: Color(0xFF57BD37),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(
                          fontFamily: 'Anakotmai',
                        ),
                        filled: true,
                        fillColor: Color(0xFFF8F9F9),
                        labelStyle: TextStyle(
                            fontFamily: 'Anakotmai',
                            fontWeight: FontWeight.w500),
                        enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(5.0)
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              GestureDetector(
                child: Image.asset('assets/image/button/save_btn.png'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
