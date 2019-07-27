import 'package:cat_feeder/Data/Machine/Machine.dart';
import 'package:cat_feeder/Widgets/FeedMachinesList/index.dart';
import 'package:flutter/material.dart';

class FeedMachineManager extends StatefulWidget {
  FeedMachineManager({Key key}) : super(key: key);

  _FeedMachineManagerState createState() => _FeedMachineManagerState();
}

class _FeedMachineManagerState extends State<FeedMachineManager> {
  // Members
  List<Machine> _machines = [
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
    print("Feeding now");
  }
}
