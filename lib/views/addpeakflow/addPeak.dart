import 'package:asthma_management/core/models/userModel.dart';
import 'package:asthma_management/core/services/db.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/bottombar/bottombar.dart';

import 'package:asthma_management/views/peakflow/peakflow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:virtual_keyboard/virtual_keyboard.dart';

class AddPeakFlow extends StatefulWidget {
  @override
  _AddPeakFlowState createState() => _AddPeakFlowState();
}

class _AddPeakFlowState extends State<AddPeakFlow> {
  TextEditingController textFieldController = TextEditingController();
  // True if shift enabled.
  bool shiftEnabled = false;

  // is true will show the numeric keyboard.
  bool isNumericMode = true;
  String text = '';
  formatDate() {
    return new DateFormat("MMMM, dd yyyy").format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xffffffff),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.off(
            PeakFlow(),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Peak flow ',
          style: GoogleFonts.dmSans(
            fontSize: McGyver.textSize(context, 3.0),
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: FutureBuilder(
          future: DB().getUser(),
          builder: (context, snapshot) {
            var data;

            data = snapshot.data;

            return snapshot.hasData
                ? ListView(
                    children: [
                      SizedBox(
                        height: McGyver.rsDoubleH(context, 2),
                      ),
                      Center(
                        child: Text(
                          formatDate(),
                          style: GoogleFonts.dmSans(
                              color: Color.fromRGBO(19, 10, 56, 0.7),
                              fontWeight: FontWeight.bold,
                              fontSize: McGyver.textSize(context, 2.2)),
                        ),
                      ),
                      Center(
                        heightFactor: 1.2,
                        child: Container(
                          width: 220,
                          height: 220,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                text,
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: McGyver.textSize(context, 7)),
                              ),
                              Text(
                                'L/min',
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: McGyver.textSize(context, 2.4)),
                              ),
                            ],
                          )),
                          decoration: BoxDecoration(
                              color: Color(0xff130A38), shape: BoxShape.circle),
                        ),
                      ),
                      SizedBox(
                        height: McGyver.rsDoubleH(context, 7),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cancel',
                              style: GoogleFonts.dmSans(
                                  fontSize: McGyver.textSize(context, 2.2),
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffDD300A)),
                            ),
                            GestureDetector(
                              onTap: () async {

                                await DB().updateUser(User(
                                    peakflow: text.toString(),
                                    username: data[0]['username'],
                                    fullname: data[0]['fullname'],
                                    gender: data[0]['gender'].toString(),
                                    image: data[0]['image'],
                                    symptoms: data[0]['symptoms'],
                                    age: data[0]['age'],
                                    id: 1,
                                    birthdate: data[0]['birthdate'],
                                    height: data[0]['height'],
                                    ageDiagnosed: data[0]['ageDiagnosed'],
                                    country: data[0]['country'],
                                    contacts: data[0]['contacts'],
                                    triggers: data[0]['triggers']));

                                _sendDataBack(context);
                              },
                              child: Text(
                                'Save',
                                style: GoogleFonts.dmSans(
                                    fontSize: McGyver.textSize(context, 2.2),
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff6E5BBA)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SwitchListTile(
                      //   title: Text(
                      //     'Keyboard Type = ' + (isNumericMode ? 'Numeric' : 'Alphanumeric'),
                      //   ),
                      //   value: isNumericMode,
                      //   onChanged: (val) {
                      //     setState(() {
                      //       isNumericMode = val;
                      //     });
                      //   },
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[200])),
                        child: VirtualKeyboard(
                            height: 300,
                            alwaysCaps: true,
                            textColor: Color(0xff000000),
                            fontSize: McGyver.textSize(context, 4),
                            type: isNumericMode
                                ? VirtualKeyboardType.Numeric
                                : VirtualKeyboardType.Alphanumeric,
                            onKeyPress: _onKeyPress),
                      )
                    ],
                  )
                : SizedBox();
          }),
    );
  }

  /// Fired when the virtual keyboard key is pressed.
  _onKeyPress(VirtualKeyboardKey key) {
    if (key.keyType == VirtualKeyboardKeyType.String) {
      text = text + (shiftEnabled ? key.capsText : key.text);
    } else if (key.keyType == VirtualKeyboardKeyType.Action) {
      switch (key.action) {
        case VirtualKeyboardKeyAction.Backspace:
          if (text.length == 0) return;
          text = text.substring(0, text.length - 1);
          break;
        case VirtualKeyboardKeyAction.Return:
          text = text + '\n';
          break;
        case VirtualKeyboardKeyAction.Space:
          text = text + key.text;
          break;
        case VirtualKeyboardKeyAction.Shift:
          shiftEnabled = !shiftEnabled;
          break;
        default:
      }
    }
    // Update the screen
    setState(() {});
  }

  void _sendDataBack(BuildContext context) {
    // Navigator.pop(context, textToSendBack);
    Get.to(() => MyHomePage());
  }
}
