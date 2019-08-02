import 'package:cat_feeder/Data/FeedModel/FeedModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeedItem extends StatelessWidget {
  // Members
  final FeedModel feed;
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
        Padding(
          padding:
              EdgeInsets.only(top: 0.0, bottom: 0.0, left: 10.0, right: 10.0),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(
            feed.deviceId,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 5.0, bottom: 5.0, left: 0.0, right: 0.0),
          ),
          Text(new DateFormat("dd/MM/yyyy hh:mm:ss").format(feed.feedingTime)),
        ]),
        Padding(
          padding:
              EdgeInsets.only(top: 0.0, bottom: 0.0, left: 5.0, right: 5.0),
        ),
        IconButton(
          color: Theme.of(context).primaryColorDark,
          onPressed: () => deleteFeed(feed.id),
          icon: Icon(Icons.delete_forever),
        ),
      ]),
    );
  }
}
