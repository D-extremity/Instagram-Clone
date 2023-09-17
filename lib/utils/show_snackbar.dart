import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

showSnackbar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
