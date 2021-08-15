import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:asthma_management/core/models/userModel.dart';
import 'package:asthma_management/core/services/db.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/bottombar/bottombar.dart';
import 'package:asthma_management/views/login/loginViewModel.dart';
import 'package:asthma_management/views/profile2/profile2ViewModel.dart';
import 'package:asthma_management/views/signup/colors.dart';
import 'package:asthma_management/widgets/signup_textfield/textfield.dart';

class EditProfile2 extends HookWidget {
  final String country;
  final DateTime dob;
  final String username;
  final String contacts;
  final File image;
  final String gender;

  const EditProfile2({
    Key key,
    this.country,
    this.dob,
    this.username,
    this.contacts,
    this.image,
    this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<Profile2ViewModel>(context);

    final ageController = useTextEditingController();
    final heightController = useTextEditingController();

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
            color: Colors.black,
          ),
          title: Text(
            'Edit your Profile',
            style: GoogleFonts.dmSans(
              fontSize: McGyver.textSize(context, 2.9),
              color: Color(0xff130a38),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: McGyver.rsDoubleW(context, 5)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What age were you diagnosed?',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff130a38),
                        fontSize: McGyver.textSize(context, 2.1)),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 2)),
                  SignupTextField(
                    controller: ageController,
                    text: 'Type age here',
                    obscure: false,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 5)),
                  Text(
                    'What is your height?',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff130a38),
                        fontSize: McGyver.textSize(context, 2.1)),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 2)),
                  SignupTextField(
                    controller: heightController,
                    text: 'Height in cm',
                    obscure: false,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 5)),
                  Text(
                    'Trigger factors (optional)',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(19, 10, 56, 0.9),
                        fontSize: McGyver.textSize(context, 2.1)),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 2)),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Cold/Humid Air',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                viewModel.setBool(0, 'Cold/Humid Air');
                              },
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.trigger[0] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Smoking',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => viewModel.setBool(1, 'Smoking'),
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.trigger[1] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Allergy',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => viewModel.setBool(2, 'Allergy'),
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.trigger[2] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Heart Burn',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => viewModel.setBool(3, 'Heart Burn'),
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.trigger[3] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 5)),
                  Text(
                    'Your Symptoms',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(19, 10, 56, 0.9),
                        fontSize: McGyver.textSize(context, 2.1)),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 2)),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Difficulty Breathing',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                viewModel.setSymptomBool(
                                    0, 'Difficulty Breathing');
                              },
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.symptoms[0] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Chest tightness',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => viewModel.setSymptomBool(
                                  1, 'Chest tightness'),
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.symptoms[1] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Coughing',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () =>
                                  viewModel.setSymptomBool(2, 'Coughing'),
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.symptoms[2] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Sleep Problems',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () =>
                                  viewModel.setSymptomBool(3, 'Sleep Problems'),
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.symptoms[3] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 5)),
                  viewModel.buttonStates == ButtonStates.Idle
                      ? MaterialButton(
                          minWidth: width,
                          height: McGyver.rsDoubleH(context, 9),
                          color: buttonColor,
                          onPressed: () async {
                            List<String> some = viewModel.phone;
                            if (ageController.text.isNotEmpty) {
                              if (some[0].length != 11) {
                                Get.snackbar(
                                    'Hey there', 'Please enter a valid contact',
                                    snackPosition: SnackPosition.TOP,
                                    snackStyle: SnackStyle.FLOATING,
                                    leftBarIndicatorColor: buttonColor,
                                    backgroundColor: Colors.red,
                                    borderRadius: 0,
                                    duration: Duration(seconds: 4),
                                    icon: Icon(Icons.error)
                                    // backgroundColor: buttonColor
                                    );
                              } else {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool('profile', true);
                                prefs.setString('name', username);
                                prefs.setString('fullname', username);
                                var days = DateTime.now().difference(dob);

                                var age = (days.inDays / 360).round();
                                DB().updateUser(User(
                                    ageDiagnosed: ageController.text,
                                    country: country,
                                    fullname: username,
                                    peakflow:
                                        ((int.tryParse(heightController.text) *
                                                    5.3) -
                                                433)
                                            .round()
                                            .toString(),
                                    gender: gender,
                                    image: image.path,
                                    id: 1,
                                    height: heightController.text,
                                    username: username,
                                    age: age.toString(),
                                    birthdate: dob.toString(),
                                    contacts: contacts,
                                    symptoms: viewModel.symptomNames.join(','),
                                    triggers:
                                        viewModel.triggerNames.join(',')));

                                Get.snackbar(
                                    'Success', 'Your profile has been updated',
                                    snackPosition: SnackPosition.TOP,
                                    snackStyle: SnackStyle.FLOATING,
                                    leftBarIndicatorColor: buttonColor,
                                    backgroundColor: Colors.lightGreen,
                                    borderRadius: 0,
                                    duration: Duration(seconds: 3),
                                    icon: Icon(Icons.error)
                                    // backgroundColor: buttonColor
                                    );
                                Future.delayed(Duration(seconds: 4), () {
                                  Get.off(MyHomePage());
                                });
                              }
                            } else {
                              Get.snackbar(
                                  'Hey there', 'Fill in the required fields',
                                  snackPosition: SnackPosition.TOP,
                                  snackStyle: SnackStyle.FLOATING,
                                  leftBarIndicatorColor: buttonColor,
                                  backgroundColor: Colors.red,
                                  borderRadius: 0,
                                  duration: Duration(seconds: 4),
                                  icon: Icon(Icons.error)
                                  // backgroundColor: buttonColor
                                  );
                            }
                          },
                          child: Text(
                            'Save',
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: McGyver.textSize(context, 2.5)),
                          ),
                        )
                      : SpinKitThreeBounce(
                          color: buttonColor,
                          size: 30,
                        ),
                  SizedBox(height: McGyver.rsDoubleH(context, 3)),
                ],
              ),
            ),
          ),
        ));
  }
}
