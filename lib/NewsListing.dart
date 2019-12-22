import 'dart:async';
import 'dart:math';
import 'dart:ui' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ui_test/news_slider.dart' as prefix1;
import 'package:ui_test/utils/globals.dart' as globals;
import 'package:ui_test/models/news_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ui_test/news_slider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:ui_test/news_details.dart';

import 'package:ui_test/details_page.dart';

import 'package:ui_test/hotel-details.dart';

import 'package:ui_test/news_details_old.dart';

class NewsListing extends StatefulWidget {
  @override
  _NewsListingState createState() => _NewsListingState();
}

class _NewsListingState extends State<NewsListing> {
  List<String> all = [
    "World",
    "Business",
    "politics",
    "Sports",
    "Tech",
    "Business",
    "politics"
  ];
  List<NewsModel> allnews = [
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _saving = false;
    var parent_width = MediaQuery.of(context).size.width;
    var parent_height = MediaQuery.of(context).size.height;

    // return Scaffold(
    //     // backgroundColor: Colors.blue,
    //     body: Column(
    //   children: <Widget>[
    //     Container(
    //       child: horizontllistrecommendations(all),
    //       height: 230,
    //     ),
    //     Expanded(
    //         child: Container(
    //       child: NewsSlider(this.allnews),
    //       height: 150,
    //       width: MediaQuery.of(context).size.width,
    //       margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
    //     ))
    //   ],
    // ));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ModalProgressHUD(
          inAsyncCall: _saving,
          progressIndicator: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.pink),
          ),
          child: SafeArea(
              bottom: true,
              top: false,
              child: new GestureDetector(
                  onTap: () {
                    //Navigator.pop(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: CustomScrollView(
                            //physics: NeverScrollableScrollPhysics(),
                            slivers: <Widget>[
                              SliverList(
                                delegate: SliverChildListDelegate([
                                  Container(
                                    child: horizontllistrecommendations(all,context),
                                    height: 230,
                                  ),
                                  Container(
                                    child: NewsSlider(this.allnews),
                                    height: 180,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 10.0),
                                  ),
                                ]),
                              ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    var _news = allnews[index];
                                    return new GestureDetector(
                                        onTap: () {},
                                        child: itemsListData(index));
                                  },
                                  childCount:
                                      allnews.length > 0 ? allnews.length : 0,
                                ),
                              ),
                            ],
                          )),
                    ],
                  )))),
    );
  }
}

// Widget newSliderView(List<NewsModel> allNews) {
//   return Container(
//     margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
//     color: Colors.transparent,
//     // decoration: new BoxDecoration(
//     //   image: new DecorationImage(
//     //     image:
//     //         new AssetImage("assets/ImageAssets/splashscreenbackground.png"),
//     //     fit: BoxFit.cover,
//     //   ),
//     // ),
//     child: CarouselSlider(
//       autoPlay: false,
//       enlargeCenterPage: true,
//       aspectRatio: 0.88,
//       viewportFraction: 0.99,
//       onPageChanged: (index) {
//         print("you clicked $index");
//       },
//       items: allNews.map((datalist) {
//         return Builder(
//           builder: (BuildContext context) {
//             return GestureDetector(
//                 onTap: () {
//                   var _news = datalist;
//                 },
//                 child: datalistview(datalist));
//           },
//         );
//       }).toList(),
//     ),
//   );
// }

// Widget sliderView(List<NewsModel> allNews) {
//   return Container(
//     margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
//     color: Colors.transparent,
//     // decoration: new BoxDecoration(
//     //   image: new DecorationImage(
//     //     image:
//     //         new AssetImage("assets/ImageAssets/splashscreenbackground.png"),
//     //     fit: BoxFit.cover,
//     //   ),
//     // ),
//     child: CarouselSlider(
//       autoPlay: false,
//       enlargeCenterPage: true,
//       aspectRatio: 0.88,
//       viewportFraction: 0.99,
//       onPageChanged: (index) {
//         print("you clicked $index");
//       },
//       items: allNews.map((datalist) {
//         return Builder(
//           builder: (BuildContext context) {
//             return GestureDetector(
//                 onTap: () {
//                   var _news = datalist;
//                 },
//                 child: Container(
//                     margin: new EdgeInsets.symmetric(horizontal: 5.0),
//                     child: Stack(
//                       children: <Widget>[
//                         Container(
//                           width: MediaQuery.of(context).size.width,

