import 'package:flutter/material.dart';
import 'package:ui_test/categories_navigator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui_test/categories_navigator.dart' as prefix0;

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
         fontFamily: 'Montserrat',
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  List<String> allCat=["World","Business","Politics","Sports","Entertaintment"];
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
      return MaterialApp(
      home:DefaultTabController(
      length: 5,
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
            Text("News", style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Montserrat')),
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
            indicatorColor:Colors.white,
              tabs: 
                 List<Widget>.generate(5, (int index) {
                              

                  return Tab(
                  
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                    
                      child: Text(allCat[index],  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Montserrat'),),
                    ),
                  ),
                );
                            })),
        ),
        body: TabBarView(children: [
          Icon(Icons.apps),
          Icon(Icons.movie),
          Icon(Icons.games), 
          Icon(Icons.movie),
          Icon(Icons.games),
        ]),
      ))
    );
  }
  }

