// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hero_agri/activity/activity_page.dart';
import 'package:hero_agri/card/plot_example_card.dart';
import 'package:hero_agri/main.dart';
import 'package:hero_agri/plot_action/manage_my_plot.dart';

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
    // return Scaffold(
    //     body: Stack(
    //   children: <Widget>[
    //     _widgertOption.elementAt(_selectedIndex),
    //     Align(
    //         alignment: Alignment.bottomCenter,
    //         child: Container(
    //           height: 80,
    //           child: Theme(
    //             data:
    //                 Theme.of(context).copyWith(canvasColor: Colors.transparent),
    //             child: FooterTileCard(
    //               insets: EdgeInsets.symmetric(vertical: 0),
    //               padding: EdgeInsets.all(9),
    //               child: BottomNavigationBar(
    //                 elevation: 0,
    //                 showSelectedLabels: false,
    //                 showUnselectedLabels: false,
    //                 selectedItemColor: Color(0xFF57BD37),
    //                 unselectedItemColor: Colors.white,
    //                 type: BottomNavigationBarType.fixed,
    //                 onTap: _onItemTapped,
    //                 currentIndex: _selectedIndex,
    //                 items: const <BottomNavigationBarItem>[
    //                   BottomNavigationBarItem(
    //                     icon: FaIcon(FontAwesomeIcons.home),
    //                     label: 'Home',

    //                   ),
    //                   BottomNavigationBarItem(
    //                     icon: FaIcon(FontAwesomeIcons.leaf),
    //                     label: 'Leaf',
    //                   ),
    //                   BottomNavigationBarItem(
    //                     icon: FaIcon(FontAwesomeIcons.shoppingCart),
    //                     label: 'Noti',
    //                   ),
    //                   BottomNavigationBarItem(
    //                     icon: FaIcon(FontAwesomeIcons.book),
    //                     label: 'Achi',
    //                   ),
    //                   BottomNavigationBarItem(
    //                     icon: FaIcon(FontAwesomeIcons.userAlt),
    //                     label: 'Settings',
    //                   ),
    //                 ],
    //               ),
    //               color: Colors.yellow,
    //             ),
    //           ),
    //         ))
    //   ],
    // ));

    return DefaultTabController(
        length: 5,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: homePage(),
                    ),
                    Center(child: PlotAreaPage()),
                    Center(child: MarketplacePage()),
                    Center(child: AgroPlantPage()),
                    Center(child: SettingPage()),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 86,
                    color: Colors.transparent,
                    // constraints: BoxConstraints(maxHeight: 150.0),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Material(
                        color: Colors.transparent,
                        child: TileCard(
                          borderRadius: 50,
                          color: Colors.yellow,
                          insets: EdgeInsets.zero,
                          child: TabBar(
                            // isScrollable: true,
                            labelPadding: EdgeInsets.symmetric(horizontal: 10),
                            indicator: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            unselectedLabelColor: Colors.white,
                            tabs: [
                              Tab(
                                child: FaIcon(FontAwesomeIcons.home),
                              ),
                              Tab(
                                child: FaIcon(FontAwesomeIcons.leaf),
                              ),
                              Tab(
                                child: FaIcon(FontAwesomeIcons.shoppingCart),
                              ),
                              Tab(
                                child: FaIcon(FontAwesomeIcons.book),
                              ),
                              Tab(
                                child: FaIcon(FontAwesomeIcons.userAlt),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
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
        plotExample(),
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
    final List<String> activityList = [
      'การดูแลรักษา',
      'การป้องกัน',
      'การพยากรณ์',
      'กิจกรรมพิเศษ'
    ];
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
          GestureDetector(
            child: CarouselSlider(
              options: CarouselOptions(
                  aspectRatio: 2.0,
                  // enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  height: 220
                  // initialPage: 1,
                  // autoPlay: true,
                  ),
              items: activityList.map((i) {
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
                                      'สัปดาห์ที่ ${activityList.indexOf(i) + 1} :',
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
                                      vertical: 15, horizontal: 10),
                                  child: Text(
                                    '$i',
                                    style: TextStyle(
                                      fontFamily: 'Anakotmai',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            managActivityList()
                          ],
                        ),
                        padding: EdgeInsets.all(2),
                        color: Color(0xFF57BD37),
                      ),
                    ));
                  },
                );
              }).toList(),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ActivityPage()));
            },
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

  Widget plotExample() {
    final List<String> netSrcImage = [
      'https://static1.bigstockphoto.com/2/5/1/large1500/152442050.jpg',
      'https://www.maxpixels.net/static/photo/1x/Nature-Zucchini-Garden-Plant-Leaf-Garden-Plot-1002528.jpg',
      'https://www.thaiticketmajor.com/variety/img_content/imgeditor/3(443).jpg',
      'https://babban.club/wp-content/uploads/2017/09/15380357_978689428903394_4619143797969164361_n.jpg',
      'https://i.pinimg.com/736x/9a/5e/e0/9a5ee06d099179f8020c398202c2b1f9.jpg'
    ];
    final List<String> plotOwnerName = [
      'สวนผักคุณเอ',
      'สวนผักคุณบี',
      'แปลงผักคุณซี',
      'แปลงผักคุณดี',
      'แปลงผักคุณเอ',
    ];
    final List<String> plotLocation = [
      'อำเภอ ก จังหวัด ก',
      'อำเภอ ข จังหวัด ข',
      'อำเภอ ค จังหวัด ค',
      'อำเภอ ง จังหวัด ง',
      'อำเภอ จ จังหวัด จ',
    ];
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
              height: 220,
              // enlargeCenterPage: true,
              enableInfiniteScroll: false,
              // initialPage: 1,
              // autoPlay: true,
            ),
            items: netSrcImage.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    child: TileCard(
                      insets: EdgeInsets.zero,
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  i,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes
                                            : null,
                                      ),
                                    );
                                  },
                                  fit: BoxFit.cover,
                                  width: 1000,
                                  height: 135,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: <Widget>[
                                    // Temperature
                                    Container(
                                      width: 80,
                                      child: TileCard(
                                        borderRadius: 2,
                                        child: Column(
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.temperatureHigh,
                                              color: Color(0xFF57BD37),
                                            ),
                                            Text(
                                              '33.5 °C',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF57BD37)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Watering percentage
                                    Container(
                                      width: 80,
                                      child: TileCard(
                                        borderRadius: 2,
                                        child: Column(
                                          children: [
                                            FaIcon(FontAwesomeIcons.tint,
                                                color: Color(0xFF57BD37)),
                                            Text('39.5 %',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF57BD37)))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
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
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: FaIcon(FontAwesomeIcons.leaf,
                                      color: Color(0xFF57BD37)),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${plotOwnerName[netSrcImage.indexOf(i)]}',
                                      style: TextStyle(
                                          fontFamily: 'Anakotmai',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.amber),
                                    ),
                                    Text(
                                      '${plotLocation[netSrcImage.indexOf(i)]}',
                                      style: TextStyle(
                                          fontFamily: 'Anakotmai',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.green[900]),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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
    final List<String> productPicList = [
      'https://www.dronezon.com/wp-content/uploads/2014/10/DJI-Phantom-2-Vision-Plus-e1580563366975.jpg.webp',
      'https://th-test-11.slatic.net/shop/5ba518d78718024fcc1d4d8dcca4a0c2.jpeg_2200x2200q80.jpg_.webp',
      'https://www.chiataigroup.com/imgadmins/product_photo/pro20200602095323.png',
      'https://th-live-01.slatic.net/p/78a3a76406dd2998224736eb13b0956d.jpg',
      'https://www.siamkubota.co.th/backend/public/uploads/agriculture/images/af1f3dcfb73a1c3e5ed8f8ccdcfce429.png',
    ];
    final List<String> productNameList = [
      'โดรน',
      'เครื่องพ่นยาฆ่าแมลง',
      'ปุ๋ย',
      'ดินบรรจุถุง',
      'รถแทรกเตอร์',
    ];
    final List<String> adsShopList = [
      'ร้าน ก',
      'ร้าน ก',
      'ร้าน ข',
      'ร้าน ค',
      'ร้าน ค',
    ];
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
            items: productPicList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    // width: MediaQuery.of(context).size.width,
                    // margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: TileCard(
                      insets: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                i,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress
                                                  .expectedTotalBytes !=
                                              null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes
                                          : null,
                                    ),
                                  );
                                },
                                fit: BoxFit.cover,
                                width: 200,
                                // height: 1000,
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
                                    Text('ชื่อสินค้า : ',
                                        style: TextStyle(
                                            fontFamily: 'Anakotmai',
                                            fontSize: 15,
                                            color: Colors.grey[400],
                                            fontWeight: FontWeight.w500)),
                                    Text(
                                        '${productNameList[productPicList.indexOf(i)]}',
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
                                    Text(
                                        '${adsShopList[productPicList.indexOf(i)]}',
                                        style: TextStyle(
                                            fontFamily: 'Anakotmai',
                                            fontSize: 15,
                                            color: Color(0xFF57BD37),
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  child: Image.asset(
                                    'assets/image/button/more_detail_btn.png',
                                    width: 120,
                                  ),
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

  Widget managActivityList() {
    List<Widget> activityList = <Widget>[];
    int plotCount = 0;
    while (plotCount < 5) {
      activityList.add(
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: Colors.amber,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(3),
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
                'แปลงที่ $plotCount',
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
      );
      plotCount++;
    }
    return Container(
      height: 100,
      child: ListView(
        children: activityList,
      ),
    );
  }
}