//                           decoration: new BoxDecoration(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(8.0)),
//                             color: Colors.black.withOpacity(0.5),
//                             image: new DecorationImage(
//                               //image: AssetImage('assets/ImageAsset/placeholder.png') ??
//                               image: new NetworkImage(
//                                 datalist.thumbnail,
//                               ),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           //width: MediaQuery.of(context).size.width,
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                 height: 40,
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: new BoxDecoration(
//                                     color: Colors.black.withOpacity(0.5),
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: const Radius.circular(8.0),
//                                         topRight: const Radius.circular(8.0))),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: <Widget>[
//                                     Padding(
//                                         padding:
//                                             EdgeInsets.fromLTRB(5, 5, 20, 20),
//                                         child: Container(
//                                             // constraints: BoxConstraints(
//                                             //    minWidth: 40, maxWidth: 120),
//                                             height: 28,
//                                             decoration: new BoxDecoration(
//                                                 color: Colors.primaries[Random()
//                                                     .nextInt(Colors
//                                                         .primaries.length)],
//                                                 borderRadius: new BorderRadius.only(
//                                                     topLeft:
//                                                         const Radius.circular(
//                                                             4.0),
//                                                     topRight:
//                                                         const Radius.circular(
//                                                             4.0),
//                                                     bottomLeft:
//                                                         const Radius.circular(4.0),
//                                                     bottomRight: const Radius.circular(4.0))),
//                                             child: Center(
//                                               child: Padding(
//                                                   padding: EdgeInsets.fromLTRB(
//                                                       8, 0, 8, 0),
//                                                   child: Text(
//                                                     "tree",
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                     textAlign: TextAlign.left,
//                                                     maxLines: 1,
//                                                     style: TextStyle(
//                                                         color: Colors.white,
//                                                         fontSize: 14.0,
//                                                         fontWeight:
//                                                             FontWeight.w900,
//                                                         fontFamily:
//                                                             globals.font_news),
//                                                   )),
//                                             ))),
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                   flex: 1,
//                                   child: Container(
//                                     decoration: new BoxDecoration(
//                                         color: Colors.black.withOpacity(0.5),
//                                         borderRadius: BorderRadius.only(
//                                             bottomLeft:
//                                                 const Radius.circular(8.0),
//                                             bottomRight:
//                                                 const Radius.circular(8.0))),
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: <Widget>[
//                                         Row(
//                                           children: <Widget>[
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Icon(
//                                               Icons.access_time,
//                                               color: Colors.white,
//                                               size: 14.0,
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.fromLTRB(
//                                                   2, 2, 6, 4),
//                                               child: Text(
//                                                 "sdsdsdsd",
//                                                 overflow: TextOverflow.ellipsis,
//                                                 maxLines: 2,
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 13.0,
//                                                     fontWeight: FontWeight.w500,
//                                                     fontFamily:
//                                                         globals.font_news),
//                                               ),
//                                             ),
//                                             Icon(
//                                               Icons.remove_red_eye,
//                                               color: Colors.transparent,
//                                               size: 14.0,
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.fromLTRB(
//                                                   2, 2, 6, 4),
//                                               child: Text(
//                                                 "15K",
//                                                 overflow: TextOverflow.ellipsis,
//                                                 maxLines: 2,
//                                                 style: TextStyle(
//                                                     color: Colors.transparent,
//                                                     fontSize: 13.0,
//                                                     fontWeight: FontWeight.w500,
//                                                     fontFamily:
//                                                         globals.font_news),
//                                               ),
//                                             ),
//                                             Icon(
//                                               Icons.favorite,
//                                               color: Colors.transparent,
//                                               size: 14.0,
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.fromLTRB(
//                                                   2, 2, 6, 4),
//                                               child: Text(
//                                                 "278",
//                                                 overflow: TextOverflow.ellipsis,
//                                                 maxLines: 2,
//                                                 style: TextStyle(
//                                                     color: Colors.transparent,
//                                                     fontSize: 13.0,
//                                                     fontWeight: FontWeight.w500,
//                                                     fontFamily:
//                                                         globals.font_news),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: <Widget>[
//                                               Padding(
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     10, 8, 10, 10),
//                                                 child: Text(
//                                                   datalist.title,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   maxLines: 4,
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 16.0,
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontFamily:
//                                                           globals.font_news),
//                                                 ),
//                                               ),
//                                             ]),
//                                       ],
//                                     ),
//                                   ))
//                             ],
//                           ),
//                         )
//                       ],
//                     )));
//           },
//         );
//       }).toList(),
//     ),
//   );
// }

Widget horizontllistrecommendations(List<String> details,BuildContext context) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
    color: Colors.white,
    child: new Container(
      child: new ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount:
            details != null && details.length != null ? details.length : 0,
        itemBuilder: (context, index) {
          return new GestureDetector(
              onTap: () {
Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => new DetailsArea()));
              },
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        // color: Colors.black.withOpacity(0.5),
                        //height: 200,
                        width: 140,

                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          image: new DecorationImage(
                            // image: AssetImage('assets/ImageAsset/placeholder.png'),
                            image: new NetworkImage(
                                "https://i.ytimg.com/vi/8j8n7Fhx21s/maxresdefault_live.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        //width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width - 94,
                              decoration: new BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(10.0),
                                      topRight: const Radius.circular(10.0))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 5, 20, 20),
                                      child: Container()),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 94,
                                  decoration: new BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft:
                                              const Radius.circular(10.0),
                                          bottomRight:
                                              const Radius.circular(10.0))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 40, 0, 0),
                                              child: Text(
                                                "Drone Racing Lea League is raising 50 m League is raising 50 m League is raising 50 m League is raising 50 mgue is raising 50 million League is raising 50 m ",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily:
                                                        globals.font_news),
                                              ),
                                            ),
                                          ]),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 10,
                                            height: 40,
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Text(
                                              "2 hours ago",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  )));
        },
      ),
    ),
  );
}

