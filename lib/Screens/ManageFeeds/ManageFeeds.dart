import 'package:cat_feeder/Widgets/MyAppBar/index.dart';
import 'package:flutter/material.dart';

class ManageFeeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new MyAppBar(title: "Manage Feed"),
      body: new Center(child: new Text("Manage Feed"))
    );
  }
}