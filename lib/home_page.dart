import 'package:flutter/material.dart';
import 'dart:math';
import 'package:ui_test/services/webservice.dart';
import 'dart:async';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ui_test/models/Categorylist.dart';
import 'package:ui_test/categories_navigator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui_test/categories_navigator.dart';
import 'package:ui_test/NewsListing.dart';
import 'package:ui_test/utils/globals.dart' as globals;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Timer timer;
  TabController _tabController;

  List<String> tabs = [
    "SPORTS",
  ];

  @override
  void initState() {
    super.initState();
     //_tabController = new TabController(vsync: this, length: tabs.length);

    _populateCategories();

    timer = Timer.periodic(
        Duration(seconds: 2),
        (Timer t) => {
              getValuesSF(),
            });
  }

  void _populateCategories() {
    Webservice()
        .getallcategory(Categorylist.callgetcategorylist())
        .then((detailsNews) => {
              setState(() => {
                    globals.categories = [],
                    globals.tabcategory = [],
                    for (var i = 0; i < detailsNews.length; i++)
                      {
                        globals.categories.add((detailsNews[i])),
                        
                        tabs.add(detailsNews[i]),
                        globals.tabcategory
                            .add(globals.categories[0].toLowerCase()),
                      },
                    savecat()
                  })
            });
  }

  void savecat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(globals.categories);
    print("--------------");
    setState(() {
      prefs.setStringList("cat", globals.categories);
      print("detailsNewsdetailsNewsdetailsNews>>>>>>>>>>${globals.categories}");
    });
  }

  getValuesSF() async {
   
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      //Return String
      String stringValue =
          prefs.getString('lng') != null ? prefs.getString('lng') : 'English';
      globals.categories = prefs.getStringList('cat') != null
          ? prefs.getStringList('cat')
          : [
              "SPORTS",
            ];
tabs.clear();
      tabs = globals.categories;

      print("stringValuecat${globals.categories}");
      print("TESTTTT$tabs");
      if (tabs.length > 1) {
        _tabController = new TabController(vsync: this, length: tabs.length);
        //_tabController.addListener(_handleTabSelection);

        globals.tabcategory = [];
        globals.tabcategory.add(tabs[0].toLowerCase());

        timer.cancel();
      }
      if (stringValue != null && stringValue.length > 0) {
        globals.newslanguage = stringValue;
      } else {
        globals.newslanguage = 'English';
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      print('hiii');
                    },
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                    )),
                Text("News ",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: globals.font_news,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                Icon(
                  Icons.language,
                  color: Colors.black,
                  size: 22,
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottom: new TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontFamily: globals.font_news,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: globals.font_news,
                fontWeight: FontWeight.normal,
              ),
              isScrollable: true,
              indicatorColor: Colors.transparent,
              controller: _tabController,
              tabs: List<Widget>.generate(tabs.length, (int index) {
                print(tabs[0] + "--------------------------");

                return new Tab(
                    child: Text(
                  tabs[index],
                ));
              }),

              // tabs: List<Widget>.generate(allCat.length, (int index) {
              //   return Tab(
              //     child: Container(
              //       child: Align(
              //         alignment: Alignment.center,
              //         child: Text(
              //           allCat[index].text,

              //         ),
              //       ),
              //     ),
              //   );
              // }),
            ),
          ),
          body: new TabBarView(
            controller: _tabController,
            children: List<Widget>.generate(tabs.length, (int index) {
              print(tabs[0] + "===========");

              return new NewsListing();
            }),
          ),
        ));
  }
}
