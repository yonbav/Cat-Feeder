import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Data/BusyIndicator/BusyIndicator.dart';
import 'Data/FeedListModel/FeedListModel.dart';
import 'Data/MachineListModel/MachineListModel.dart';
import 'Screens/ManageFeeds/index.dart';
import 'Screens/Home/index.dart';
import 'Screens/AddFeed/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(builder: (context) => MachineListModel()),
            ChangeNotifierProvider(builder: (context) => FeedListModel()),
            ChangeNotifierProvider(builder: (context) => BusyIndicator()),
          ],
          child: Home(),
        ),
    '/ManageFeeds': (BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(builder: (context) => FeedListModel()),
            ChangeNotifierProvider(builder: (context) => BusyIndicator()),
          ],
          child: ManageFeeds(),
    ),
    '/AddFeed': (BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(builder: (context) => FeedListModel()),
            ChangeNotifierProvider(builder: (context) => MachineListModel()),
            ChangeNotifierProvider(builder: (context) => BusyIndicator()),
          ],
          child: AddFeed(),
    ),
  };

  Routes() {
    runApp(new MaterialApp(
      title: 'Cat Feeder',
      routes: routes,
    ));
  }
}
