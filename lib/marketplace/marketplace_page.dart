// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hero_agri/marketplace/shopping_cart.dart';

// Project import

class MarketplacePage extends StatelessWidget {
  const MarketplacePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('ร้านค้า',
                      style: TextStyle(
                          fontFamily: 'Anakotmai',
                          fontSize: 25,
                          color: Color(0xFF57BD37),
                          fontWeight: FontWeight.w500)),
                  GestureDetector(
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Color(0xFF57BD37),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingCart()));
                    },
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'ค้นหาสินค้า ร้านค้า',
                    filled: true,
                    fillColor: Color(0xFFEEEEEE),
                    suffixIcon: Icon(
                      FontAwesomeIcons.search,
                      color: Color(0xFF57BD37),
                    ),
                    labelStyle: TextStyle(
                        fontFamily: 'Anakotmai', fontWeight: FontWeight.w500),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
