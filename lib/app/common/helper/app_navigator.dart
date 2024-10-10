import 'package:flutter/material.dart';

class AppNavigator {
  static void push(BuildContext context, String routeName, {dynamic args}) {
    Navigator.pushNamed(context, routeName, arguments: args);
  }

  static void pushAndRemove(BuildContext context, String routeName,
      {dynamic args}) {
    Navigator.pushNamedAndRemoveUntil(
        context, routeName, arguments: args, (Route<dynamic> _) => false);
  }

  static void pushReplacement(BuildContext context, String routeName,
      {dynamic args}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: args);
  }
}
