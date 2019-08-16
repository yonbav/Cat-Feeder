import 'dart:convert';
import 'package:uuid/uuid.dart';


FeedModel feedFromJson(String str) {
  final jsonData = json.decode(str);
  return FeedModel.fromJson(jsonData);
}

String feedToDeleteJson(String id) {
  final dyn =  {
  "Key": {
    "Id" : id,
  },
  "TableName": "Feeds",
};
  return json.encode(dyn);
}

String feedToAddJson(FeedModel data) {
  final dyn = {
    "Item" : {
      "Id": data.id,
      "IsScheduled": data.isScheduled.toString(),
      "CreatedTime": data.createdTime.toIso8601String(),
      "FeedingTime": data.feedingTime.toIso8601String(),
      "DeviceId": data.deviceId,
    },
    "TableName":"Feeds" 
  };
  return json.encode(dyn);
}

List<FeedModel> allFeedsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<FeedModel>.from(jsonData["Items"].map((x) => FeedModel.fromJson(x)));
}

class FeedModel {

  // Static Members
  var uuid = new Uuid();

  // Members
  String   id;
  bool     isScheduled;
  DateTime createdTime;
  DateTime feedingTime;
  String   deviceId;

  // Constructors
  FeedModel.createFull({this.feedingTime, this.deviceId, this.isScheduled, this.id, this.createdTime});

  FeedModel({this.feedingTime, this.deviceId, this.isScheduled}) {
    id = uuid.v4();
    createdTime = DateTime.now();
  }

  FeedModel.fromDevice(String deviceId) : this(deviceId: deviceId, feedingTime: DateTime.now(), isScheduled: false);

  factory FeedModel.fromJson(Map<String, dynamic> json) => new FeedModel.createFull(
    id: json["Id"],
    isScheduled: json["IsScheduled"].toString().toLowerCase() == "true",
    createdTime: DateTime.parse(json["CreatedTime"]),
    feedingTime: DateTime.parse(json["FeedingTime"]),
    deviceId: json["DeviceId"],
  );
}