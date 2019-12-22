import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ui_test/models/details.dart';
Color color = Color(0xff59c2ff);

class DetailsArea extends StatefulWidget {

  _DetailsAreaState createState() => _DetailsAreaState();
}

class _DetailsAreaState extends State<DetailsArea> {
  int _activeInndex = 0;




  @override
  Widget build(BuildContext context) {
    var arr=[
      {"title":"p","desc":"The University of Delhi (DU), a Central University, has invited online applications from academically qualified and interested individuals for filling 51 vacancies to the post of Assistant Professors in various disciplines comprising Botany, Chemistry, Commerce, Economics, English, Environmental Science, Hindi, History, Mathematics, Philosophy, Physics, Political Science, Sanskrit, Sociology, Statistics and Zoology through direct recruitment to be posted at the Hindu College under DU. The application process towards the same started on December 3, 2019 and closes on December 30, 2019."}
	  ,{"title":"p","description":"\u003cstrong\u003e\u003c/strong\u003e"},
	  
	  
	  {"title":"img","description":"https://www.careerindia.com/img/2019/12/du-1575634287.jpg"}];

List<DetailsModel> news=[];
news.add(new DetailsModel("p", "The University of Delhi (DU), a Central University, has invited online applications from academically qualified and interested individuals for filling 51 vacancies to the post of Assistant Professors in various disciplines comprising Botany, Chemistry, Commerce, Economics, English, Environmental Science, Hindi, History, Mathematics, Philosophy, Physics, Political Science, Sanskrit, Sociology, Statistics and Zoology through direct recruitment to be posted at the Hindu College under DU. The application process towards the same started on December 3, 2019 and closes on December 30, 2019."));
news.add(new DetailsModel("img","https://www.careerindia.com/img/2019/12/du-1575634287.jpg"));

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

   return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              
              centerTitle: true,
              expandedHeight: 300,
              floating: true,
              pinned: true,
              snap: true,
              title: new Text("Politics"),
              actions: <Widget>[
 IconButton(
        icon: new Image.asset('assets/icons/icon-share.png' , height: 25,),
        
      //  tooltip: 'Increase volume by 10',
        onPressed: () {
          setState(() {
          
          });
        },
      )
              ],
              leading: IconButton(
                icon: new Image.asset('assets/icons/icon-left.png' , height: 25,),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.blue,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  title: Text(
                    "test",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        ),
                  ),
                  background: Container(
                      //color: Colors.white,

                      decoration: new BoxDecoration(
                        border: new Border.all(
                            width: 0.0, color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(
                                4.0) //                 <--- border radius here
                            ),
                        //shape: BoxShape.circle,
                        color: Colors.black,
                        image: new DecorationImage(
                          image: new NetworkImage("https://www.pcma.org/wp-content/uploads/2019/08/Travel-tips.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0.4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 100,
                              color: Colors.transparent,
                              child: headerview(context),
                            )
                          ],
                        ),
                      ))),
            ),
            
             SliverList(
      
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
            
var newsObj=news[index];

if(newsObj.title=='img'){
return new Container(
      height:  200,
    
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: new NetworkImage(
              newsObj.descrption),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
}else{
  return Container(

            alignment: Alignment.center,
           
            child: Html(
            data:news[index].descrption,
            )
          );
}
          
        },
        childCount: news.length
      ),
      
    )
          ],
        ));
  }
}


  Widget headerview(BuildContext context) {
      return Material(
          type: MaterialType.transparency,
          child: Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.fromLTRB(10, 24, 12, 0),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Hi Loter hge hebdhbedh  dhedhe  hedheb",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                         ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(12, 2, 6, 14),
                            child: Text(
                              "25th Jan 2019",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(4, 0, 12, 14),
                              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              height: 20,
                              decoration: new BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(4.0),
                                      topRight: const Radius.circular(4.0),
                                      bottomLeft: const Radius.circular(4.0),
                                      bottomRight: const Radius.circular(4.0))),
                              child: Center(
                                child: Text(
                                 "test",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w400,
                                      ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));
    }
  
