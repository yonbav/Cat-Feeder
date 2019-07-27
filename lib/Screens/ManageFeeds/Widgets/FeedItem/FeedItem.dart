import 'package:cat_feeder/Data/Feed/Feed.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeedItem extends StatelessWidget {
  // Members
  final Feed feed;
  final Function deleteFeed;

  // Constructor
  const FeedItem({Key key, this.feed, this.deleteFeed}) : super(key: key);

  // Build
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding:
          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
      color: Theme.of(context).primaryColorLight,
      width: MediaQuery.of(context).size.width,
      child: Row(children: <Widget>[
        Container(
          child: Image.asset("assets/images/machine_selected.jpeg"),
          width: MediaQuery.of(context).size.width * 0.1,
        ),
        Column(children: <Widget>[
          Text(feed.deviceId),
          Text(new DateFormat("dd/MM/yyyy hh:mm:ss").format(feed.feedingTime)),
        ]),
        RaisedButton(
          color: Theme.of(context).primaryColorLight,
          onPressed: () => deleteFeed(feed.id),
          child: Container(
            child: Image.asset("assets/images/delete.png"),
            width: MediaQuery.of(context).size.width * 0.05,
          ),
        ),
      ]),
    );
  }
}
