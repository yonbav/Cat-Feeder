import 'dart:convert';
import 'package:uuid/uuid.dart';


Feed feedFromJson(String str) {
  final jsonData = json.decode(str);
  return Feed.fromJson(jsonData);
}

String feedToDeleteJson(String id) {
  final dyn =  {
  "Key": {
    "Id" : id,
  },
  "TableName": "Feeds",
  "ReturnValues": "ALL_OLD",
};
  return json.encode(dyn);
}

String feedToJson(Feed data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

List<Feed> allFeedsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Feed>.from(jsonData.map((x) => Feed.fromJson(x)));
}

class Feed {

  // Static Members
  var uuid = new Uuid();

  // Members
  String   id;
  bool     isScheduled;
  DateTime createdTime;
  DateTime feedingTime;
  String   deviceId;

  // Constructors
  Feed.createFull({this.feedingTime, this.deviceId, this.isScheduled, this.id, this.createdTime});

  Feed({this.feedingTime, this.deviceId, this.isScheduled}) {
    id = uuid.v4();
    createdTime = DateTime.now();
  }

  Feed.fromDevice(String deviceId) : this(deviceId: deviceId, feedingTime: DateTime.now(), isScheduled: false);

  factory Feed.fromJson(Map<String, dynamic> json) => new Feed.createFull(
    id: json["id"],
    isScheduled: json["isScheduled"],
    createdTime: json["createdTime"],
    feedingTime: json["feedingTime"],
    deviceId: json["deviceId"],
  );
  
  Map<String, dynamic> toJson() => {
    "id": id,
    "isScheduled": isScheduled,
    "createdTime": createdTime,
    "feedingTime": feedingTime,
    "deviceId": deviceId,
  };
}