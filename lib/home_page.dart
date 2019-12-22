import 'package:flutter/material.dart';
import 'dart:math';
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
  int _counter = 0;
  TabController _tabController;
//  List<String> allCat = [
//       "World",
//       "Tech",
//       "World",
//       "Tech",
//       "Sports",
//       "Politics",
//       "Health"
//     ];
  List<Tab> allCat = <Tab>[
    new Tab(text: 'World'),
    new Tab(text: 'Tech'),
    new Tab(text: 'World'),
    new Tab(text: 'Tech'),
    new Tab(text: 'Sports'),
    new Tab(text: 'Politics'),
    new Tab(text: 'Health'),
  ];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: allCat.length);
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
              InkWell(  onTap: () {
                  print("Hiiiiiiiiiii");
                  
                }, child: Icon(Icons.menu,color: Colors.black, )),
        //         IconButton(
        //     icon: Icon(Icons.menu),
        //     color: Colors.black,
        //    alignment: Alignment.center,
        //       padding: new EdgeInsets.all(0.0),
        //     onPressed: (){
        //       print('function is executed, but there is no expanstion triggering !');
        //     }
        // ),
                Text("News ",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: globals.font_news,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                // Icon(
                //   Icons.language,
                //   color: Colors.black,
                //   size: 22,
                // ),
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
              tabs: allCat,

              // tabs: List<Widget>.generate(allCat.length, (int index) {
              //   return Tab(
              //     child: Container(
              //       child: Align(
              //         alignment: Alignment.center,
              //         child: Text(
              //           allCat[index],
              //           style: TextStyle(
              //               color: Colors.red,
              //               fontSize: 12.0,
              //               fontWeight: FontWeight.w400,
              //               fontFamily: globals.font_news),
              //         ),
              //       ),
              //     ),
              //   );
              // }
            ),
          ),
          body: new TabBarView(
            controller: _tabController,
            children: allCat.map((Tab tab) {
              return new NewsListing();
            }).toList(),
          ),
        ));
  }
}
