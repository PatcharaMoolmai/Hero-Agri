import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hero_agri/card/tile_card.dart';
import 'package:hero_agri/card/tile_expandable.dart';
import 'package:hero_agri/manage_plot/manage_my_plot.dart';

class CreatePlotCont extends StatefulWidget {
  const CreatePlotCont({Key key}) : super(key: key);

  @override
  _CreatePlotContState createState() => _CreatePlotContState();
}

class _CreatePlotContState extends State<CreatePlotCont> {
// Select date calendar
  DateTime _selectedDate = DateTime.now();
  String _selectDateString = '';
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1930, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _selectDateString = "${_selectedDate.toLocal()}".split(' ')[0];
        // _passDataToParent('age',calculateAge(picked));
      });
    // print('your age is ${calculateAge(picked)}');
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        // Background
        decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Colors.yellow,
            //     Colors.green,
            //   ],
            // )
            color: Colors.yellow),
        // Body
        child: Column(
          children: <Widget>[
            AppBar(
              leading: IconButton(
                icon: FaIcon(FontAwesomeIcons.chevronCircleLeft),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'จัดการพื้นที่เพาะปลูก',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF57BD37),
                    fontSize: 20),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            // body
            Expanded(
                child: ListView(
              children: <Widget>[
                TileCard(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    insets: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'กิจกรรม',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xFF57BD37)),
                        ),
                        TileExpandableCard(
                          collapsedHeader: Text(
                            'การดูแลรักษา',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          child: Column(),
                          elevation: 0,
                          color: Colors.grey[100],
                        ),
                        Text(
                          'ประเภทกิจกรรม',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xFF57BD37)),
                        ),
                        TileExpandableCard(
                          collapsedHeader: Text(
                            'การให้ปุ๋ย',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          child: Column(),
                          elevation: 0,
                          color: Colors.grey[100],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'จำนวน',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color(0xFF57BD37)),
                              ),
                              Row(
                                // Amount
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                      child: TextFormField(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 15),
                                        filled: true,
                                        fillColor: Colors.grey[100],
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                                color: Colors.white))),
                                  )),
                                  Flexible(
                                      child: Text(
                                    'กิโลกรัม/ต้น',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('โปรดระบุ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color(0xFF57BD37))),
                              GestureDetector(
                                child: TileCard(
                                  elevation: 0,
                                  color: Colors.grey[100],
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Container(
                                          width: 200,
                                          child: RaisedButton(
                                            onPressed: () {
                                              _selectDate(context);
                                            },
                                            child: Text(_selectDateString),
                                            color: Colors.transparent,
                                            elevation: 0,
                                          ),
                                        ),
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.calendarAlt,
                                        color: Color(0xFF57BD37),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Divider(),
                              SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                        ),
                        Text('บันทึกช่วยจำ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color(0xFF57BD37))),
                        TextFormField(
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 15),
                              filled: true,
                              fillColor: Colors.grey[100],
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            child:
                                Image.asset('assets/image/button/save_btn.png'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ManageMyPlot()));
                            },
                          ),
                        ),
                      ],
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
