import 'package:flutter/material.dart';
import 'package:flutter_map_booking/Model/map_type_model.dart';

class SelectMapTypeView extends StatelessWidget {
  final MapTypeModel _item;
  SelectMapTypeView(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 70.0,
            width: 70.0,
            decoration: new BoxDecoration(
              border: new Border.all(
                  width: 3.0,
                  color: _item.isSelected
                      ? Colors.blueAccent
                      : Colors.white),
              borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
              image: DecorationImage(
                image: AssetImage(
                    _item.image
                ),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            child: new Text(_item.text),
          )
        ],
      ),
    );
  }
}

