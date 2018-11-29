import 'dart:io';
import 'package:flutter/widgets.dart';

mixin PlatformBuilder {

  Widget buildForPlatform(BuildContext context) {
    return Platform.isAndroid ? buildAndroid(context) : buildIOS(context);
  }

  Widget buildIOS(BuildContext context);
  Widget buildAndroid(BuildContext context);
}