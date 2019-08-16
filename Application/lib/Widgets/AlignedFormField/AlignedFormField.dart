import 'package:flutter/material.dart';

class AlignedForField extends StatelessWidget {
  // Final Members
  final String fieldName;
  final Widget fieldWidget;

  // Constructor
  AlignedForField({Key key, this.fieldName, this.fieldWidget}) : super(key: key);

  // build
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.0),
      child: Row(children: <Widget>[
        Text(fieldName),
        Padding(padding: EdgeInsets.only(right: 25.0),),
        fieldWidget,
      ],),
    );
  }
}