// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hero_agri/card/tile_card.dart';

// Project import

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF57BD37),
      child: Scaffold(
        backgroundColor: Color(0xFF57BD37),
        body: Container(
          child: ListView(
            children: <Widget>[
              Image.asset(
                'assets/image/logo.png',
                height: 130,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // height: 700,
                child: TileCard(
                    color: Colors.grey[100],
                    padding: EdgeInsets.all(0),
                    insets: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'รายละเอียดบัญชี',
                            style: TextStyle(
                                fontFamily: 'Anakotmai',
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        TileCard(
                            padding: EdgeInsets.all(5),
                            insets: EdgeInsets.symmetric(horizontal: 20),
                            elevation: 0,
                            child: Column(
                              children: <Widget>[
                                // Name
                                TextFormField(
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.account_circle,
                                        color: Color(0xFF57BD37),
                                      ),
                                      hintStyle: TextStyle(
                                        fontFamily: 'Anakotmai',
                                      ),
                                      hintText: 'ชื่อ-สกุล',
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelStyle: TextStyle(
                                          fontFamily: 'Anakotmai',
                                          fontWeight: FontWeight.w500),
                                      enabledBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.circular(5.0)
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                ),
                                // Tel.
                                Divider(),
                                TextFormField(
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.phone,
                                        color: Color(0xFF57BD37),
                                      ),
                                      hintText: 'เบอร์โทรศัพท์',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Anakotmai',
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelStyle: TextStyle(
                                          fontFamily: 'Anakotmai',
                                          fontWeight: FontWeight.w500),
                                      enabledBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.circular(5.0)
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                ),
                                Divider(),
                                // Email
                                TextFormField(
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.email,
                                        color: Color(0xFF57BD37),
                                      ),
                                      hintText: 'อีเมลล์',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Anakotmai',
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelStyle: TextStyle(
                                          fontFamily: 'Anakotmai',
                                          fontWeight: FontWeight.w500),
                                      enabledBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.circular(5.0)
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                ),
                                Divider(),
                                // Habitat
                                TextFormField(
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.map,
                                        color: Color(0xFF57BD37),
                                      ),
                                      hintText: 'ที่อยู่',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Anakotmai',
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelStyle: TextStyle(
                                          fontFamily: 'Anakotmai',
                                          fontWeight: FontWeight.w500),
                                      enabledBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.circular(5.0)
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                ),
                              ],
                            )),
                        // Setting
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'ตั้งค่า',
                            style: TextStyle(
                                fontFamily: 'Anakotmai',
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        TileCard(
                            elevation: 0,
                            padding: EdgeInsets.all(5),
                            insets: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: <Widget>[
                                // Language
                                TextField(
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.language,
                                        color: Color(0xFF57BD37),
                                      ),
                                      hintText: 'ภาษา',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Anakotmai',
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelStyle: TextStyle(
                                          fontFamily: 'Anakotmai',
                                          fontWeight: FontWeight.w500),
                                      enabledBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.circular(5.0)
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                ),
                                // gauge meter
                                TextField(
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.circle,
                                        color: Color(0xFF57BD37),
                                      ),
                                      hintText: 'หน่วยวัดพื้นที่',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Anakotmai',
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelStyle: TextStyle(
                                          fontFamily: 'Anakotmai',
                                          fontWeight: FontWeight.w500),
                                      enabledBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.circular(5.0)
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                )
                              ],
                            )),
                        // Actionee
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'ตั้งค่าผู้รับผิดชอบ',
                            style: TextStyle(
                                fontFamily: 'Anakotmai',
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        // Manage Actionee
                        TileCard(
                            elevation: 0,
                            child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  child: Text('จัดการผู้ใช้'),
                                )
                              ],
                            ))),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
