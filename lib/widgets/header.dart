import 'package:flutter/material.dart';

AppBar appBarHeader(BuildContext context,
    {String header = 'AppBar', bool isTitle = false, List<Widget>? actions}) {
  if (actions == null) {
    actions = [];
  }
  return AppBar(
    title: Text(
      isTitle ? 'Flutter Social App' : header,
      style: isTitle
          ? TextStyle(
              fontFamily: 'Inspiration',
              fontWeight: FontWeight.bold,
              fontSize: 50)
          : TextStyle(),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).colorScheme.primary,
    actions: actions,
  );
}
