import 'dart:ffi';

import 'package:ui_test/categories_navigator.dart' as prefix0;
import 'package:ui_test/models/news_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final NewsModel lesson;
  DetailPage({Key key, this.lesson}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(100, 100, 224, 0.2),
            value: 12,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        "\$34" ,
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_left,
                      color: Colors.white,
                      size: 32,
                    ),
                    Text("News ",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    SizedBox(),
                  ],
                );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: 280,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage("https://images.pexels.com/photos/2007401/pexels-photo-2007401.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
        //height: MediaQuery.of(context).size.height * 0.5,
         padding: EdgeInsets.all(30.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Center(
            child: topContentText,
          ),
        ),
        // Positioned(
        //   left: 8.0,
        //   top: 60.0,
        //   child: InkWell(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: Icon(Icons.arrow_back, color: Colors.white),
        //   ),
        // )
      ],
    );

   
    final bottomContent = 
    
    Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
       decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)
                )
              ),

      child: Center(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}