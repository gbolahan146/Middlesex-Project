import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/actionPlan/actionPlan.dart';
import 'package:asthma_management/views/diary/diary.dart';
import 'package:asthma_management/views/homepage/homepage.dart';
import 'package:asthma_management/views/medication_screen/medication_screen.dart';
import 'package:asthma_management/views/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void _onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void _bottomTapped(int page) {
    _pageController.jumpToPage(page);
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                )),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Do you want to exit this App',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    )),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No',
                    style: GoogleFonts.mali(
                      fontSize: 16,
                    )),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes',
                    style: GoogleFonts.mali(
                      fontSize: 16,
                    )),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: <Widget>[
            HomeScreen(),
            ActionPlan(),
            MedicationScreen(),
            DiaryScreen(),
            Profile()
            // LineChartSample2()
          ],
        ),
        bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: CupertinoTabBar(
              onTap: _bottomTapped,
              currentIndex: _page,
              backgroundColor: Colors.white,
              items: <BottomNavigationBarItem>[
                _bottomNavigationBarItem(
                  "Home",
                  0,
                  Image.asset(
                    'assets/images/home.png',
                    height: McGyver.rsDoubleH(context, 4),
                    width: McGyver.rsDoubleW(context, 6),
                  ),
                  Image.asset(
                    'assets/images/Vector.png',
                    height: McGyver.rsDoubleH(context, 4),
                    width: McGyver.rsDoubleW(context, 6),
                  ),
                ),
                _bottomNavigationBarItem(
                    "Action plan",
                    1,
                    Image.asset(
                      'assets/images/plans.png',
                      height: McGyver.rsDoubleH(context, 4),
                      width: McGyver.rsDoubleW(context, 6),
                    ),
                    Icon(
                      Icons.note_add,
                      color: Color(0xff130A38),
                    )),
                _bottomNavigationBarItem(
                  "Medication",
                  2,
                  Container(
                    child: SvgPicture.asset(
                      'assets/images/Group 3655.svg', /*color: Colors.black45, colorBlendMode: BlendMode.srcOut,*/
                    ),
                  ),
                  Image.asset(
                    'assets/images/pills.png',
                    height: McGyver.rsDoubleH(context, 4),
                    width: McGyver.rsDoubleW(context, 6),
                  ),
                ),
                _bottomNavigationBarItem(
                  "Diary",
                  3,
                  Image.asset(
                    'assets/images/Vector (2).png',
                    height: McGyver.rsDoubleH(context, 4),
                    width: McGyver.rsDoubleW(context, 6),
                  ),
                  SvgPicture.asset(
                    'assets/images/printer2.svg',
                    height: McGyver.rsDoubleH(context, 4),
                    width: McGyver.rsDoubleW(context, 7),
                  ),
                ),
                _bottomNavigationBarItem(
                  "Profile",
                  3,
                  Image.asset(
                    'assets/images/user.png',
                    height: McGyver.rsDoubleH(context, 4),
                    width: McGyver.rsDoubleW(context, 6),
                  ),
                  Icon(
                    Icons.account_circle,
                    color: Color(0xff130A38),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String label, int number, Widget icon, Widget activeIcon) {
    return BottomNavigationBarItem(
      activeIcon: activeIcon,
      //  backgroundColor: Colors.red,
      icon: icon,
      title: Text(label,
          style: GoogleFonts.dmSans(
            fontSize: McGyver.textSize(context, 1.3),
            fontWeight: FontWeight.w500,
            color: Colors.black,
          )),
    );
  }
}
