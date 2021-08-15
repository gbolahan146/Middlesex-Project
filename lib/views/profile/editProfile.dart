import 'dart:io';

import 'package:asthma_management/core/services/db.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/profile2/profile2ViewModel.dart';
import 'package:asthma_management/views/signup/colors.dart';
import 'package:asthma_management/widgets/signup_textfield/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asthma_management/views/profile/editProfile2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var _currentSelectedValue = 'Male';

  DateTime initialDate = DateTime.now();

  String countryName = "Nigeria";

  String text = 'dd/mm/yyyy';

  final nameController = TextEditingController();

  String name = '';
  File _image;
  final picker = ImagePicker();
  String imagePath = "";
  String _imagePath = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
  }

  Future<void> getImage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _imagePath = prefs.getString('image');
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<Profile2ViewModel>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
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
      body: FutureBuilder<List>(
          future: DB().getUser(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      var data = snapshot.data;

                      return Column(
                        children: [
                          Container(
                            width: width,
                            // height: McGyver.rsDoubleH(context, 30),
                            color: Colors.white,
                            child: Column(
                              children: [
                                _image == null
                                    ? GestureDetector(
                                        onTap: () => _showImageOptions(context),
                                        child: CircleAvatar(
                                          backgroundImage:
                                              data[0]['image'] == null
                                                  ? FileImage(File(_imagePath))
                                                  : FileImage(
                                                      File(data[0]['image'])),
                                          radius: 50,
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () => _showImageOptions(context),
                                        child: Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: FileImage(_image))),
                                        ),
                                      ),
                                SizedBox(
                                  height: McGyver.rsDoubleH(context, 2),
                                ),
                                Container(
                                  width: McGyver.rsDoubleW(context, 40),
                                  color: Color(0xfff9f7f7),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: McGyver.rsDoubleW(context, 20),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: TextFormField(
                                              controller: nameController,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Username"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: width,
                            height: height,
                            color: Color(0xffe5e5e5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: McGyver.rsDoubleH(context, 4),
                                ),
                                Container(
                                  width: McGyver.rsDoubleW(context, 90),
                                  height: McGyver.rsDoubleH(context, 7),
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      child: FormField<String>(
                                        builder:
                                            (FormFieldState<String> state) {
                                          return InputDecorator(
                                            decoration: InputDecoration(
                                                prefixIcon:
                                                    Icon(Icons.account_circle),
                                                // labelStyle: textStyle,
                                                errorStyle: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontSize: 16.0),
                                                hintText: 'Gender',
                                                border: InputBorder.none),
                                            isEmpty:
                                                _currentSelectedValue == '',
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                value: _currentSelectedValue,
                                                isDense: true,
                                                onChanged: (String newValue) {
                                                  setState(() {
                                                    _currentSelectedValue =
                                                        newValue;
                                                    state.didChange(newValue);
                                                  });
                                                },
                                                items:
                                                    _gender.map((String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          );
                                        },
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    CupertinoRoundedDatePicker.show(
                                      context,
                                      minimumYear: 1790,
                                      maximumYear: 2030,
                                      initialDate: DateTime.now(),
                                      fontFamily: "Mali",
                                      textColor: Colors.white,
                                      background: buttonColor,
                                      borderRadius: 16,
                                      initialDatePickerMode:
                                          CupertinoDatePickerMode.date,
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
                                            left:
                                                McGyver.rsDoubleW(context, 3)),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              color: Colors.grey[600],
                                            ),
                                            SizedBox(
                                              width:
                                                  McGyver.rsDoubleW(context, 3),
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
                                // Container(
                                //   width: McGyver.rsDoubleW(context, 90),
                                //   height: McGyver.rsDoubleH(context, 9),
                                //   child: Card(
                                //     child: Padding(
                                //       padding: EdgeInsets.only(
                                //           left: McGyver.rsDoubleW(
                                //               context, 3)),
                                //       child: Row(
                                //         children: [
                                //           Image.asset(
                                //               'assets/images/global.png'),
                                //           SizedBox(
                                //             width: McGyver.rsDoubleW(
                                //                 context, 1),
                                //           ),
                                //           // CountryListPick(
                                //           //   initialSelection: '+234',
                                //           //   onChanged: (CountryCode code) {
                                //           //     setState(() {
                                //           //       countryName = code.name;
                                //           //     });
                                //           //   },
                                //           // ),
                                //           Spacer(),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: McGyver.rsDoubleH(context, 2),
                                ),
                                Container(
                                  color: Colors.white,
                                  height: 200,
                                  // width:,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Emergency Contacts',
                                        style: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff130a38),
                                            fontSize:
                                                McGyver.textSize(context, 2.1)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: ListView.separated(
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SizedBox(
                                              height:
                                                  McGyver.rsDoubleH(context, 2),
                                            );
                                          },
                                          shrinkWrap: true,
                                          itemCount: viewModel.number,
                                          itemBuilder: (context, index) {
                                            return SignupTextField(
                                              text: '(234) 1234 567',
                                              obscure: false,
                                              keyboardType: TextInputType.phone,
                                              onChanged: (value) => viewModel
                                                  .addNumber(value, index),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              McGyver.rsDoubleH(context, 3)),
                                      Row(
                                        children: [
                                          Visibility(
                                            visible: viewModel.number >= 2
                                                ? true
                                                : false,
                                            child: GestureDetector(
                                              onTap: () =>
                                                  viewModel.decrement(),
                                              child: Text(
                                                'Remove -',
                                                style: GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff30159C),
                                                    fontSize: McGyver.textSize(
                                                        context, 2.1)),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () => viewModel.increment(),
                                            child: Text(
                                              '+ Add more',
                                              style: GoogleFonts.dmSans(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff30159C),
                                                  fontSize: McGyver.textSize(
                                                      context, 2.1)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: McGyver.rsDoubleW(context, 30),
                                      child: RaisedButton(
                                        elevation: 0,
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfile2(
                                                      country: countryName,
                                                      dob: initialDate,
                                                      contacts: viewModel.phone
                                                          .join(','),
                                                      username:
                                                          nameController.text,
                                                      image: _image,
                                                      gender:
                                                          _currentSelectedValue,
                                                    ))),
                                        color: Color(0xffe5e5e5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Next',
                                              style: GoogleFonts.dmSans(
                                                color: Color(0xff30159c),
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_right,
                                              color: Color(0xff30159c),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(
                    backgroundColor: buttonColor,
                  ));
          }),
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

  var _gender = [
    "Male",
    "Female",
  ];

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
