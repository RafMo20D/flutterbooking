import 'package:flutter/material.dart';
import 'package:flutter_map_booking/theme/style.dart';

class HistoryTrip extends StatelessWidget {
  final String fromAddress,toAddress;

  HistoryTrip({this.fromAddress,this.toAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
//        decoration: BoxDecoration(
//            color: Colors.white,
//            borderRadius: BorderRadius.all(Radius.circular(10)),
//            boxShadow: [
//              BoxShadow(
//                color: Color(0x88999999),
//                offset: Offset(0, 5),
//                blurRadius: 5.0,
//              ),
//            ]),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: new Column(
                children: <Widget>[
                  new Icon(Icons.my_location,size: 20.0,color: Colors.blue,),
                  new Icon(Icons.more_vert,size: 20.0,color: greyColor,),
                  new Icon(Icons.location_on,size: 20.0,color: redColor,)
                ],
              ),
            ),
            new Expanded(
                flex: 5,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width - 50,
                      color: Colors.white,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            fromAddress != null ? fromAddress : '',
                            overflow: TextOverflow.ellipsis,
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width - 50.0,
                      height: 1.0,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    new Container(
                      height: 50.0,
                      // width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            toAddress != null ? toAddress : '',
                            overflow: TextOverflow.ellipsis,
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
            new Expanded(
                flex: 1,
                child: Text('')
            )
          ],
        )
    );
  }
}
