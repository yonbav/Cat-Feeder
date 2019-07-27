import 'package:cat_feeder/Data/Feed/Feed.dart';
import 'package:flutter/material.dart';
import '../FeedItem/index.dart';

class FeedList extends StatelessWidget {
  // Members
  final List<Feed> feeds;

  // Constructor
  const FeedList({Key key, this.feeds}) : super(key: key);

  // build
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: feeds.length,
        itemBuilder: (BuildContext context, int index) {
          return FeedItem(feed: feeds[index],);
        },
      ),
    );
  }
}
