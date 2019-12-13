import 'package:flutter/material.dart';
import 'package:ui_test/utils/globals.dart' as globals;
import 'package:ui_test/models/news_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
Color color = Color(0xff59c2ff);

class SliderData extends StatefulWidget {
  final NewsModel news;

  SliderData({Key key, this.news})
      : super(key: key);

  _SliderDataState createState() => _SliderDataState();
}

class _SliderDataState extends State<SliderData> {
  

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


return Container(
      color: Colors.grey[100],
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      // color: Colors.green,
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(8.0),
                              topRight: const Radius.circular(8.0),
                              bottomLeft: const Radius.circular(8.0),
                              bottomRight: const Radius.circular(8.0))),
                      width: 155,
                      height: 140,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(8.0),
                              topRight: const Radius.circular(8.0),
                              bottomLeft: const Radius.circular(8.0),
                              bottomRight: const Radius.circular(8.0)),
                          image: DecorationImage(
                            image: new NetworkImage(
                              widget.news.thumbnail,
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
                        padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                        child: Text(
                          widget.news.title??
                              "",
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
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          widget.news.title ?? "",
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
                     Container(child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          leftSectionIcons,
                          middleSection
                        ],
                      )) ,
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
}



final middleSection = new Expanded(
  child: new Container(
    padding: new EdgeInsets.fromLTRB(40, 0, 0, 0),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
      _buildShareCol(Colors.brown, Icons.linked_camera, 'CALL'),
      ],
    ),
  ),
);


final leftSectionIcons = new Container(
  child: new Column(
    children: <Widget>[
      new Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    _buildButtonColumn(Colors.brown,
                                        Icons.linked_camera, 'CALL'),
                                    _buildIconColumn(
                                        Colors.brown, Icons.share, 'CALL'),
                                    // _buildButtonColumn(Colors.brown, Icons.arrow_downward, 'CALL'),
                                  ],
                                ),
    ],
  ),
);

Column _buildShareCol(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          margin: EdgeInsets.fromLTRB(20, 15, 1, 0),
          height: 23,
          //child: new Image.asset('assets/icons/icon-bookmark.png'))
          child: new IconButton(
            iconSize: 20,
            icon:  new Image.asset('assets/icons/icon-bookmark.png'),
           // tooltip: 'Closes application',
            onPressed: () => {

            },
          ),
      )],
  );
}

Column _buildIconColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Icon(
          Icons.share,
          color: Colors.pink,
          size: 20.0,
        ),
      )
    ],
  );
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child:
          new IconButton(
            iconSize: 20,
            icon:  new Image.asset('assets/icons/social-media.png'),
            tooltip: 'Closes application',
            onPressed: () => {

            },
          )
          )
     
    ],
  );
}
