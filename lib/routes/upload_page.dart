import 'package:flutter/material.dart';
import 'package:flutter_social_app/widgets/header.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHeader(context, header: 'Upload'),
    );
  }
}
