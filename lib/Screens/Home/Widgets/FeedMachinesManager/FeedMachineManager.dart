import 'package:cat_feeder/Data/BusyIndicator/BusyIndicator.dart';
import 'package:cat_feeder/Data/MachineListModel/MachineListModel.dart';
import 'package:cat_feeder/Data/FeedListModel/FeedListModel.dart';
import 'package:cat_feeder/Data/FeedModel/FeedModel.dart';
import 'package:cat_feeder/Data/MachineModel/MachineModel.dart';
import 'package:cat_feeder/Widgets/CircularLoading/index.dart';
import 'package:provider/provider.dart';
import '../FeedMachinesList/index.dart';
import 'package:flutter/material.dart';

class FeedMachineManager extends StatefulWidget {
  
  // Constructor
  FeedMachineManager({Key key}) : super(key: key);

  // Create State
  _FeedMachineManagerState createState() => _FeedMachineManagerState();
}

class _FeedMachineManagerState extends State<FeedMachineManager> {
  // Members
  List<MachineModel> _machines = [];

  // init state
  @override
  void initState() {
    final busyIndicatorProvider =
        Provider.of<BusyIndicator>(context, listen: false);
    final machinesProvider =
        Provider.of<MachineListModel>(context, listen: false);

    busyIndicatorProvider.setIsBusy(true);
    machinesProvider.reloadAllFromServer()
        .then((_) => busyIndicatorProvider.setIsBusy(false));
    super.initState();
  }

  // build
  @override
  Widget build(BuildContext context) {
    final machinesProvider = Provider.of<MachineListModel>(context);
    _machines = machinesProvider.machines;

    return  Consumer<BusyIndicator>(
        builder: (BuildContext context, BusyIndicator value, Widget child) {
          return value.isBusy
              ? CircularLoading()
              : Container(
      child: Column(
        children: <Widget>[
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
        ],
      ),
    );
        },
      );
  }

  // private methods
  void _changeMachineSelected(MachineModel machine) {
    setState(() {
      var selectedMachine =
          _machines.firstWhere((element) => element.id == machine.id);
      selectedMachine.isSelected = !selectedMachine.isSelected;
    });
  }

  Future _setFeedingForSelectedDevices() async {
    // Getting the needed providers
    final feedsProvider = Provider.of<FeedListModel>(context, listen: false);
    final busyIndicatorProvider = Provider.of<BusyIndicator>(context, listen: false);

    // Getting the devices that are selected
    var devicesToCreateFeed = _machines.where((element) => element.isSelected);

    // Converting each device into a feed
    var feedsToSave = devicesToCreateFeed
        .map((element) => new FeedModel.fromDevice(element.id));

    //Show busy indicator
    busyIndicatorProvider.setIsBusy(true);

    // Adding the feeds
    for (var i = 0; i < feedsToSave.length; i++) {
      await feedsProvider.add(feedsToSave.elementAt(i), context);
    }

    //Stopping busy indicator
    busyIndicatorProvider.setIsBusy(false);
  }
}
