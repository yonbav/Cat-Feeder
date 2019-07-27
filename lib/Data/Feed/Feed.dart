import 'package:uuid/uuid.dart';

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
  Feed({this.feedingTime, this.deviceId, this.isScheduled}) {
    id = uuid.v4();
    createdTime = DateTime.now();
  }

  Feed.fromDevice(deviceId) : this(deviceId: deviceId, feedingTime: DateTime.now(), isScheduled: false);
}