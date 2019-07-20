import 'package:flutter/material.dart';
import '../../Globals.dart';
import '../../Utils/EnumsUtil.dart';

class MyAppBarState extends State<MyAppBar> {

  // members
  final String _title;
  eChoices selectedChoice;


  // constructor
  MyAppBarState(String title) : _title = title;

  // build
  @override
  Widget build(BuildContext context) {
    return new AppBar(title: new Text(_title), actions: <Widget>[
      PopupMenuButton<eChoices>(
        onSelected: _choiceAction,
        itemBuilder: (BuildContext context) {
          return eChoices.values.where((choice) => choice != selectedChoice).map((eChoices choice) {
            return PopupMenuItem<eChoices>(
              value: choice,
              child: new Text(EnumsUtil.convertChoiceToStirng(choice)),
            );
          }).toList();
        },
      ),
    ]);
  }

  // Private Methods
  void _choiceAction(eChoices choice) {
    selectedChoice = choice;

    switch (choice) {
      case eChoices.Home:
        _homePressed();
        break;
      case eChoices.AddFeed:
        _addFeedPressed();
        break;
      case eChoices.ManageFeed:
        _manageFeedsPressed();
        break;
      case eChoices.ScheduleFeed:
        _scheduleFeedPressed();
        break;
    }
  }

  void _homePressed() {
    Navigator.pushNamed(context, "/");
  }

  void _manageFeedsPressed() {
    Navigator.pushNamed(context, "/ManageFeeds");
  }

  void _addFeedPressed() {
    Navigator.pushNamed(context, "/AddFeed");
  }

  void _scheduleFeedPressed() {
    Navigator.pushNamed(context, "/ScheduleFeed");
  }
}

class MyAppBar extends StatefulWidget implements PreferredSizeWidget{
  
  // members
  final String _title;

  // properties
  @override
  final Size preferredSize;

  // constructor
  MyAppBar({Key key, String title}) : preferredSize = Size.fromHeight(56.0), _title = title, super(key: key);

  // CreateState
  @override
  MyAppBarState createState() => new MyAppBarState(_title);
}
