// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Project import
import 'agri_news/agro_news_page.dart';
import 'card/footer_navigator.dart';
import 'card/tile_card.dart';
import 'package:hero_agri/chatbot_page.dart';
import 'package:hero_agri/notification_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static int _selectedIndex = 0;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onItemTapped(int index) {
    setState(() {
      HomePage._selectedIndex = index;
    });
  }

// Width, height aren't flexible rn
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: IconButton(
                    icon: Icon(Icons.file_copy),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatbotPage()));
                      print('alert chatbot');
                    }),
              ),
              // Text('Hero Agri logo'),
              Image.asset(
                'assets/image/logo.png',
                height: 50,
              ),
              Container(
                child: IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationPage()));
                      print('alert notification');
                    }),
              ),
            ],
          ),
          backgroundColor: Color(0xFF57BD37),
          // actions: <Widget>[
          //   IconButton(icon: Icon(Icons.notifications), onPressed: (){print('alert notification');})
          // ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  buildNotification(),
                  SizedBox(
                    height: 5,
                  ),
                  buildPlotLocation(),
                  SizedBox(
                    height: 5,
                  ),
                  manageActivity(),
                  SizedBox(
                    height: 5,
                  ),
                  manageMyPlot(),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    child: buildAgriNews(),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AgroNewsPage()));
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  adsPromotion(),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 75,
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(canvasColor: Colors.transparent),
                    child: FooterTileCard(
                      child: BottomNavigationBar(
                        elevation: 0,
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        selectedItemColor: Colors.green,
                        onTap: _onItemTapped,
                        currentIndex: HomePage._selectedIndex,
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.grade),
                            label: 'Level',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.shopping_cart),
                            label: 'Notification',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.menu_book_sharp),
                            label: 'Achievements',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.settings),
                            label: 'Settings',
                          ),
                        ],
                        // onTap: (final int index) async {
                        //   switch(index){
                        //     case 0: _onItemTapped;
                        //     case 1:
                        //     case 2:
                        //     case 3:
                        //     case 4:
                        //   }
                        // },
                      ),
                      color: Colors.yellow,
                    ),
                  ),
                ))
          ],
        ));
  }

  Widget buildNotification() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TileCard(
              color: Color(0xFFE4F3DA),
              child: Text(
                'Notification Screen Popup',
                style: TextStyle(
                    fontFamily: 'Anakotmai',
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              insets: EdgeInsets.all(10),
            ),
            TileCard(
              child: Text('Sub notification(1)',
                  style: TextStyle(
                      fontFamily: 'Anakotmai',
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
              insets: EdgeInsets.all(10),
            ),
            TileCard(
              child: Text('Under maintainance',
                  style: TextStyle(
                      fontFamily: 'Anakotmai',
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
              insets: EdgeInsets.all(10),
            ),
          ],
        ),
        Column(
          children: <Widget>[Image.asset('assets/image/notificate-bot.png')],
        )
      ],
    );
  }

  Widget manageActivity() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'กิจกรรม',
            style: TextStyle(
                fontFamily: 'Anakotmai',
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              // initialPage: 1,
              // autoPlay: true,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      // width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: BoxDecoration(color: Colors.amber),
                      child: Container(
                    // width: 50,
                    child: TileCard(
                      child: Text('การแจ้งเตือนกิจกรรม'),
                      padding: EdgeInsets.all(2),
                    ),
                  ));
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget manageMyPlot() {
    return Container(
      height: 150,
      child: TileCard(
        padding: EdgeInsets.all(20),
        child: Text('หน้าการจัดการแปลงเกษตร',
            style: TextStyle(
                fontFamily: 'Anakotmai',
                fontSize: 20,
                fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget buildPlotLocation() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'สวนตัวอย่างในพื้นที่โซน',
            style: TextStyle(
                fontFamily: 'Anakotmai',
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              // initialPage: 1,
              // autoPlay: true,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      // width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: BoxDecoration(color: Colors.amber),
                      child: Container(
                    // width: 50,
                    child: TileCard(
                      child: Text('Plant Plot'),
                      padding: EdgeInsets.all(2),
                    ),
                  ));
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget buildAgriNews() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'ข่าวสารเกษตรกร',
            style: TextStyle(
                fontFamily: 'Anakotmai',
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              // initialPage: 1,
              // autoPlay: true,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      // width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: BoxDecoration(color: Colors.amber),
                      child: TileCard(
                        color: Colors.lightGreen[400],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('ข่าวสารแอปพลิเคชัน'),
                      ],
                    ),
                    padding: EdgeInsets.all(2),
                  ));
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget adsPromotion() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'โปรโมชั่นสินค้าแนะนำ',
            style: TextStyle(
                fontFamily: 'Anakotmai',
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              // initialPage: 1,
              // autoPlay: true,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      // width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: BoxDecoration(color: Colors.amber),
                      child: Container(
                    // width: 50,
                    child: TileCard(
                      child: Text('โปรโมชัน'),
                      padding: EdgeInsets.all(2),
                    ),
                  ));
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
