import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  bool isSignInButtonPressed = false;
  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account);
    }, onError: (err) => handleSignInError(err));
    googleSignIn
        .signInSilently(suppressErrors: false)
        .then((account) => handleSignIn(account))
        .catchError((err) => handleSignInError(err));
  }

  void handleSignInError(err) {
    print('Error : $err');
  }

  void handleSignIn(GoogleSignInAccount? account) {
    if (account != null) {
      print('user signed in : $account');
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthRoute() : buildUnAuthRoute();
  }

  Widget buildAuthRoute() {
    return ElevatedButton(child: const Text('Logout'), onPressed: logout);
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
                  login();
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

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }
}
