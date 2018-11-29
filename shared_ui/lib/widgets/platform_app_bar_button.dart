import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'platform_builder.dart';

class PlatformAppBarIconButton extends StatelessWidget with PlatformBuilder {
  final Function onPressed;
  final IconData iconData;

  PlatformAppBarIconButton({Key key, this.onPressed, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildForPlatform(context);
  }

  @override
  Widget buildAndroid(BuildContext context) {
    return IconButton(
      icon: Icon(iconData),
      onPressed: onPressed,
    );
  }

  @override
  Widget buildIOS(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Icon(iconData),
    );
  }
}
