import 'package:flutter/material.dart';

Container circularProgress(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      valueColor:
          AlwaysStoppedAnimation(Theme.of(context).colorScheme.secondary),
    ),
  );
}

Container linearProgress(BuildContext context) {
  return Container(
    alignment: Alignment.topCenter,
    child: LinearProgressIndicator(
      valueColor:
          AlwaysStoppedAnimation(Theme.of(context).colorScheme.secondary),
    ),
  );
  ;
}
