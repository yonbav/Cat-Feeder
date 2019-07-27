import 'package:flutter/material.dart';
import '../../Globals.dart';
import '../../Utils/EnumsUtil.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  // members
  final String title;
  final eChoices selectedChoice;

  // properties
  @override
  final Size preferredSize = Size.fromHeight(56.0);

  // constructor
  MyAppBar({Key key, this.title, this.selectedChoice}) : super(key: key);

  // build
  @override
  Widget build(BuildContext context) {
    return new AppBar(title: new Text(title), actions: <Widget>[
      PopupMenuButton<eChoices>(
        onSelected: (choice) {
          _choiceAction(choice, context);
        },
        itemBuilder: buildDropdownItems,
      )
    ]);
  }

  List<PopupMenuItem<eChoices>> buildDropdownItems(BuildContext context) {
    return eChoices.values
        .where((choice) => choice != selectedChoice)
        .map((eChoices choice) {
      return PopupMenuItem<eChoices>(
        value: choice,
        child: new Text(EnumsUtil.convertChoiceToStirng(choice)),
      );
    }).toList();
  }

  // Private Methods
  
  void _choiceAction(eChoices choice, BuildContext context) {
    switch (choice) {
      case eChoices.Home:
        _homePressed(context);
        break;
      case eChoices.AddFeed:
        _addFeedPressed(context);
        break;
      case eChoices.ManageFeed:
        _manageFeedsPressed(context);
        break;
      case eChoices.ScheduleFeed:
        _scheduleFeedPressed(context);
        break;
    }
  }

  void _homePressed(BuildContext context) {
    Navigator.pushNamed(context, "/");
  }

  void _manageFeedsPressed(BuildContext context) {
    Navigator.pushNamed(context, "/ManageFeeds");
  }

  void _addFeedPressed(BuildContext context) {
    Navigator.pushNamed(context, "/AddFeed");
  }

  void _scheduleFeedPressed(BuildContext context) {
    Navigator.pushNamed(context, "/ScheduleFeed");
  }
}
