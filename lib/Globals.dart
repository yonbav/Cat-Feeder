import 'package:cat_feeder/Data/Feed/Feed.dart';

import 'Data/Machine/Machine.dart';

enum eChoices {
    Home,
    AddFeed,
    ManageFeed
}

String appFontFamily = "Arial";

List<Machine> machinesFromServer = [
    new Machine(id:"111"),
    new Machine(id:"222"),
    new Machine(id:"333"),
    new Machine(id:"444"),
    new Machine(id:"555"),
    new Machine(id:"666"),
    new Machine(id:"777"),
    new Machine(id:"888"),
    new Machine(id:"999"),
    new Machine(id:"1212"),
  ];


List<Feed> feedsFromServer = [
    new Feed(deviceId: "111",feedingTime: DateTime.now(), isScheduled: false),
    new Feed(deviceId: "111",feedingTime: DateTime.now(), isScheduled: false),
    new Feed(deviceId: "222",feedingTime: DateTime.now(), isScheduled: false),
    new Feed(deviceId: "222",feedingTime: DateTime.now(), isScheduled: false),
    new Feed(deviceId: "111",feedingTime: DateTime.now(), isScheduled: false),
    new Feed(deviceId: "333",feedingTime: DateTime.now(), isScheduled: false),
    new Feed(deviceId: "111",feedingTime: DateTime.now(), isScheduled: false),
    new Feed(deviceId: "333",feedingTime: DateTime.now(), isScheduled: false),
    new Feed(deviceId: "222",feedingTime: DateTime.now(), isScheduled: false),
  ];

  String  serverURL = 'https://irw3hewccf.execute-api.us-east-2.amazonaws.com/PROD/%7Bfeedsapi+%7D';