import 'package:flutter/material.dart';
import 'package:flutter_social_app/widgets/header.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isContent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.background.withOpacity(1.0),
      appBar: searchAppBar(context),
      body: isContent ? buildContent() : buildNoContent(),
    );
  }

  AppBar searchAppBar(BuildContext context) {
    return AppBar(
      title: TextFormField(
        decoration: InputDecoration(
          hintText: "Search for a user ..",
          filled: true,
          fillColor: Theme.of(context).colorScheme.primaryVariant,
          prefixIcon: Icon(
            Icons.account_box,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.clear,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () => print("Pressed"),
          ),
        ),
      ),
    );
  }

  buildNoContent() {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: SvgPicture.asset('assets/images/no_content_screen.svg'),
          ),
          Center(
            child: Text(
              "Search for users",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }

  buildContent() {}
}

class UserResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("User Result");
  }
}
