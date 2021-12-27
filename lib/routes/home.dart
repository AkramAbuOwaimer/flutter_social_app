import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_app/routes/activity_feed_page.dart';
import 'package:flutter_social_app/routes/profile_page.dart';
import 'package:flutter_social_app/routes/search_page.dart';
import 'package:flutter_social_app/routes/timeline_page.dart';
import 'package:flutter_social_app/routes/upload_page.dart';
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
  late PageController pageController = PageController(initialPage: 2);
  int pageIndex = 2;

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
    return Scaffold(
      body: PageView(
        children: [
          ProfilePage(),
          SearchPage(),
          TimelinePage(),
          ActivityFeedPage(),
          UploadPage()
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: Theme.of(context).colorScheme.primary,
        activeColor: Theme.of(context).colorScheme.primaryVariant,
        initialActiveIndex: 2,
        items: [
          TabItem(
              icon: Icon(
                Icons.account_circle,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              title: 'Profile'),
          TabItem(
              icon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              title: 'Search'),
          TabItem(
              icon: Icon(
                Icons.whatshot,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              title: 'Timeline'),
          TabItem(
              icon: Icon(
                Icons.notifications_active,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              title: 'Feed'),
          TabItem(
              icon: Icon(
                Icons.photo_camera,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              title: 'Upload')
        ],
        onTap: tabBarOnTap,
      ),
    );
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

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  AssetImage signInButtonPressed() {
    return const AssetImage('assets/images/sign_in_with_google_pressed.jpg');
  }

  AssetImage signInButtonUnPressed() {
    return const AssetImage('assets/images/sign_in_with_google.png');
  }

  onPageChanged(int pageIndex) {
    this.pageIndex = pageIndex;
  }

  tabBarOnTap(int index) {
    pageController.jumpToPage(index);
  }

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }
}
