import 'package:cat_feeder/Data/BusyIndicator/BusyIndicator.dart';
import 'package:cat_feeder/Data/FeedListModel/FeedListModel.dart';
import 'package:cat_feeder/Data/FeedModel/FeedModel.dart';
import 'package:cat_feeder/Screens/ManageFeeds/Widgets/FeedList/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedListManager extends StatefulWidget {
  FeedListManager({Key key}) : super(key: key);

  _FeedListManagerState createState() => _FeedListManagerState();
}

class _FeedListManagerState extends State<FeedListManager> {
  // Members
  List<FeedModel> _feeds = [];

  // build
  @override
  Widget build(BuildContext context) {
    return Consumer<BusyIndicator>(
      builder: (BuildContext context, BusyIndicator value, Widget child) {
        return value.isBusy
            ? CircularProgressIndicator()
            : Consumer<FeedListModel>(
                builder: (BuildContext context, FeedListModel feedsProvider,
                    Widget child) {
                  _feeds = feedsProvider.feeds;
                  return Container(
                    child: FeedList(
                      feeds: _feeds,
                      deleteFeed: _deleteFeed,
                    ),
                  );
                },
              );
      },
    );
  }

  // private methods
  Future _deleteFeed(FeedModel feed) async {
    // Getting the needed providers
    final feedsProvider = Provider.of<FeedListModel>(context, listen: false);
    final busyIndicatorProvider =
        Provider.of<BusyIndicator>(context, listen: false);

    //Show busy indicator
    busyIndicatorProvider.setIsBusy(true);

    // Adding the feeds
    await feedsProvider.remove(feed, context);

    //Stopping busy indicator
    busyIndicatorProvider.setIsBusy(false);
  }
}
