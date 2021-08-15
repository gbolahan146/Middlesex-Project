import 'dart:async';

import 'package:asthma_management/core/routes/route_names.dart';
import 'package:asthma_management/views/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('name');
    final check = prefs.getBool('profile') ?? false;

    return new Timer(duration, () {
      if (id != null) {
        if (check == true) {
          Navigator.pushReplacementNamed(context, RouteNames.bottomBar);
        } else {
          Navigator.pushReplacementNamed(context, RouteNames.profile1);
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF130A38),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(30),
              child: Image.asset('assets/images/asthmgt_logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
