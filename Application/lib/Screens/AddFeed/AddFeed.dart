import 'package:cat_feeder/Screens/AddFeed/Widgets/AddFeedForm/index.dart';
import 'package:cat_feeder/Widgets/MyAppBar/index.dart';
import 'package:flutter/material.dart';
import 'package:cat_feeder/Globals.dart';

class AddFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new MyAppBar(
        title: "Add Feed",
        selectedChoice: eChoices.AddFeed,
      ),
      body: AddFeedForm(),
    );
  }
}
