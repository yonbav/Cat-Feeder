import 'package:cat_feeder/Data/Feed/Feed.dart';
import 'package:cat_feeder/Globals.dart';
import 'package:cat_feeder/Screens/ManageFeeds/Widgets/FeedList/index.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FeedListManager extends StatefulWidget {
  FeedListManager({Key key}) : super(key: key);

  _FeedListManagerState createState() => _FeedListManagerState();
}

class _FeedListManagerState extends State<FeedListManager> {

  // Members 
  List<Feed> _feeds = feedsFromServer;

  // build
  @override
  Widget build(BuildContext context) {
    return Container(
       child: FeedList(feeds: _feeds, deleteFeed: _deleteFeed,),
    );
  }

  // private methods
  void _deleteFeed(String feedId) 
  {
    Alert(context: context, title: "Delete Feed", desc: "deleting feed wit id " + feedId).show();
  }
}