import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musopathy/models/data.dart';
import 'package:musopathy/screens/introPage2.dart';

import 'package:musopathy/screens/splashScreen.dart';

import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _currentuser;
  final _auth = FirebaseAuth.instance;

  var user;

  @override
  void initState() {
    super.initState();
    _currentuser = _auth.currentUser;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_currentuser == null) {
        Provider.of<Data>(context, listen: false).logout();
      } else {
        Provider.of<Data>(context, listen: false).verify();

        Provider.of<Data>(context, listen: false).login();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    if (_currentuser == null) {
      return SplashScreen();
    } else {
      return WebViewExample();
    }
  }
}
