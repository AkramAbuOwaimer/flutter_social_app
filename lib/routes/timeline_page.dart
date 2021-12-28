import 'package:flutter/material.dart';
import 'package:flutter_social_app/widgets/header.dart';
import 'package:flutter_social_app/widgets/progress.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: appBarHeader(context, isTitle: true),
      body: circularProgress(context),
    );
  }
}
