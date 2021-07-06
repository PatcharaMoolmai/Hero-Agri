// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hero_agri/agri_plot_location/create_plot.dart';

// Project import

class PlotAreaPage extends StatelessWidget {
  const PlotAreaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.yellow,
          Colors.green,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/image/plot_area_screen.png'),
              SizedBox(height: 20,),
              Text('ยังไม่มีพื้นที่เพาะปลูก',
                  style: TextStyle(
                      fontFamily: 'Anakotmai',
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              SizedBox(height: 20,),
              Text('กดปุ่มด้านล่างเพื่อเพิ่มพื้นที่เพาะปลูก',
                  style: TextStyle(
                      fontFamily: 'Anakotmai',
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              SizedBox(height: 20,),
              GestureDetector(
                child: Image.asset('assets/image/button/Create_plot.png'),
                onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateMyPlotPage()));
                      print('alert chatbot');
                    },
              )
            ],
          ),
        ),
      ),
    );
  }
}
