import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_social_app/widgets/header.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String? username;
  @override
  Widget build(BuildContext parentContext) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBarHeader(context, header: "Setup Your Profile", actions: []),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "Create Username",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                validator: (val) {
                  if (val!.trim().length < 3) {
                    return 'User name less than 3 letters !';
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) => username = newValue,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    labelStyle: TextStyle(fontSize: 15),
                    hintText: "Must be at least 3 characters"),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => submit(),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(7)),
              child: Text(
                "Submit",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  submit() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      SnackBar snackBar = SnackBar(
        content: Text('Wellcome $username !'),
      );
      _scaffoldKey.currentState!.showSnackBar(snackBar);
      Timer(Duration(seconds: 3), () {
        Navigator.of(context).pop(username);
      });
    }
  }
}
