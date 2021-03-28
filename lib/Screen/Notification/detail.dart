import 'package:flutter/material.dart';
import 'package:flutter_map_booking/theme/style.dart';

class NotificationDetail extends StatefulWidget {

  final String id;

  NotificationDetail({this.id});

  @override
  _NotificationDetailState createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
  }

  dialogInfo(){
    AlertDialog(
      title: Text("Information"),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      content: Text('Delete successful'),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: (){
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Notification Detail',style: TextStyle(color: blackColor),),
          backgroundColor: whiteColor,
          elevation: 2.0,
          iconTheme: IconThemeData(color: blackColor),
          actions: <Widget>[
            new IconButton(
                icon: Icon(Icons.restore_from_trash,color: blackColor,),
                onPressed: (){showDialog(context: context, child: dialogInfo());}
            )
          ]
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();
          return false;
        },
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                new Container(
                  height: 220.0,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          fit: BoxFit.fill, image: AssetImage('assets/image/news.jpg')
                      )
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.all(16.0),
                  child: new Row(
                    children: <Widget>[
                      new Text(
                        "CDC",
                        style: textBoldBlack,
                      ),
                      new Container(
                        padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new Icon(
                          Icons.access_time,
                          size: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      new Expanded(
                          child: new Text(
                            "1h ago",
                            style: textBoldBlack,
                          )),
                      new GestureDetector(
                        child: new Container(
                          padding: new EdgeInsets.only(bottom: 5.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                bottom: const BorderSide(
                                    width: 1.0,
                                    color: secondary),
                              )),
                          child: new Text(
                            "ENVIRONMENT",
                            style: textStyleActive,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: new EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                  child: Text("Flutter is Google's mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time",style: heading18Black,),
                ),
                new Container(
                  padding: new EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                  child: new Text(
                    "Flutter is Google's mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source."
                        "We want to enable designers to deliver their full creative vision without being forced to water it down due to limitations of the underlying framework. Flutter's layered architecture gives you control over every pixel on the screen, and its powerful compositing capabilities let you overlay and animate graphics, video, text and controls without limitation. Flutter includes a full set of widgets that deliver pixel-perfect experiences on both iOS and Android.",
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
