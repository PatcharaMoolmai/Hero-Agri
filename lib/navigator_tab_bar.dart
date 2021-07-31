// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hero_agri/agri_plot_location/plot_area.dart';
import 'package:hero_agri/agro_plant_page.dart';
import 'package:hero_agri/home_screen.dart';
import 'package:hero_agri/marketplace/marketplace_page.dart';
import 'package:hero_agri/plot_action/manage_my_plot.dart';
import 'package:hero_agri/plot_action/my_plot.dart';

import 'card/tile_card.dart';
import 'setting/setting_page.dart';

class HomePageTabbar extends StatefulWidget {
  const HomePageTabbar({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _HomePageTabbarState createState() => _HomePageTabbarState();
}

class _HomePageTabbarState extends State<HomePageTabbar> {
  // bool isPlotCreate = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        initialIndex: widget.index,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              // Expanded(
              TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Center(
                    child: HomePage(),
                  ),
                  Center(child: PlotAreaPage()),
                  Center(child: MarketplacePage()),
                  Center(child: AgroPlantPage()),
                  Center(child: SettingPage()),
                ],
              ),
              // ),
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
}
