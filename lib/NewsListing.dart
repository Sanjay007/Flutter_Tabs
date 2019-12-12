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

class NewsListing extends StatefulWidget {
  @override
  _NewsListingState createState() => _NewsListingState();
}
class _NewsListingState extends State<NewsListing> {
List<String> all=["World","Business","politics","Sports","Tech","Business","politics"];
List<NewsModel> allnews=[
  NewsModel(title:"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire,",thumbnail:"https://media.gettyimages.com/photos/tourist-visiting-spain-picture-id895081824?s=612x612",descrption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." ,created: "22-08-1990" ),
   NewsModel(title:"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire,",thumbnail:"https://s29081.pcdn.co/wp-content/uploads/2019/03/big-dream-boatman-coron-island-hopping-tour-expedition-3154.jpg.optimal.jpg",descrption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",created: "22-08-1990"  ),
   NewsModel(title:"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire,",thumbnail:"https://content.usaa.com/mcontent/static_assets/Media/ent-mainBnr-travelMain.jpg?cacheid=908809786_p",descrption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",created: "22-08-1990"  )
];

@override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    var parent_width=MediaQuery.of(context).size.width;
    var parent_height=MediaQuery.of(context).size.height;
    
  return Scaffold(     
    backgroundColor: Colors.blue,
   body:Column(
     children: <Widget>[
       Container(child: horizontllistrecommendations(all),height: 210,),
       Expanded(child: Container(child: newSliderView(allnews),
       height:150,
       width: MediaQuery.of(context).size.width,
       margin:EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
       ))
      
     ],
   )

);
  }

}

  Widget newSliderView(List<NewsModel> allNews) {
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
                  child: datalistview(datalist));
            },
          );
        }).toList(),

        
      ),
    );
  }


  Widget sliderView(List<NewsModel> allNews) {
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
                  child: Container(
                      margin: new EdgeInsets.symmetric(horizontal: 5.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                          width: MediaQuery.of(context).size.width,
                            height: 230,
                            decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              color: Colors.black.withOpacity(0.5),
                              image: new DecorationImage(
                                //image: AssetImage('assets/ImageAsset/placeholder.png') ??
                                image: new NetworkImage(
                                  datalist.thumbnail,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            //width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: new BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(8.0),
                                          topRight:
                                              const Radius.circular(8.0))),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 20, 20),
                                          child: Container(
                                              // constraints: BoxConstraints(
                                              //    minWidth: 40, maxWidth: 120),
                                              height: 28,
                                              decoration: new BoxDecoration(
                                                  color: Colors.primaries[
                                                      Random().nextInt(Colors
                                                          .primaries.length)],
                                                  borderRadius: new BorderRadius.only(
                                                      topLeft:
                                                          const Radius.circular(
                                                              4.0),
                                                      topRight:
                                                          const Radius.circular(
                                                              4.0),
                                                      bottomLeft:
                                                          const Radius.circular(4.0),
                                                      bottomRight: const Radius.circular(4.0))),
                                              child: Center(
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            8, 0, 8, 0),
                                                    child: Text(
                                                     "tree",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontFamily: globals
                                                              .font_news),
                                                    )),
                                              ))),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: new BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft:
                                                  const Radius.circular(8.0),
                                              bottomRight:
                                                  const Radius.circular(8.0))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                Icons.access_time,
                                                color: Colors.white,
                                                size: 14.0,
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    2, 2, 6, 4),
                                                child: Text(
                                                  "sdsdsdsd",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          globals.font_news),
                                                ),
                                              ),
                                              Icon(
                                                Icons.remove_red_eye,
                                                color: Colors.transparent,
                                                size: 14.0,
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    2, 2, 6, 4),
                                                child: Text(
                                                  "15K",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Colors.transparent,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          globals.font_news),
                                                ),
                                              ),
                                              Icon(
                                                Icons.favorite,
                                                color: Colors.transparent,
                                                size: 14.0,
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    2, 2, 6, 4),
                                                child: Text(
                                                  "278",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Colors.transparent,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          globals.font_news),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 8, 10, 10),
                                                  child: Text(
                                                    datalist.title,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 4,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            globals.font_news),
                                                  ),
                                                ),
                                              ]),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          )
                        ],
                      )));
            },
          );
        }).toList(),

        
      ),
    );
  }


 Widget horizontllistrecommendations(List<String> details) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      color: Colors.blue,
      child: new Container(
        child: new ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: details != null && details.length != null
              ? details.length
              : 0,
          itemBuilder: (context, index) {
            return new GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          // color: Colors.black.withOpacity(0.5),
                          //height: 200,
                          width: 140,
                          
                          decoration: new BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            image: new DecorationImage(
                              // image: AssetImage('assets/ImageAsset/placeholder.png'),
                              image: new NetworkImage(
                                "https://assets-news-bcdn.dailyhunt.in/cmd/resize/400x400_60/fetchdata15/images/e4/0c/0e/e40c0e23a0cff21e0e43fba1fcb35160.webp"
                              ),
                              fit: BoxFit.cover,
                              
                            ),
                          ),
                          //width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                               height:40,
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
                                        child: Container(
                                            
                                            )),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 94,
                                    decoration: new BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                const Radius.circular(10.0),
                                            bottomRight:
                                                const Radius.circular(10.0))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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

                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                          fontFamily: globals.font_news
                                                     ),
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
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0),
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


