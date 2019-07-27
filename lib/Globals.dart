import 'package:cat_feeder/Data/Feed/Feed.dart';

import 'Data/Machine/Machine.dart';

enum eChoices {
    Home,
    AddFeed,
    ManageFeed
}

String appFontFamily = "Arial";

List<Machine> machinesFromServer = [
    new Machine("111"),
    new Machine("222"),
    new Machine("333"),
    new Machine("444"),
    new Machine("555"),
    new Machine("666"),
    new Machine("777"),
    new Machine("888"),
    new Machine("999"),
    new Machine("1212"),
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