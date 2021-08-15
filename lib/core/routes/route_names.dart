import 'package:asthma_management/views/add_ctrl_med/add_ctrl.dart';
import 'package:asthma_management/views/add_rescue_med/add_rescue.dart';
import 'package:asthma_management/views/addpeakflow/addPeak.dart';
import 'package:asthma_management/views/bottombar/bottombar.dart';
import 'package:asthma_management/views/diary/diary.dart';
import 'package:asthma_management/views/diary/diarylog.dart';
import 'package:asthma_management/views/home/homeView.dart';
import 'package:asthma_management/views/login/login_view.dart';
import 'package:asthma_management/views/peakflow/peakflow.dart';
import 'package:asthma_management/views/profile1/profile1.dart';
import 'package:asthma_management/views/homepage/homepage.dart';
import 'package:asthma_management/views/profile2/profile2View.dart';
import 'package:asthma_management/views/reminders/remiders.dart';
import 'package:asthma_management/views/signup/signupView.dart';
import 'package:asthma_management/views/medication_screen/medication_screen.dart';
import 'package:asthma_management/views/splash_screen/splash_screen.dart';
import 'package:asthma_management/views/welcome/welcome.dart';
import 'package:flutter/material.dart';

class RouteNames {
  ///Route names used through out the app will be specified as static constants here in this format
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String splashScreen = '/';
  static const String medicationScreen = '/medicationScreen';
  static const String profile1 = '/profile1';
  static const String profile2 = '/profile2';
  static const String bottomBar = '/bottomBar';
  static const String homepage = '/homepage';
  static const String add_rescue = '/add_rescue';
  static const String add_ctrl = '/add_ctrl';
  static const String diary = '/diary';
  static const String diarylog = '/diarylog';
  static const String welcomeScreen = '/welcome';
  
  static const String reminder = '/reminder';
  static const String peakflow = '/peakflow';
  static const String addpeak = '/addpeak';
  static const String test = '/test';

  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    RouteNames.home: (context) => Home(),
    RouteNames.login: (context) => LoginView(),
    RouteNames.signup: (context) => SignUp(),
    RouteNames.splashScreen: (context) => SplashScreen(),
    RouteNames.medicationScreen: (context) => MedicationScreen(),
    RouteNames.profile1: (context) => ProfilePage1(),
    RouteNames.profile2: (context) => Profile2(),
    RouteNames.bottomBar: (context) => MyHomePage(),
    RouteNames.homepage: (context) => HomeScreen(),
    RouteNames.add_rescue: (context) => AddRescueScreen(),
    RouteNames.add_ctrl: (context) => AddCtrlScreen(),
    RouteNames.diary: (context) => DiaryScreen(),
    RouteNames.diarylog: (context) => DiaryLogScreen(),
    RouteNames.welcomeScreen: (context) => Welcome(),
    RouteNames.reminder: (context) => Reminders(),
    RouteNames.peakflow: (context) => PeakFlow(),
    RouteNames.addpeak: (context) => AddPeakFlow(),

  };
}
