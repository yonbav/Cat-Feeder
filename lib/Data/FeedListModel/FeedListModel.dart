import 'package:cat_feeder/Data/FeedModel/FeedModel.dart';
import 'package:cat_feeder/Services/FeedServices.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FeedListModel extends ChangeNotifier {
  
  final List<FeedModel> _feeds = [];
    
  List<FeedModel> get feeds => List.unmodifiable(_feeds);

  Future reloadAllFromServer() async {
    var allFeeds = await getAllFeeds();
    _feeds.clear();
    _feeds.addAll(allFeeds);
    notifyListeners();
  }

  Future add(FeedModel feed, BuildContext context) async {
    var res = await createFeed(feed);
    if (res.statusCode !=  200)
    {
      Alert(context: context, title: "Error", desc: "Sorry! Failed to add feed.").show();
    }
    else
    {
      _feeds.add(feed);
      notifyListeners();

      // Alerting success
      var alertMessage = "Feed was added to device: " + feed.deviceId;
      Alert(context: context, title: "Info", desc: alertMessage).show();
    }
  }

  Future remove(FeedModel feed, BuildContext context) async {
    var res = await deleteFeed(feed.id);
    if (res.statusCode !=  200)
    {
      Alert(context: context, title: "Error", desc: "Sorry! Failed to remove feed.").show();
    }
    else
    {
      _feeds.remove(feed);
      notifyListeners();

      // Alerting success
      var alertMessage = "Feed " + feed.deviceId + "was deleted";
      Alert(context: context, title: "Info", desc: alertMessage).show();
    }
  }
}