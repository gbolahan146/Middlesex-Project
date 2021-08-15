import 'package:asthma_management/core/models/emergency_contact.dart';
import 'package:asthma_management/core/services/db.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/core/services/validators.dart';
import 'package:asthma_management/views/emergency/emergencyContacts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEmergencyNumber extends StatefulWidget {
  @override
  _AddEmergencyNumberState createState() => _AddEmergencyNumberState();
}

class _AddEmergencyNumberState extends State<AddEmergencyNumber> {
  final _nameController = TextEditingController();

  final _numberController = TextEditingController();

  final _relationController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 7)),
          child: Form(
            key: formKey,
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
                  onPressed: () => Get.off(
                    EmergencyContacts(),
                  ),
                ),
                Text(
                  'Add Emergency Contact',
                  style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 3.5),
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(19, 10, 56, 0.9)),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 7),
                ),
                TextFormField(
                  controller: _nameController,
                  validator: UsernameValidator.validate,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: false,
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff9d9d9d), width: 1.0),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff9d9d9d), width: 1.0),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff9d9d9d), width: 1.0),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    labelText: 'Name',
                    labelStyle: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.2),
                      color: Color(0xff332f2f),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 3),
                ),
                TextFormField(
                  controller: _relationController,
                  validator: UsernameValidator.validate,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: false,
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff9d9d9d), width: 1.0),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff9d9d9d), width: 1.0),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff9d9d9d), width: 1.0),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    hintText: 'Who is this person to you?',
                    hintStyle: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.2),
                      color: Color(0xff332f2f),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 3),
                ),
                TextFormField(
                  controller: _numberController,
                  validator: UsernameValidator.validate,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: false,
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff9d9d9d), width: 1.0),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff9d9d9d), width: 1.0),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff9d9d9d), width: 1.0),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    labelText: 'Phone number',
                    labelStyle: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.2),
                      color: Color(0xff332f2f),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 3),
                ),
                MaterialButton(
                  height: McGyver.rsDoubleH(context, 8),
                  minWidth: width,
                  color: Color(0xff130a38),
                  onPressed: () {
                    final form = formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      DB()
                          .insertEmergencyContacts(EmergencyContactsModel(
                            emergencyName: _nameController.text,
                            emergencyRelation: _relationController.text,
                            emergencyNumber: _numberController.text,
                          ))
                          .then((value) => showDialog(
                                context: context,
                                builder: (context) {
                                  return SuccessDialog();
                                },
                              ));
                      _nameController.clear();
                      _numberController.clear();
                      _relationController.clear();
                    }
                  },
                  child: Text(
                    'Save',
                    style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.9),
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.only(right: McGyver.rsDoubleW(context, 15)),
      title: Column(
        children: [
          Image.asset(
            'assets/images/greencheck.png',
            scale: 7,
          ),
          Text(
            "Successful!",
            style: GoogleFonts.dmSans(
              color: Color(0xff1EC82F),
              fontSize: McGyver.textSize(context, 2.5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Text("You have successfully added a new emergency contact",
          style: GoogleFonts.dmSans(
            color: Color(0xff000000),
            fontSize: McGyver.textSize(context, 1.7),
            fontWeight: FontWeight.normal,
          )),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: McGyver.rsDoubleH(context, 6),
              width: McGyver.rsDoubleW(context, 40),
              decoration: BoxDecoration(
                color: Color(0xff1ec82f),
                borderRadius: BorderRadius.circular(4),
              ),
              child: FlatButton(
                child: Text("Ok",
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                onPressed: () {
                  Get.off(EmergencyContacts());
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
