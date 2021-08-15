import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/core/services/statefulWrapper.dart';
import 'package:asthma_management/views/actionPlan/actionPlan.dart';
import 'package:asthma_management/views/bottombar/bottombar.dart';
import 'package:asthma_management/views/firstAid/firstaid.dart';
import 'package:asthma_management/views/homepage/homePageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'emergencyContacts.dart';

class EmergencyPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomePageViewModel>(context);

    return StatefulWrapper(
      onInit: () {
        viewModel.getName();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: McGyver.rsDoubleH(context, 5),
                ),
                IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () => Get.off(MyHomePage())),
                Text(
                  'Hi ${viewModel.name}',
                  style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.5),
                      fontWeight: FontWeight.w800,
                      color: Color.fromRGBO(19, 10, 56, 0.9)),
                ),
                Text(
                  "What's the Emergency?",
                  style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 3.5),
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(19, 10, 56, 0.9)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: McGyver.rsDoubleW(context, 55)),
                  child: Divider(
                    color: Color(0xffde3025),
                    thickness: 1,
                  ),
                ),
                Text(
                  "You can get help for any emergency you're facing",
                  style: GoogleFonts.dmSans(
                    fontSize: McGyver.textSize(context, 2.2),
                    fontWeight: FontWeight.bold,
                    color: Color(0xff30159c),
                  ),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 5),
                ),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      onTap: () => Get.to(
                        EmergencyContacts(),
                      ),
                      leading: SvgPicture.asset('assets/images/call.svg'),
                      title: Text(
                        'Emergency Contact',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.9),
                          fontWeight: FontWeight.bold,
                          color: Color(0xffde3025),
                        ),
                      ),
                      subtitle: Text(
                        'Request for help from your contact',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2),
                          fontWeight: FontWeight.normal,
                          color: Color(0xff130138),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 3),
                ),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      onTap: () => Get.to(
                        ActionPlan(),
                      ),
                      leading: Image.asset('assets/images/plans.png'),
                      title: Text(
                        'Action Plan',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.9),
                          fontWeight: FontWeight.bold,
                          color: Color(0xffde3025),
                        ),
                      ),
                      subtitle: Text(
                        'What to do in an emergency',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2),
                          fontWeight: FontWeight.normal,
                          color: Color(0xff130138),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 3),
                ),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      onTap: () => Get.to(FirstAid()),
                      leading: SvgPicture.asset('assets/images/aid.svg'),
                      title: Text(
                        'Emergency First Aid',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.9),
                          fontWeight: FontWeight.bold,
                          color: Color(0xffde3025),
                        ),
                      ),
                      subtitle: Text(
                        'Immediate care you should provide to yourself',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2),
                          fontWeight: FontWeight.normal,
                          color: Color(0xff130138),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
