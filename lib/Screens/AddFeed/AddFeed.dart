import 'package:cat_feeder/Widgets/MyAppBar/index.dart';
import 'package:flutter/material.dart';

class AddFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new MyAppBar(title: "Add Feed"),
      body: new Center(child: new Text("AddFeed"))
    );
  }
}