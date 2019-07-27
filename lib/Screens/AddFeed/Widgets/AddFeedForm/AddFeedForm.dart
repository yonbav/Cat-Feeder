import 'package:cat_feeder/Data/Feed/Feed.dart';
import 'package:cat_feeder/Data/Machine/Machine.dart';
import 'package:cat_feeder/Widgets/AlignedFormField/index.dart';
import 'package:cat_feeder/Widgets/BasicDateTimeField/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../Globals.dart';

class AddFeedForm extends StatefulWidget {
  AddFeedForm({Key key}) : super(key: key);

  _AddFeedFormState createState() => _AddFeedFormState();
}

class _AddFeedFormState extends State<AddFeedForm> {
  // Final Members
  final _formKey               = GlobalKey<FormState>();
  final List<Machine> _devices = machinesFromServer;
  final int paddingSpaces      = 30;
  final String feedingTime     = "Feeding Time: ";
  final String deviceId        = "Device Id: ";
  final String isScheduled     = "Is Scheduled: ";

  // Members
  Feed _feed;

  @override
  void initState() {
    _feed = Feed.fromDevice(_devices.first.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            AlignedForField(
              fieldName: feedingTime.padRight(paddingSpaces - feedingTime.length),
              fieldWidget: BasicDateTimeField(
                width: MediaQuery.of(context).size.width * 0.5,
                onDateTimeChanged: _setSelectedDateTime,
                defaultValue: _feed.feedingTime,
                enabled: !_feed.isScheduled,
              ),
            ),
            AlignedForField(
              fieldName: deviceId.padRight(paddingSpaces - deviceId.length),
              fieldWidget: DropdownButton(
                value: _feed.deviceId,
                items: _getAvailableDevices(),
                onChanged: _setSelectedDevice,
              ),
            ),
            AlignedForField(
              fieldName: isScheduled.padRight(paddingSpaces - isScheduled.length),
              fieldWidget: Switch(
                onChanged: _setIsScheduled,
                value: _feed.isScheduled,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 55.0),
            ),
            RaisedButton(
              child: Text("Feed"),
              onPressed: _saveFeed,
            ),
          ],
        ),
      ),
    );
  }

  // Privavte Methods
  void _setSelectedDateTime(value) {
    setState(() {
      _feed.feedingTime = value;
    });
  }

  void _setSelectedDevice(value) {
    setState(() {
      _feed.deviceId = value;
    });
  }

  void _setIsScheduled(value) {
    setState(() {
      _feed.isScheduled = value;
    });
  }

  List<DropdownMenuItem> _getAvailableDevices() {
    return _devices
        .map((element) => DropdownMenuItem(
              child: Text(element.id),
              value: element.id,
            ))
        .toList();
  }

  void _saveFeed() {
    var alertMessage = "Sending new feed to the server {\n" +
        _feed.id +
        "\n" +
        _feed.deviceId +
        "\n" +
        _feed.createdTime.toString() +
        "\n" +
        _feed.feedingTime.toString() +
        "\n" +
        _feed.isScheduled.toString() +
        "\n }";

    Alert(context: context, title: "Add Feed", desc: alertMessage).show();
  }
}
