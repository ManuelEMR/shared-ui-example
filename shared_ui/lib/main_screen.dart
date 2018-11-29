import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_ui/widgets/platform_app_bar_button.dart';
import 'package:shared_ui/widgets/platform_builder.dart';

class MainScreen extends StatelessWidget with PlatformBuilder {
  @override
  Widget build(BuildContext context) {
    return buildForPlatform(context);
  }

  Widget _buildBody() {
    return ListView.builder(
      itemBuilder: (context, index) => Tile(text: '$index'),
    );
  }

  void _goToSearch(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (date) => print('date $date'),
          );
        });
  }

  Widget dateAppBarButton(BuildContext context) {
    return PlatformAppBarIconButton(
      iconData: Icons.calendar_today,
      onPressed: () => _goToSearch(context),
    );
  }

  // Android
  @override
  Widget buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          dateAppBarButton(context),
        ],
      ),
      body: _buildBody(),
    );
  }

  // IOS
  @override
  Widget buildIOS(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
        trailing: dateAppBarButton(context),
      ),
      child: _buildBody(),
    );
  }
}

class Tile extends StatelessWidget {
  final String text;

  Tile({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(text),
    );
  }
}
