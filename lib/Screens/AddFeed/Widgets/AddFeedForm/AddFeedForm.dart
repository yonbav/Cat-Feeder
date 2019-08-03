import 'package:cat_feeder/Data/BusyIndicator/BusyIndicator.dart';
import 'package:cat_feeder/Data/FeedListModel/FeedListModel.dart';
import 'package:cat_feeder/Data/FeedModel/FeedModel.dart';
import 'package:cat_feeder/Data/MachineListModel/MachineListModel.dart';
import 'package:cat_feeder/Data/MachineModel/MachineModel.dart';
import 'package:cat_feeder/Widgets/AlignedFormField/index.dart';
import 'package:cat_feeder/Widgets/BasicDateTimeField/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AddFeedForm extends StatefulWidget {
  AddFeedForm({Key key}) : super(key: key);

  _AddFeedFormState createState() => _AddFeedFormState();
}

class _AddFeedFormState extends State<AddFeedForm> {
  // Final Members
  final _formKey = GlobalKey<FormState>();
  final List<MachineModel> _devices = [];
  final int paddingSpaces = 30;
  final String feedingTime = "Feeding Time: ";
  final String deviceId = "Device Id: ";
  final String isScheduled = "Is Scheduled: ";

  // Members4
  FeedModel _feed;

  @override
  void initState() {

    final busyIndicatorProvider =
        Provider.of<BusyIndicator>(context, listen: false);

    final machinesProvider =
        Provider.of<MachineListModel>(context, listen: false);

    _feed = FeedModel.fromDevice("000");

    busyIndicatorProvider.setIsBusy(true);    
    machinesProvider.reloadAllFromServer().then((_) {
      busyIndicatorProvider.setIsBusy(false);
      _devices.addAll(machinesProvider.machines);

      if (_devices.length != 0)
        _feed = FeedModel.fromDevice(_devices.first.id);

      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BusyIndicator>(
      builder: (BuildContext context, BusyIndicator value, Widget child) {
        return value.isBusy
            ? CircularProgressIndicator()
            : Container(
                margin: EdgeInsets.all(25.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      AlignedForField(
                        fieldName: feedingTime
                            .padRight(paddingSpaces - feedingTime.length),
                        fieldWidget: BasicDateTimeField(
                          width: MediaQuery.of(context).size.width * 0.5,
                          onDateTimeChanged: _setSelectedDateTime,
                          defaultValue: _feed.feedingTime,
                        ),
                      ),
                      AlignedForField(
                        fieldName:
                            deviceId.padRight(paddingSpaces - deviceId.length),
                        fieldWidget: DropdownButton(
                          value: _feed.deviceId,
                          items: _getAvailableDevices(),
                          onChanged: _setSelectedDevice,
                        ),
                      ),
                      AlignedForField(
                        fieldName: isScheduled
                            .padRight(paddingSpaces - isScheduled.length),
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
      },
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

  Future _saveFeed() async {
    // Getting the needed providers
    final feedsProvider = Provider.of<FeedListModel>(context, listen: false);
    final busyIndicatorProvider =
        Provider.of<BusyIndicator>(context, listen: false);

    //Show busy indicator
    busyIndicatorProvider.setIsBusy(true);

    // Adding the feed
    await feedsProvider.add(_feed, context);

    //Stopping busy indicator
    busyIndicatorProvider.setIsBusy(false);
  }
}
