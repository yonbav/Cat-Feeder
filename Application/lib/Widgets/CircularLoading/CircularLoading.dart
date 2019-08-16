import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