Widget datalistview(NewsModel news) {
  var formatterdateforlist ="Testing";
   
    return Container(
        color: Colors.grey[100],
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
                        width: 155,
                        height: 150,
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),

                        child: Container(
  decoration: BoxDecoration(
   borderRadius: new BorderRadius.only(
                                            topLeft: const Radius.circular(8.0),
                                            topRight:
                                                const Radius.circular(8.0),
                                            bottomLeft:
                                                const Radius.circular(8.0),
                                            bottomRight:
                                                const Radius.circular(8.0)),
    image: DecorationImage(
      image: new NetworkImage(
                                  'https://assets-news-bcdn.dailyhunt.in/cmd/resize/400x400_60/fetchdata15/images/7a/c1/3a/7ac13a843b3533710fd48678e96ed75b.jpg',
                                ),
      fit: BoxFit.cover,
    ),
    
  ),
)

                              ,

                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 12, 12, 0),
                          child: Text(
                            "WI Vs IND -  InD Won by 20 Run InD Won by 20 RunInD Won by 20 RunInD Won by 20 Run InD Won by 20 Runs" ?? "",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                
                                fontWeight: FontWeight.w600,
                                fontFamily: globals.font_news),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Text(
                            news.title ?? "",

                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: globals.font_news),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.fromLTRB(8, 5, 20, 20),
                                child: Container(
                                    // constraints: BoxConstraints(
                                    //    minWidth: 40, maxWidth: 120),
                                  
                                    
                                    child: Center(
                                      child: new Row(
mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,  
  children: <Widget>[
   _buildButtonColumn(Colors.brown, Icons.linked_camera, 'CALL'),
   _buildIconColumn(Colors.brown, Icons.share, 'CALL'),
  // _buildButtonColumn(Colors.brown, Icons.arrow_downward, 'CALL'),

  ],
),
                                    ))),
                          ],
                        ),
                      ],
                    ),
                  ),

  //_buildShareCol(Colors.brown, Icons.linked_camera, 'CALL'),

                ],
              ),
            ),
            Container(
              height: 1,
              color: Colors.blue,
            ),
          ],
        ));
  }





Column _buildShareCol(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        Container(
           margin: EdgeInsets.fromLTRB(1, 80, 1, 0),
           height: 23,
          child: new  Image.asset(
                                  'assets/icons/icon-bookmark.png'
                                )
        )
      ],
    );
  }



Column _buildIconColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
              margin: EdgeInsets.fromLTRB(12, 15, 13, 0),
          child:Icon(
      Icons.favorite,
      color: Colors.pink,
      size: 20.0,
      
    ),
        ),
        new Text("22",style: TextStyle(
                                color: Colors.black,
                                fontSize: 5.0,
                                
                                fontWeight: FontWeight.w100,
                                fontFamily: globals.font_news))
      ],
    );
  }



Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
           margin: EdgeInsets.fromLTRB(12, 15, 13, 0),
          child: new  Image.asset(
                                  'assets/icons/social-media.png'
                                )
        ),
        new Text("22",style: TextStyle(
                                color: Colors.black,
                                fontSize: 5.0,
                                
                                fontWeight: FontWeight.w100,
                                fontFamily: globals.font_news))
      ],
    );
  }
