import 'package:flutter/material.dart';

class AppNavigator {
  static void push(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static void pushAndRemove(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(
        context, routeName, (Route<dynamic> _) => false);
  }

  static void pushReplacement(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
}
