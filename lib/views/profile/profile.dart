import 'dart:io';
import 'package:asthma_management/core/services/db.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/signup/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asthma_management/core/services/statefulWrapper.dart';
import 'package:provider/provider.dart';
import 'package:asthma_management/views/homepage/homePageViewModel.dart';

import 'editProfile.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomePageViewModel>(context);
    return StatefulWrapper(
      onInit: () {
        viewModel.getName();
        viewModel.getImage();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'My Profile',
            style: GoogleFonts.dmSans(
              fontSize: McGyver.textSize(context, 2.9),
              color: Color(0xff130a38),
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            RaisedButton(
              elevation: 0,
              onPressed: () => Get.to(EditProfile()),
              color: Colors.white,
              child: Text(
                'Edit profile',
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2),
                  color: Color(0xff30159c),
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        ),
        body: FutureBuilder<List>(
            future: DB().getUser(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.done
                  ? snapshot.hasData
                      ? ListView.builder(itemBuilder: (context, index) {
                          var data = snapshot.data;
                          return Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView(
                              children: [
                                Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: McGyver.rsDoubleW(context, 28),
                                        height: McGyver.rsDoubleH(context, 16),
                                        child: Center(
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Container(
                                                width: McGyver.rsDoubleW(
                                                    context, 28),
                                                height: McGyver.rsDoubleH(
                                                    context, 16),
                                                decoration: BoxDecoration(
                                                    // color: Colors.black,

                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/Group 18.png'))),
                                              ),
                                              // Align(
                                              //   alignment: Alignment.center,
                                              //   child: Image.asset(
                                              //     'assets/images/Group 18.png',
                                              //     fit: BoxFit.fitWidth,
                                              //     color: Colors.black,
                                              //     width: McGyver.rsDoubleW(context, 35),
                                              //     height: McGyver.rsDoubleH(context, 20),

                                              //   ),
                                              // ),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    width: McGyver.rsDoubleW(
                                                        context, 19),
                                                    height: McGyver.rsDoubleH(
                                                        context, 8),
                                                    decoration: data[0]
                                                                ['image'] ==
                                                            null
                                                        ? BoxDecoration(
                                                            image: DecorationImage(
                                                                image: FileImage(
                                                                    File(viewModel
                                                                        .image))
                                                                        ),
                                                          )
                                                        : BoxDecoration(
                                                            image: DecorationImage(
                                                                image: FileImage(
                                                                    File(data[0]
                                                                        [
                                                                        'image']))),
                                                            shape: BoxShape
                                                                .circle),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              McGyver.rsDoubleW(context, 5)),
                                      Text(
                                        viewModel.name,
                                        style: GoogleFonts.dmSans(
                                          fontSize:
                                              McGyver.textSize(context, 2.3),
                                          color: Color(0xff6d6d6d),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              McGyver.rsDoubleW(context, 5)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Current Age:',
                                                style: GoogleFonts.dmSans(
                                                  fontSize: McGyver.textSize(
                                                      context, 2),
                                                  color: Color(0xff6d6d6d),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                data[0]['age'],
                                                style: GoogleFonts.dmSans(
                                                  fontSize: McGyver.textSize(
                                                      context, 2),
                                                  color: Color(0xff6d6d6d),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                              width: McGyver.rsDoubleW(
                                                  context, 9)),
                                          Column(
                                            children: [
                                              Text(
                                                'Peak Flow:',
                                                style: GoogleFonts.dmSans(
                                                  fontSize: McGyver.textSize(
                                                      context, 2),
                                                  color: Color(0xff6d6d6d),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '${data[0]['peakflow']} L/min',
                                                style: GoogleFonts.dmSans(
                                                  fontSize: McGyver.textSize(
                                                      context, 2),
                                                  color: Color(0xff6d6d6d),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              McGyver.rsDoubleW(context, 5)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: McGyver.rsDoubleW(context, 5)),
                                Card(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            McGyver.rsDoubleW(context, 4)),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height:
                                                McGyver.rsDoubleW(context, 5)),
                                        Row(
                                          children: [
                                            Text(
                                              'First Diagnosis of Asthma',
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 2.2),
                                                color: Color(0xff1b1b1b),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              data[0]['ageDiagnosed'],
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 2.2),
                                                color: Color(0xff6d6d6d),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                McGyver.rsDoubleW(context, 5)),
                                        Row(
                                          children: [
                                            Text(
                                              'Trigger Factors',
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 2.2),
                                                color: Color(0xff1b1b1b),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Text(
                                                data[0]['triggers'],
                                                style: GoogleFonts.dmSans(
                                                  fontSize: McGyver.textSize(
                                                      context, 2.2),
                                                  color: Color(0xff6d6d6d),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                McGyver.rsDoubleW(context, 5)),
                                        Row(
                                          children: [
                                            Text(
                                              'Symptoms',
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 2.2),
                                                color: Color(0xff1b1b1b),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Text(
                                                data[0]['symptoms'],
                                                style: GoogleFonts.dmSans(
                                                  fontSize: McGyver.textSize(
                                                      context, 2.2),
                                                  color: Color(0xff6d6d6d),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                McGyver.rsDoubleW(context, 5)),
                                        Row(
                                          children: [
                                            Text(
                                              'Emergency Contact(s)',
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 2.2),
                                                color: Color(0xff1b1b1b),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              data[0]['contacts']
                                                      .toString()
                                                      .substring(0, 11) +
                                                  '...',
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 2.2),
                                                color: Color(0xff6d6d6d),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                McGyver.rsDoubleW(context, 5)),
                                        Row(
                                          children: [
                                            Text(
                                              'Height',
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 2.2),
                                                color: Color(0xff1b1b1b),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              '${data[0]['height'] ?? 0}cm',
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 2.2),
                                                color: Color(0xff6d6d6d),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                McGyver.rsDoubleW(context, 5)),
                                        Row(
                                          children: [
                                            Text(
                                              'Country',
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 2.2),
                                                color: Color(0xff1b1b1b),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              data[0]['country'],
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 2.2),
                                                color: Color(0xff6d6d6d),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                McGyver.rsDoubleW(context, 5)),
                                        Row(
                                          children: [
                                            Text(
                                              'Year of Birth',
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 2.2),
                                                color: Color(0xff1b1b1b),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              data[0]['birthdate']
                                                  .toString()
                                                  .substring(0, 4),
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 2.2),
                                                color: Color(0xff6d6d6d),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                McGyver.rsDoubleW(context, 5)),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        })
                      : Center(
                          child: CircularProgressIndicator(
                          backgroundColor: buttonColor,
                        ))
                  : Center(
                      child: CircularProgressIndicator(
                      backgroundColor: buttonColor,
                    ));
            }),
      ),
    );
  }
}
