import 'package:flutter/material.dart';
import 'package:flutter_social_app/widgets/header.dart';

class ActivityFeedPage extends StatefulWidget {
  const ActivityFeedPage({Key? key}) : super(key: key);

  @override
  _ActivityFeedPageState createState() => _ActivityFeedPageState();
}

class _ActivityFeedPageState extends State<ActivityFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHeader(context, header: 'Activity Feed'),
    );
    ;
  }
}

class ActivityFeedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Activity Feed Item');
  }
}
