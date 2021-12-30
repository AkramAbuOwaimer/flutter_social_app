import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_app/widgets/header.dart';
import 'package:flutter_social_app/widgets/progress.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  final usersRef = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: appBarHeader(context, isTitle: true),
      body: StreamBuilder(
        stream: usersRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return circularProgress(context);
          }
          final List<Text> children = snapshot.data!.docs.map((doc) {
            return Text(doc['username']);
          }).toList();
          return ListView(
            children: children,
          );
        },
      ),
    );
  }
}
