// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Project import

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: AppBar(
              leading: Icon(Icons.close,color: Colors.black,),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            onTap: (){Navigator.pop(context);},
            )
          ],
        ),
      ),
    );
  }
}
