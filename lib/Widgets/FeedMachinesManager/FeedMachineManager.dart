import 'package:cat_feeder/Data/Machine/Machine.dart';
import 'package:cat_feeder/Widgets/FeedMachinesList/index.dart';
import 'package:flutter/material.dart';

class FeedMachineManager extends StatefulWidget {
  FeedMachineManager({Key key}) : super(key: key);

  _FeedMachineManagerState createState() => _FeedMachineManagerState();
}

class _FeedMachineManagerState extends State<FeedMachineManager> {
  // Members
  List<Machine> _machines = [new Machine("111")];

  // build
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FeedMachineList(
        machines: _machines,
        changeSelected: _changeMachineSelected,
      ),
    );
  }

  // private methods
  void _changeMachineSelected(Machine machine) {
    setState(() {
      var selectedMachine = 
          _machines.firstWhere((element) => element.id == machine.id);
      selectedMachine.isSelected = !selectedMachine.isSelected;

      _machines.remove(selectedMachine);
      _machines.add(selectedMachine);            
    });    
  }
}
