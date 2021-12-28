import 'package:flutter/material.dart';
import 'package:flutter_social_app/widgets/header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHeader(context, header: 'Profile'),
    );
  }
}
