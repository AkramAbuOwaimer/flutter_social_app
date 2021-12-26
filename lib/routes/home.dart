import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  bool isSignInButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthRoute() : buildUnAuthRoute();
  }

  Widget buildAuthRoute() {
    return const Text('Authentecated');
  }

  Widget buildUnAuthRoute() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Flutter Social App',
                style: TextStyle(
                  fontFamily: 'Moon Dance',
                  fontSize: 70.0,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    isSignInButtonPressed = true;
                  });
                },
                onTapUp: (details) {
                  setState(() {
                    isSignInButtonPressed = false;
                  });
                },
                onTap: () {
                  print("sign in tapped ^_^");
                },
                child: Container(
                  width: 315.0,
                  height: 75.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: isSignInButtonPressed
                          ? signInButtonPressed()
                          : signInButtonUnPressed(),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AssetImage signInButtonPressed() {
    return const AssetImage('assets/images/sign_in_with_google_pressed.jpg');
  }

  AssetImage signInButtonUnPressed() {
    return const AssetImage('assets/images/sign_in_with_google.png');
  }
}
