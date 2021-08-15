import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/emergency/emergencyPopUp.dart';
import 'package:asthma_management/views/firstAid/firstAidModel.dart';
import 'package:asthma_management/widgets/firstaid/emergency.dart';
import 'package:asthma_management/widgets/firstaid/first.dart';
import 'package:asthma_management/widgets/firstaid/fourth.dart';
import 'package:asthma_management/widgets/firstaid/second.dart';
import 'package:asthma_management/widgets/firstaid/third.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FirstAid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FirstAidViewModel>(context);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffe5e5e5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.off(
            EmergencyPopUp(),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Asthma first aid',
          style: GoogleFonts.dmSans(
              fontSize: McGyver.textSize(context, 3.5),
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(19, 10, 56, 0.9)),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 3)),
        child: ListView(
          children: [
            MaterialButton(
              minWidth: width,
              height: McGyver.rsDoubleH(context, 8),
              color: Colors.red,
              onPressed: () => viewModel.setEmergency(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Call emergency number',
                    style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.3),
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    viewModel.emergency
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Visibility(
              visible: viewModel.emergency,
              child: EmergencyInfo(),
            ),
            SizedBox(
              height: McGyver.rsDoubleH(context, 4),
            ),
            Card(
              elevation: 3,
              child: ListTile(
                onTap: () => viewModel.setFirst(),
                leading: Text(
                  '1',
                  style: GoogleFonts.dmSans(
                    fontSize: McGyver.textSize(context, 2.3),
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                title: SvgPicture.asset('assets/images/one.svg'),
                subtitle: Column(
                  children: [
                    Text(
                      'Sit the person upright',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontSize: McGyver.textSize(context, 2.3),
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    Visibility(visible: viewModel.first, child: FirstInfo()),
                  ],
                ),
                trailing: Icon(
                  viewModel.first ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: McGyver.rsDoubleH(context, 1),
            ),
            Card(
              elevation: 3,
              child: ListTile(
                onTap: () => viewModel.setSecond(),
                leading: Text(
                  '2',
                  style: GoogleFonts.dmSans(
                    fontSize: McGyver.textSize(context, 2.3),
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                title: SvgPicture.asset('assets/images/two.svg'),
                subtitle: Column(
                  children: [
                    Text(
                      'Give 4 separate puffs of flovent reliever puffer',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontSize: McGyver.textSize(context, 2.3),
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    Visibility(
                      visible: viewModel.second,
                      child: SecondInfo(),
                    )
                  ],
                ),
                trailing: Icon(
                  viewModel.second
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: McGyver.rsDoubleH(context, 1),
            ),
            Card(
              elevation: 3,
              child: ListTile(
                onTap: () => viewModel.setThird(),
                leading: Text(
                  '3',
                  style: GoogleFonts.dmSans(
                    fontSize: McGyver.textSize(context, 2.3),
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                title: SvgPicture.asset('assets/images/three.svg'),
                subtitle: Column(
                  children: [
                    Text(
                      'Wait 4 minutes. Repeat 4 puffs once',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontSize: McGyver.textSize(context, 2.3),
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    Visibility(
                      visible: viewModel.third,
                      child: ThirdInfo(),
                    )
                  ],
                ),
                trailing: Icon(
                  viewModel.third ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: McGyver.rsDoubleH(context, 1),
            ),
            Card(
              elevation: 3,
              color: Color(0xfff3444e),
              child: Column(children: [
                ListTile(
                  onTap: () => viewModel.setFourth(),
                  leading: Text(
                    '4',
                    style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.3),
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  title: SvgPicture.asset('assets/images/four.svg'),
                  subtitle: Column(
                    children: [
                      Text(
                        'If there is still no improvement, call the emergency number',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.3),
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    viewModel.fourth
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ),
                Visibility(visible: viewModel.fourth, child: FourthInfo())
              ]),
            ),
          ],
        ),
      ),
    );
  }

 

}
