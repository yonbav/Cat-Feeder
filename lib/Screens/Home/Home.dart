import 'package:cat_feeder/Widgets/MyAppBar/index.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new MyAppBar(title: "Home"),
      body: new Center(child: new Text("Home"))
    );
  }
}