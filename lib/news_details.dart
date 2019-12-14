import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
@override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 280,
            decoration: BoxDecoration(
              image: DecorationImage(image: new NetworkImage("https://img.traveltriangle.com/blog/wp-content/uploads/2018/11/Cover-for-best-places-to-visit-in-July-in-the-world.jpg"),fit: BoxFit.cover)
            ),
          ),
          AppBar(
            elevation: 2,
            backgroundColor: Colors.transparent,
            title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    
                    Text("News ",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                   
                  ],
                ),
            actions: <Widget>[
              
            ],
          ),
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Container(
              
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(33.0),
                  topRight: Radius.circular(33.0)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 
                
                ],
              ),
            ),
          ),
         
        ],
      ),
    );
  }

}


