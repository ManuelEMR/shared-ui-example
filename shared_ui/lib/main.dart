import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return _buildApp();
  }

  Widget _buildApp() {
    return Platform.isAndroid ? _buildAndroidApp() : _buildIOSApp();
  }

  Widget _buildAndroidApp() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MainScreen(),
      localizationsDelegates: localizations,
    );
  }

  Widget _buildIOSApp() {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: MainScreen(),
      localizationsDelegates: localizations,
    );
  }

  final localizations = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ];
}
