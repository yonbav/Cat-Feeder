
import 'package:flutter/material.dart';
import 'Screens/ManageFeeds/index.dart';
import 'Screens/Home/index.dart';
import 'Screens/AddFeed/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => new Home(),
    '/ManageFeeds': (BuildContext context) => new ManageFeeds(),
    '/AddFeed': (BuildContext context) => new AddFeed(),
  };

  Routes () {
    runApp(new MaterialApp(      
      title: 'Cat Feeder',
      routes: routes,
    ));
  }
}