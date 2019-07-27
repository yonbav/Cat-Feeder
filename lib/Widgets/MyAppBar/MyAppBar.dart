import 'package:flutter/material.dart';
import '../../Globals.dart';
import '../../Utils/EnumsUtil.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  // members
  final String title;

  // properties
  @override
  final Size preferredSize = Size.fromHeight(56.0);

  // constructor
  MyAppBar({Key key, this.title}) : super(key: key);

  // CreateState
  @override
  _MyAppBarState createState() => new _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  // members
  static eChoices _selectedChoice = eChoices.Home;

  @override
  void initState() {
    super.initState();
  }

  // build
  @override
  Widget build(BuildContext context) {
    return new AppBar(title: new Text(widget.title), actions: <Widget>[
      PopupMenuButton<eChoices>(
          onSelected: _choiceAction, itemBuilder: buildDropdownItems)
    ]);
  }

  List<PopupMenuItem<eChoices>> buildDropdownItems(BuildContext context) {
    return eChoices.values
        .where((choice) => choice != _selectedChoice)
        .map((eChoices choice) {
      return PopupMenuItem<eChoices>(
        value: choice,
        child: new Text(EnumsUtil.convertChoiceToStirng(choice)),
      );
    }).toList();
  }

  // Private Methods
  void _choiceAction(eChoices choice) {
    setState(() {
      _selectedChoice = choice;
    });

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
