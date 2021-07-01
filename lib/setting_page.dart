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
                height: 700,
                child: TileCard(
                    color: Colors.grey[100],
                    padding: EdgeInsets.all(0),
                    insets: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'รายละเอียดบัญชี',
                          style: TextStyle(
                              fontFamily: 'Anakotmai',fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'อีเมลล์',
                              filled: true,
                              fillColor: Colors.white,
                              labelStyle: TextStyle(
                                  fontFamily: 'Anakotmai',
                                  fontWeight: FontWeight.w500),
                              enabledBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(5.0)
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'ที่อยู่',
                              filled: true,
                              fillColor: Colors.white,
                              labelStyle: TextStyle(
                                  fontFamily: 'Anakotmai',
                                  fontWeight: FontWeight.w500),
                              enabledBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(5.0)
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'ตั้งค่า',
                          style: TextStyle(
                              fontFamily: 'Anakotmai',
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
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
