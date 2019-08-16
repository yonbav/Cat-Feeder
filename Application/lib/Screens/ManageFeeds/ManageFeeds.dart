import 'package:cat_feeder/Widgets/MyAppBar/index.dart';
import 'package:cat_feeder/Globals.dart';
import 'package:flutter/material.dart';

import 'Widgets/FeedsListManager/index.dart';

class ManageFeeds extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new MyAppBar(
        title: "Manage Feeds",
        selectedChoice: eChoices.ManageFeed,
      ),
      body: FeedListManager(),
    );
  }
}
