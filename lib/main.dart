import 'package:flutter/material.dart';
import 'dart:math';
import 'package:ui_test/categories_navigator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui_test/categories_navigator.dart';
import 'package:ui_test/NewsListing.dart';
import 'package:ui_test/utils/globals.dart' as globals;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        fontFamily: globals.font_news,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<String> allCat = [
      "World",
      "Tech",
      "World",
      "Tech",
      "Sports",
      "Politics",
      "Health"
    ];
  
    return MaterialApp(
        home: DefaultTabController(
            length: 7,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 32,
                    ),
                    Text("News ",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: globals.font_news,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 32,
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                bottom: TabBar(
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.black,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.white,
                    tabs: List<Widget>.generate(allCat.length, (int index) {
                      return Tab(
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              allCat[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: globals.font_news),
                            ),
                          ),
                        ),
                      );
                    })),
              ),
              body: TabBarView(
                  children: List<Widget>.generate(allCat.length, (int index) {
                return new NewsListing();
              })),
            )));
  }
}
