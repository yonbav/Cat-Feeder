import 'package:cat_feeder/Globals.dart';
import 'package:cat_feeder/Widgets/FeedMachinesManager/index.dart';
import 'package:cat_feeder/Widgets/MyAppBar/index.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Home",
        selectedChoice: eChoices.Home,
      ),
      body: FeedMachineManager(),
    );
  }
}