// Widget datalistview(NewsModel news) {
//   var formatterdateforlist = "Testing";

//   return Container(
//       color: Colors.grey[100],
//       child: Column(
//         children: <Widget>[
//           Container(
//             color: Colors.white,
//             margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
//                           leftSectionIcons,
//                           middleSection
//                         ],
//                       )) ,
//                     ],
//                   ),
//                 ),

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

// final middleSection = new Expanded(
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
//     ],
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

Widget itemsListData(
  index,
) {
  var formatterdateforlist = "Test";
  return Container(
      color: Colors.grey[100],
      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      // color: Colors.green,
                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(8.0),
                              topRight: const Radius.circular(8.0),
                              bottomLeft: const Radius.circular(8.0),
                              bottomRight: const Radius.circular(8.0))),
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.fromLTRB(16, 0, 4, 10),

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(8.0),
                              topRight: const Radius.circular(8.0),
                              bottomLeft: const Radius.circular(8.0),
                              bottomRight: const Radius.circular(8.0)),
                          image: DecorationImage(
                            image: new NetworkImage(
                              "https://miro.medium.com/max/1022/1*1WJH0jVJcC6uY7IpT449XA.jpeg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 14, 0, 0),
                        child: Text(
                          "Testttttt gvxgsvgd sdbcjd jdcjdn djnjd",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: globals.font_news),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                        child: Text(
                          formatterdateforlist ?? "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          maxLines: 10,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: globals.font_news),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 20, 20),
                              child: Container(
                                  // constraints: BoxConstraints(
                                  //    minWidth: 40, maxWidth: 120),
                                  height: 28,
                                  decoration: new BoxDecoration(
                                      // color: Colors.primaries[Random()
                                      //     .nextInt(Colors.primaries.length)],
                                      // borderRadius: new BorderRadius.only(
                                      //     topLeft: const Radius.circular(4.0),
                                      //     topRight:
                                      //         const Radius.circular(4.0),
                                      //     bottomLeft:
                                      //         const Radius.circular(4.0),
                                      //     bottomRight:
                                      //         const Radius.circular(4.0))
                                      ),
                                  child: Center(
                                    child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 0, 8, 0),
                                        child: Text(
                                          "4th Jan",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: globals.font_news),
                                        )),
                                  ))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey[100],
          ),
        ],
      ));
}
