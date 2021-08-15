import 'dart:developer';
import 'dart:io';

import 'package:asthma_management/views/profile2/profile2View.dart';
import 'package:asthma_management/views/signup/colors.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/services/responsiveness.dart';

class ProfilePage1 extends StatefulWidget {
  @override
  _ProfilePage1State createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  Color color;
  var _currentSelectedValue = 'Male';
  DateTime initialDate = DateTime.now();
  String countryName = "Nigeria";
  String text = 'dd/mm/yyyy';
  String name = '';

  File _image;
  final picker = ImagePicker();
  String imagePath = "";

  @override
  void initState() {
    getName();
    super.initState();
  }

  Future<void> getName() async {
    final prefs = await SharedPreferences.getInstance();
    String _name = prefs.getString('name');
    setState(() {
      name = _name;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                width: McGyver.rsDoubleW(context, 100),
                height: McGyver.rsDoubleH(context, 50),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: McGyver.rsDoubleH(context, 2)),
                      Text(
                        'Complete your Profile',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff130a38),
                          fontSize: McGyver.textSize(context, 2.6),
                        ),
                      ),
                      SizedBox(height: McGyver.rsDoubleH(context, 2)),
                      Text(
                        'To enable us to provide valid health information, please fill in your profile details.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                            color: Color(0xff30158c),
                            fontSize: McGyver.textSize(context, 2.1)),
                      ),
                      SizedBox(height: McGyver.rsDoubleH(context, 2)),
                      _image == null
                          ? GestureDetector(
                              onTap: () => _showImageOptions(context),
                              child: CircleAvatar(
                                radius: 70.0,
                                child: Text(
                                  'Add Photo',
                                  style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(157, 157, 157, 0.9),
                                      fontSize: McGyver.textSize(context, 2)),
                                ),
                                backgroundColor: Color(0xffF6F6F6),
                              ),
                            )
                          : GestureDetector(
                              onTap: () => _showImageOptions(context),
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(_image))),
                              ),
                            ),
                      SizedBox(height: McGyver.rsDoubleH(context, 2)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Hi,',
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.normal,
                                color: Color(0xff0e1633),
                                fontSize: McGyver.textSize(context, 2.1)),
                          ),
                          SizedBox(width: McGyver.rsDoubleW(context, 0.5)),
                          Text(
                            name + '!',
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff0e1633),
                                fontSize: McGyver.textSize(context, 2.1)),
                          ),
                          SizedBox(width: McGyver.rsDoubleW(context, 0.5)),
                          Text(
                            'Let\'s get you Started.',
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.normal,
                                color: Color(0xff0e1633),
                                fontSize: McGyver.textSize(context, 2.1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Color(0xffE5E5E5),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: McGyver.rsDoubleW(context, 90),
                        height: McGyver.rsDoubleH(context, 9),
                        // color: Colors.white,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.account_circle),
                                    // labelStyle: textStyle,
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 16.0),
                                    hintText: 'Gender',
                                    border: InputBorder.none
                                    // border: OutlineInputBorder(
                                    //     borderSide:
                                    //         BorderSide(color: Colors.white),
                                    //     borderRadius: BorderRadius.circular(0.0)),
                                    ),
                                isEmpty: _currentSelectedValue == '',
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _currentSelectedValue,
                                    isDense: true,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _currentSelectedValue = newValue;
                                        state.didChange(newValue);
                                      });
                                    },
                                    items: _gender.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          CupertinoRoundedDatePicker.show(
                            context,
                            minimumYear: 1790,
                            maximumYear: 2030,
                            initialDate: initialDate,
                            fontFamily: "Mali",
                            textColor: Colors.white,
                            background: buttonColor,
                            borderRadius: 16,
                            initialDatePickerMode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (newDateTime) {
                              setState(() {
                                initialDate = newDateTime;
                                text = newDateTime.toString();
                              });
                            },
                          );
                        },
                        child: Container(
                          width: McGyver.rsDoubleW(context, 90),
                          height: McGyver.rsDoubleH(context, 9),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: McGyver.rsDoubleW(context, 3)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.grey[600],
                                  ),
                                  SizedBox(
                                    width: McGyver.rsDoubleW(context, 3),
                                  ),
                                  Text(
                                    text.substring(0, 10),
                                    style: GoogleFonts.dmSans(
                                      color: Color(0xff130a38),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: McGyver.rsDoubleW(context, 90),
                        height: McGyver.rsDoubleH(context, 9),
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: McGyver.rsDoubleW(context, 3)),
                            child: Row(
                              children: [
                                Image.asset('assets/images/global.png'),
                                Spacer(),
                                CountryListPick(
                                  initialSelection: '+234',
                                  onChanged: (CountryCode code) {
                                    setState(() {
                                      countryName = code.name;
                                    });
                                  },
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: McGyver.rsDoubleH(context, 5),
                      ),
                      MaterialButton(
                        minWidth: width,
                        height: McGyver.rsDoubleH(context, 9),
                        color: buttonColor,
                        onPressed: () async {
                          final preferences =
                              await SharedPreferences.getInstance();
                          await preferences.setString('image', _image.path);
                          Get.to(() => Profile2(
                                gender: _currentSelectedValue,
                                dob: initialDate,
                                imagePath: _image.path,
                                country: countryName,
                              ));
                        },
                        child: Text(
                          'Next',
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: McGyver.textSize(context, 2.5)),
                        ),
                      ),
                      SizedBox(height: McGyver.rsDoubleH(context, 3)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 250,
              child: Column(children: <Widget>[
                ListTile(
                    onTap: () {
                      pickImage();
                    },
                    leading: Icon(Icons.photo_camera),
                    title: Text("Snap picture ")),
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      pickGalleryImage();
                    },
                    leading: Icon(Icons.photo_library),
                    title: Text("Choose image from gallery")),
              ]));
        });
  }

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image.path.isEmpty) return null;

    setState(() {
      _image = File(image.path);
    });
    imagePath = '';
  }

  pickGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image.path.isEmpty) return null;
    setState(() {
      _image = File(image.path);
    });

    imagePath = '';
  }
}

var _gender = [
  "Male",
  "Female",
];
