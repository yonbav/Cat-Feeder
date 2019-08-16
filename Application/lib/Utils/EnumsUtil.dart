import 'package:cat_feeder/Globals.dart';

class EnumsUtil
{
  static String convertChoiceToStirng(eChoices choice) {
    switch(choice)
    {
      case eChoices.Home:
        return "Home";
      case eChoices.AddFeed:
        return "Add Feed";
      case eChoices.ManageFeed:
        return "Manage Feed";
    }

    return "unknown";
  }  
}