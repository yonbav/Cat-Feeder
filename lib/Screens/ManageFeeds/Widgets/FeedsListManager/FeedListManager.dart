import 'package:cat_feeder/Data/Feed/Feed.dart';
import 'package:cat_feeder/Globals.dart';
import 'package:cat_feeder/Screens/ManageFeeds/Widgets/FeedList/index.dart';
import 'package:flutter/material.dart';

class FeedListManager extends StatefulWidget {
  FeedListManager({Key key}) : super(key: key);

  _FeedListManagerState createState() => _FeedListManagerState();
}

class _FeedListManagerState extends State<FeedListManager> {
  List<Feed> _feeds = feedsFromServer;

  @override
  Widget build(BuildContext context) {
    return Container(
       child: FeedList(feeds: _feeds,),
    );
  }
}