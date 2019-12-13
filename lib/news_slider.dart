import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ui_test/utils/globals.dart' as globals;
import 'package:ui_test/models/news_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ui_test/slider_data.dart';

Color color = Color(0xff59c2ff);

class NewsSlider extends StatefulWidget {
final List<NewsModel> allNews ;
 NewsSlider(List<NewsModel> allnews, {Key key,  this.allNews})
      : super(key: key);



  _NewsSliderState createState() => _NewsSliderState();
}

class _NewsSliderState extends State<NewsSlider> {
  List<NewsModel> allNews = [
    NewsModel(
        title:
            "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire,",
        thumbnail:
            "https://media.gettyimages.com/photos/tourist-visiting-spain-picture-id895081824?s=612x612",
        descrption:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        created: "22-08-1990"),
    NewsModel(
        title:
            "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire,",
        thumbnail:
            "https://s29081.pcdn.co/wp-content/uploads/2019/03/big-dream-boatman-coron-island-hopping-tour-expedition-3154.jpg.optimal.jpg",
        descrption:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        created: "22-08-1990"),
    NewsModel(
        title:
            "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire,",
        thumbnail:
            "https://content.usaa.com/mcontent/static_assets/Media/ent-mainBnr-travelMain.jpg?cacheid=908809786_p",
        descrption:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        created: "22-08-1990")
  ];


  @override
  Widget build(BuildContext context) {


    return Container(
    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    color: Colors.transparent,
    // decoration: new BoxDecoration(
    //   image: new DecorationImage(
    //     image:
    //         new AssetImage("assets/ImageAssets/splashscreenbackground.png"),
    //     fit: BoxFit.cover,
    //   ),
    // ),
    child: CarouselSlider(
      autoPlay: false,
      enlargeCenterPage: true,
      aspectRatio: 0.88,
      viewportFraction: 0.99,
      onPageChanged: (index) {
        print("you clicked $index");
      },
      items: allNews.map((datalist) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
                onTap: () {
                  var _news = datalist;
                },
                child: new SliderData(news:datalist));
          },
        );
      }).toList(),
    ),
  );

  }
}


// final _right_section = new Expanded(
//   child: new Container(
//     padding: new EdgeInsets.fromLTRB(40, 0, 0, 0),
//     child: new Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//       _buildShareCol(Colors.brown, Icons.linked_camera, 'CALL'),
//       ],
//     ),
//   ),
// );

// final leftSectionIcons = new Container(
//   child: new Column(
//     children: <Widget>[
//       new Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     _buildButtonColumn(Colors.brown,
//                                         Icons.linked_camera, 'CALL'),
//                                     _buildIconColumn(
//                                         Colors.brown, Icons.share, 'CALL'),
//                                     // _buildButtonColumn(Colors.brown, Icons.arrow_downward, 'CALL'),
//                                   ],
//                                 ),
//     ],
//   ),
// );

// Column _buildShareCol(Color color, IconData icon, String label) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Container(
//           margin: EdgeInsets.fromLTRB(20, 15, 1, 0),
//           height: 23,
//           //child: new Image.asset('assets/icons/icon-bookmark.png'))
//           child: new IconButton(
//             iconSize: 20,
//             icon:  new Image.asset('assets/icons/icon-bookmark.png'),
//            // tooltip: 'Closes application',
//             onPressed: () => {

//             },
//           ),
//       )],
//   );
// }

// Column _buildIconColumn(Color color, IconData icon, String label) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Container(
//         margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//         child: Icon(
//           Icons.share,
//           color: Colors.pink,
//           size: 20.0,
//         ),
//       )
//     ],
//   );
// }

// Column _buildButtonColumn(Color color, IconData icon, String label) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Container(
//           margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//           child:
//           new IconButton(
//             iconSize: 20,
//             icon:  new Image.asset('assets/icons/social-media.png'),
//             tooltip: 'Closes application',
//             onPressed: () => {

//             },
//           )
//           )
     
//     ],
//   );
// }





// Widget datalistview(NewsModel news) {
//   var formatterdateforlist = "Testing";

//   return Container(
//       color: Colors.grey[100],
//       child: Column(
//         children: <Widget>[
//           Container(
//             color: Colors.white,
//             margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     Container(
//                       // color: Colors.green,
//                       decoration: new BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: new BorderRadius.only(
//                               topLeft: const Radius.circular(8.0),
//                               topRight: const Radius.circular(8.0),
//                               bottomLeft: const Radius.circular(8.0),
//                               bottomRight: const Radius.circular(8.0))),
//                       width: 155,
//                       height: 140,
//                       margin: EdgeInsets.fromLTRB(0, 0, 0, 0),

//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: new BorderRadius.only(
//                               topLeft: const Radius.circular(8.0),
//                               topRight: const Radius.circular(8.0),
//                               bottomLeft: const Radius.circular(8.0),
//                               bottomRight: const Radius.circular(8.0)),
//                           image: DecorationImage(
//                             image: new NetworkImage(
//                               news.thumbnail,
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
//                         child: Text(
//                           "WI Vs IND -  InD Won by 20 Run InD Won by 20 RunInD Won by 20 RunInD Won by 20 Run InD Won by 20 Runs" ??
//                               "",
//                           overflow: TextOverflow.visible,
//                           textAlign: TextAlign.left,
//                           maxLines: 2,
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: globals.font_news),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//                         child: Text(
//                           news.title ?? "",
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.left,
//                           maxLines: 3,
//                           style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 12.0,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: globals.font_news),
//                         ),
//                       ),
//                      Container(child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Padding(
//                               padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                               child: Container(
//                                   // constraints: BoxConstraints(
//                                   //    minWidth: 40, maxWidth: 120),

//                                   child: Center(
//                                 child: new Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     _buildButtonColumn(Colors.brown,
//                                         Icons.linked_camera, 'CALL'),
//                                     _buildIconColumn(
//                                         Colors.brown, Icons.share, 'CALL'),
//                                     // _buildButtonColumn(Colors.brown, Icons.arrow_downward, 'CALL'),
//                                   ],
//                                 ),
//                               ))),
//                         ],
//                       )) ,
//                     ],
//                   ),
//                 ),

//                 //_buildShareCol(Colors.brown, Icons.linked_camera, 'CALL'),
//               ],
//             ),
//           ),
//           Container(
//             height: 1,
//             color: Colors.grey[100],
//           ),
//         ],
//       ));
// }