import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<TimeOfDay> showPlatformTimerPicker(BuildContext context) {

  return Platform.isAndroid ? showTimePicker(context: context, initialTime: TimeOfDay.now()) : 
}

Future<TimeOfDay> showCupertinoTimerPicker(BuildContext context) {
  return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (date) => print('date $date'),
          );
        });
}

