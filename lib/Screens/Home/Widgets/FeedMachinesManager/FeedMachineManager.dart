import 'package:cat_feeder/Data/Feed/Feed.dart';
import 'package:cat_feeder/Data/Machine/Machine.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../../../Globals.dart';
import '../FeedMachinesList/index.dart';
import 'package:flutter/material.dart';

class FeedMachineManager extends StatefulWidget {
  FeedMachineManager({Key key}) : super(key: key);

  _FeedMachineManagerState createState() => _FeedMachineManagerState();
}

class _FeedMachineManagerState extends State<FeedMachineManager> {
  // Members
  List<Machine> _machines = machinesFromServer;

  // build
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Flexible(
        flex: 10,
        child: FeedMachineList(
          machines: _machines,
          changeSelected: _changeMachineSelected,
        ),
      ),
      Flexible(
        flex: 2,
        child: Container(
          margin: EdgeInsets.only(top: 15.0),
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColorLight,
            child: Text("Feed Now"),
            onPressed: _setFeedingForSelectedDevices,
          ),
        ),
      ),
    ]));
  }

  // private methods
  void _changeMachineSelected(Machine machine) {
    setState(() {
      var selectedMachine =
          _machines.firstWhere((element) => element.id == machine.id);
      selectedMachine.isSelected = !selectedMachine.isSelected;
    });
  }

  void _setFeedingForSelectedDevices() {
    // Getting the devices that are selected
    var devicesToCreateFeed = _machines.where((element) => element.isSelected);

    // Converting each device into a feed
    var feedsToSave = devicesToCreateFeed.map((element) => new Feed.fromDevice(element.id));

    var alertMessage = "Feeding now devices: " + feedsToSave.map((element) => element.deviceId).join(", ");

    // Printing the feed
    Alert(context: context, title: "Feed Now", desc: alertMessage).show();
  }
}
