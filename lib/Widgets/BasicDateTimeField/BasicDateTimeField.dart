import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import '../../Globals.dart';

class BasicDateTimeField extends StatelessWidget {
  // Final Members
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final Function onDateTimeChanged;
  final DateTime defaultValue;

  // Constructor
  BasicDateTimeField({Key key, this.onDateTimeChanged, this.defaultValue}) : super(key: key);

  // build
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        DateTimeField(
          initialValue: defaultValue,
          format: format,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontFamily: appFontFamily),
          textAlign: TextAlign.center,
          readOnly: true,
          onChanged: (value) {onDateTimeChanged(value);},
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          },
        ),
      ]),
    );
  }
}
