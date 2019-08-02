import 'package:cat_feeder/Data/BusyIndicator/BusyIndicator.dart';
import 'package:cat_feeder/Data/FeedListModel/FeedListModel.dart';
import 'package:cat_feeder/Widgets/MyAppBar/index.dart';
import 'package:cat_feeder/Globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Widgets/FeedsListManager/index.dart';

class ManageFeeds extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    final busyIndicatorProvider = Provider.of<BusyIndicator>(context, listen: false);
    final feedsProvider = Provider.of<FeedListModel>(context, listen: false);

    busyIndicatorProvider.setIsBusy(true);
    feedsProvider.reloadAllFromServer();
    busyIndicatorProvider.setIsBusy(false);

    return new Scaffold(
      appBar: new MyAppBar(
        title: "Manage Feeds",
        selectedChoice: eChoices.ManageFeed,
      ),
      body: FeedListManager(),
    );
  }
}
