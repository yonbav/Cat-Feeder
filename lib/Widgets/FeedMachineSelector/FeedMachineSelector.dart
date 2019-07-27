import 'package:cat_feeder/Data/Machine/Machine.dart';
import 'package:flutter/material.dart';

class FeedMachineSelector extends StatelessWidget {
  // members
  final Machine machine;
  final Function changeSelected;

  // constructor
  const FeedMachineSelector({Key key, this.machine, this.changeSelected})
      : super(key: key);

  // build
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: EdgeInsets.all(5.0),
      color: machine.isSelected ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColorLight,
      child: RaisedButton(
          child: Column(
            children: <Widget>[
              machine.isSelected
                  ? Image.asset("assets/images/machine_selected.jpeg")
                  : Image.asset("assets/images/machine_not_selected.jpeg"),
              Text(machine.id),
            ],
          ),
          onPressed: () {
            changeSelected(machine);
          }),
    );
  }
}
