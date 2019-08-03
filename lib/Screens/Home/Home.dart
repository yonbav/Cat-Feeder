import 'package:cat_feeder/Data/BusyIndicator/BusyIndicator.dart';
import 'package:cat_feeder/Data/MachineListModel/MachineListModel.dart';
import 'package:cat_feeder/Globals.dart';
import 'package:provider/provider.dart';
import './Widgets/FeedMachinesManager/index.dart';
import 'package:cat_feeder/Widgets/MyAppBar/index.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final busyIndicatorProvider =
        Provider.of<BusyIndicator>(context, listen: false);
    final machinesProvider =
        Provider.of<MachineListModel>(context, listen: false);

    busyIndicatorProvider.setIsBusy(true);
    machinesProvider.reloadAllFromServer()
        .then((_) => busyIndicatorProvider.setIsBusy(false));

    return Scaffold(
      appBar: MyAppBar(
        title: "Home",
        selectedChoice: eChoices.Home,
      ),
      body: FeedMachineManager(),
    );
  }
}
