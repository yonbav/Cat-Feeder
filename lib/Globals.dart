import 'package:cat_feeder/Data/FeedModel/FeedModel.dart';

import 'Data/MachineModel/MachineModel.dart';

enum eChoices {
    Home,
    AddFeed,
    ManageFeed
}

String appFontFamily = "Arial";

List<MachineModel> machinesFromServer = [
    new MachineModel(id:"111"),
    new MachineModel(id:"222"),
    new MachineModel(id:"333"),
    new MachineModel(id:"444"),
    new MachineModel(id:"555"),
    new MachineModel(id:"666"),
    new MachineModel(id:"777"),
    new MachineModel(id:"888"),
    new MachineModel(id:"999"),
    new MachineModel(id:"1212"),
  ];


List<FeedModel> feedsFromServer = [
    new FeedModel(deviceId: "111",feedingTime: DateTime.now(), isScheduled: false),
    new FeedModel(deviceId: "111",feedingTime: DateTime.now(), isScheduled: false),
    new FeedModel(deviceId: "222",feedingTime: DateTime.now(), isScheduled: false),
    new FeedModel(deviceId: "222",feedingTime: DateTime.now(), isScheduled: false),
    new FeedModel(deviceId: "111",feedingTime: DateTime.now(), isScheduled: false),
    new FeedModel(deviceId: "333",feedingTime: DateTime.now(), isScheduled: false),
    new FeedModel(deviceId: "111",feedingTime: DateTime.now(), isScheduled: false),
    new FeedModel(deviceId: "333",feedingTime: DateTime.now(), isScheduled: false),
    new FeedModel(deviceId: "222",feedingTime: DateTime.now(), isScheduled: false),
  ];

  String  serverURL = 'https://irw3hewccf.execute-api.us-east-2.amazonaws.com/PROD/%7Bfeedsapi+%7D';