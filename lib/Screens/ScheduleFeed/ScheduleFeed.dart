import 'package:cat_feeder/Widgets/MyAppBar/index.dart';
import 'package:flutter/material.dart';
import 'package:cat_feeder/Globals.dart';

class ScheduleFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new MyAppBar(
        title: "Schedule Feed",
        selectedChoice: eChoices.ManageFeed,
      ),
      body: new Center(
        child: new Text("Schedule Feed"),
      ),
    );
  }
}
