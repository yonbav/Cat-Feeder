import 'package:cat_feeder/Data/Machine/Machine.dart';
import 'package:cat_feeder/Widgets/FeedMachineSelector/index.dart';
import 'package:flutter/material.dart';

class FeedMachineList extends StatelessWidget {
  final List<Machine> machines;
  final Function changeSelected;

  const FeedMachineList({Key key, this.machines, this.changeSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: machines
            .map((element) => Card(
                child: new FeedMachineSelector(
                    machine: element, changeSelected: changeSelected)))
            .toList(),
      ),
    );
  }
}
