import 'package:asthma_management/core/routes/route_names.dart';
import 'package:asthma_management/views/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Future<void> _onIntroEnd(context) async {

    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('name');
    final check = prefs.getBool('profile') ?? false;

    if (id != null) {
      if (check == true) {
        Navigator.pushReplacementNamed(context, RouteNames.bottomBar);
      } else {
        Navigator.pushReplacementNamed(context, RouteNames.profile1);
      }
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Welcome()));
    }
  }

  Widget _buildFullscrenImage() {
    return Image.asset(
      'assets/images/onboarding1.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,

      pages: [
        PageViewModel(
          title: "Notification reminders",
          body:
              "Instead of having to manually remind yourself to take drugs or eat or play, set a reminder on AsthmaMgt",
          image: _buildImage('images/onboarding2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Don't know what to do when having an Asthma attack?",
          body:
              "AsthmaMgt provides you with the tools to measure the level of which your asthma is at and also recommend appropriate action plans.",
          image: _buildFullscrenImage(),
        ),
        PageViewModel(
          title: "Your data is secured",
          body:
              "No need to worry of data leaks as whatever data put on the phone, stays on the phone.",
          image: _buildImage('images/onboarding3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Resuce and controller medications",
          body:
              "Make a list of your resuce and controller medications  for reducing the Asthma burden",
          image: _buildImage('images/onboarding4.png'),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,

      skip: const Text('Skip'),

      done: const Text('Get Started',
          style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,

      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
