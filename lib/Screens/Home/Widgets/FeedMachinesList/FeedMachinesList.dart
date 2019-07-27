import 'package:cat_feeder/Data/Machine/Machine.dart';
import '../FeedMachineSelector/index.dart';
import 'package:flutter/material.dart';

class FeedMachineList extends StatelessWidget {
  final List<Machine> machines;
  final Function changeSelected;

  const FeedMachineList({Key key, this.machines, this.changeSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        children: machines
            .map((element) => Card(
                child: new FeedMachineSelector(
                    machine: element, changeSelected: changeSelected)))
            .toList(),
      ),
    );
  }
}
