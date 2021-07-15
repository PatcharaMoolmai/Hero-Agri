// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hero_agri/card/plot_example_card.dart';
import 'package:hero_agri/main.dart';
import 'package:hero_agri/manage_plot/manage_my_plot.dart';

// Project import
import 'agri_news/agro_news_page.dart';
import 'agro_plant_page.dart';
import 'card/footer_navigator.dart';
import 'card/tile_card.dart';
import 'chatbot_page.dart';
import 'notification_page.dart';
import 'agri_plot_location/plot_area.dart';
import 'setting/setting_page.dart';
import 'marketplace/marketplace_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// Width, height aren't flexible rn
  @override
  Widget build(BuildContext context) {
    // Linking Page to change bottom widget
    List<Widget> _widgertOption = <Widget>[
      homePage(),
      PlotAreaPage(),
      MarketplacePage(),
      AgroPlantPage(),
      SettingPage()
    ];
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _widgertOption.elementAt(_selectedIndex),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              child: Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: FooterTileCard(
                  insets: EdgeInsets.symmetric(vertical: 0),
                  padding: EdgeInsets.all(9),
                  child: BottomNavigationBar(
                    elevation: 0,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedItemColor: Color(0xFF57BD37),
                    unselectedItemColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    onTap: _onItemTapped,
                    currentIndex: _selectedIndex,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.leaf),
                        label: 'Leaf',
                      ),
                      BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.shoppingCart),
                        label: 'Noti',
                      ),
                      BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.book),
                        label: 'Achi',
                      ),
                      BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.userAlt),
                        label: 'Settings',
                      ),
                    ],
                  ),
                  color: Colors.yellow,
                ),
              ),
            ))
      ],
    ));
  }

  Widget homePage() {
    return ListView(
      children: <Widget>[
        AppBar(
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
        ),
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
          // onTap: () {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => AgroNewsPage()));
          // },
        ),
        SizedBox(
          height: 5,
        ),
        adsPromotion(),
        SizedBox(
          height: 100,
        ),
      ],
    );
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
        Container(
          child: Image.asset('assets/image/notificate-bot.png'),
          height: 120,
        )
      ],
    );
  }

  Widget manageActivity() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
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
                // enlargeCenterPage: true,
                enableInfiniteScroll: false,
                height: 220
                // initialPage: 1,
                // autoPlay: true,
                ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      child: Container(
                    child: TileCard(
                      insets: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'สัปดาห์ที่ $i :',
                                    style: TextStyle(
                                      fontFamily: 'Anakotmai',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TileCard(
                                    elevation: 0,
                                    insets:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                    child: Text(
                                      'ระยะเวลา...',
                                      style: TextStyle(
                                        fontFamily: 'Anakotmai',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              TileCard(
                                elevation: 0,
                                insets: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                child: Text(
                                  'ชื่อกิจกรรม',
                                  style: TextStyle(
                                    fontFamily: 'Anakotmai',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                          // Plot 1
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2.0,
                                color: Colors.amber,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'พื้นที่เพาะปลูก',
                                  style: TextStyle(
                                    fontFamily: 'Anakotmai',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'แปลงที่ 1',
                                  style: TextStyle(
                                      fontFamily: 'Anakotmai',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.amber),
                                ),
                                Text(
                                  'ชนิด',
                                  style: TextStyle(
                                    fontFamily: 'Anakotmai',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'ประเภท',
                                  style: TextStyle(
                                      fontFamily: 'Anakotmai',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.amber),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          // Plot 2
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2.0,
                                color: Colors.amber,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'พื้นที่เพาะปลูก',
                                  style: TextStyle(
                                    fontFamily: 'Anakotmai',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'แปลงที่ 2',
                                  style: TextStyle(
                                      fontFamily: 'Anakotmai',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.amber),
                                ),
                                Text(
                                  'ชนิด',
                                  style: TextStyle(
                                    fontFamily: 'Anakotmai',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'ประเภท',
                                  style: TextStyle(
                                      fontFamily: 'Anakotmai',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.amber),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(2),
                      color: Color(0xFF57BD37),
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
          insets: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/image/plot_manager.png',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text('กิจกรรม',
                      style: TextStyle(
                          fontFamily: 'Anakotmai',
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w500)),
                  Text('แปลงปลูกของฉัน',
                      style: TextStyle(
                          fontFamily: 'Anakotmai',
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  Text('จัดการแปลงปลูกพืชของคุณ',
                      style: TextStyle(
                          fontFamily: 'Anakotmai',
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w500)),
                ],
              ),
              GestureDetector(
                child: Image.asset(
                  'assets/image/button/plot_manager_btn.png',
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ManageMyPlot()));
                },
              )
            ],
          )),
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
              // enlargeCenterPage: true,
              enableInfiniteScroll: false,
              // initialPage: 1,
              // autoPlay: true,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      child: Container(
                    child: TileCard(
                      insets: EdgeInsets.zero,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 90,
                            child: TileCard(
                              color: Color(0xFF57BD37),
                              child: Text('รูปที่ $i'),
                              padding: EdgeInsets.all(0),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.circle),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'สวนตัวอย่างที่ $i',
                                      style: TextStyle(
                                          fontFamily: 'Anakotmai',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'รายละเอียดสวนที่ $i',
                                      style: TextStyle(
                                          fontFamily: 'Anakotmai',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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
                // enlargeCenterPage: true,
                enableInfiniteScroll: false,
                height: 95
                // initialPage: 1,
                // autoPlay: true,
                ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      child: TileCard(
                    // color: Colors.lightGreen[400],
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'หัวข้อข่าว $i',
                                style: TextStyle(
                                    fontFamily: 'Anakotmai',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.green),
                              ),
                              Text(
                                'เนื้อหาย่อ $i',
                                style: TextStyle(
                                    fontFamily: 'Anakotmai',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Image.asset(
                                'assets/image/button/news_read_btn.png'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AgroNewsPage()));
                            },
                          )
                        ],
                      ),
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
              // enlargeCenterPage: true,
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
                    child: TileCard(
                      insets: EdgeInsets.zero,
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Container(
                                height: 177,
                                child: TileCard(
                                  color: Color(0xFF57BD37),
                                    padding: EdgeInsets.zero,
                                    insets: EdgeInsets.zero,
                                    child: Text('รูปโปรโมชัน'),
                                  ),
                                ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('สินค้านวัตกรรม',
                                    style: TextStyle(
                                        fontFamily: 'Anakotmai',
                                        fontSize: 20,
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w500)),
                                Row(
                                  children: <Widget>[
                                    Text('ชื่อสินค้า :',
                                        style: TextStyle(
                                            fontFamily: 'Anakotmai',
                                            fontSize: 15,
                                            color: Colors.grey[400],
                                            fontWeight: FontWeight.w500)),
                                    Text('AAA',
                                        style: TextStyle(
                                            fontFamily: 'Anakotmai',
                                            fontSize: 15,
                                            color: Color(0xFF57BD37),
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text('ร้านค้า :',
                                        style: TextStyle(
                                            fontFamily: 'Anakotmai',
                                            fontSize: 15,
                                            color: Colors.grey[400],
                                            fontWeight: FontWeight.w500)),
                                    Text('AAA Shop',
                                        style: TextStyle(
                                            fontFamily: 'Anakotmai',
                                            fontSize: 15,
                                            color: Color(0xFF57BD37),
                                            fontWeight: FontWeight.w500)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(2),
                    ),
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
