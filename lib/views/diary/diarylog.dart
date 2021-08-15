import 'package:asthma_management/core/models/diary_log_model.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/bottombar/bottombar.dart';
import 'package:asthma_management/views/signup/colors.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asthma_management/core/services/db.dart';
import 'package:asthma_management/core/services/validators.dart';
import 'package:intl/intl.dart';

class DiaryLogScreen extends StatefulWidget {
  @override
  _DiaryLogScreenState createState() => _DiaryLogScreenState();
}

class _DiaryLogScreenState extends State<DiaryLogScreen> {
  DateTime _selectedDateTime = DateTime.now();
  final TextEditingController title = TextEditingController();
  final TextEditingController trigger = TextEditingController();
  final TextEditingController more = TextEditingController();
  final TextEditingController symptoms = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int tappedIndex;
  String _currentTime = '';

  Future<void> _show() async {
    final TimeOfDay result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _currentTime = result.format(context);
      });
    }
  }

  formatDate(date) {
    return new DateFormat("dd, MMM yyyy").format(date);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Add Diary Log',
          style: GoogleFonts.dmSans(
            fontSize: McGyver.textSize(context, 3.0),
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 3)),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            children: [
              SizedBox(
                height: McGyver.rsDoubleH(context, 5),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18,
                ),
                child: Container(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How was your day today?',
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff130A38),
                          ),
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 1),
                        ),
                        Container(
                          width: McGyver.rsDoubleW(context, 100),
                          height: McGyver.rsDoubleH(context, 7),
                          child: TextFormField(
                            validator: UsernameValidator.validate,
                            controller: title,
                            autocorrect: true,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              fillColor: Color(0xffffffff),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              hintText: 'Type here',
                              hintStyle: GoogleFonts.dmSans(
                                color: Color(0xff6D6D6D),
                                fontSize: McGyver.textSize(context, 1.8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 5),
                        ),
                        Text(
                          'Were you triggered by something?',
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff130A38),
                          ),
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 1),
                        ),
                        Container(
                          width: McGyver.rsDoubleW(context, 100),
                          height: McGyver.rsDoubleH(context, 7),
                          child: TextFormField(
                            validator: UsernameValidator.validate,
                            controller: trigger,
                            autocorrect: true,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              fillColor: Color(0xffffffff),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0,
                                  color: Color(0xfffbfbfb),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              hintText: 'Type here',
                              hintStyle: GoogleFonts.dmSans(
                                color: Color(0xff6D6D6D),
                                fontSize: McGyver.textSize(context, 1.8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 5),
                        ),
                        Text(
                          'Any new symptoms?',
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff130A38),
                          ),
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 1),
                        ),
                        Container(
                          width: McGyver.rsDoubleW(context, 100),
                          height: McGyver.rsDoubleH(context, 7),
                          child: TextFormField(
                            validator: UsernameValidator.validate,
                            controller: symptoms,
                            autocorrect: true,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              fillColor: Color(0xffffffff),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              hintText: 'Type here',
                              hintStyle: GoogleFonts.dmSans(
                                color: Color(0xff6D6D6D),
                                fontSize: McGyver.textSize(context, 1.8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 5),
                        ),
                        Text(
                          'When did this happen?',
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff130A38),
                          ),
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 1),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/calendar.png',
                              scale: 21,
                            ),
                            SizedBox(
                              width: McGyver.rsDoubleW(context, 2),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white)),
                                child: CupertinoDateTextBox(
                                    textfieldPadding: 9.2,
                                    fontSize: McGyver.textSize(context, 2),
                                    initialValue: _selectedDateTime,
                                    onDateChange: onWhenChange,
                                    color: Color(0xff130A38),
                                    hintText: 'Pick a date'),
                              ),
                            ),
                            SizedBox(
                              width: McGyver.rsDoubleW(context, 5),
                            ),
                            Image.asset(
                              'assets/images/clock.png',
                              scale: 21,
                            ),
                            SizedBox(
                              width: McGyver.rsDoubleW(context, 2),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _show();
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Text(_currentTime != ""
                                        ? _currentTime.toString()
                                        : "Pick time")),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 5),
                        ),
                        Text(
                          'Tell us more here:',
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff130A38),
                          ),
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 1),
                        ),
                        Container(
                          width: McGyver.rsDoubleW(context, 100),
                          height: McGyver.rsDoubleH(context, 17),
                          child: TextFormField(
                            validator: UsernameValidator.validate,
                            controller: more,
                            autocorrect: true,
                            maxLines: 8,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffffffff),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              hintText: 'Type here',
                              hintStyle: GoogleFonts.dmSans(
                                color: Color(0xff6D6D6D),
                                fontSize: McGyver.textSize(context, 1.8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 5),
                        ),
                        MaterialButton(
                          height: McGyver.rsDoubleH(context, 8),
                          minWidth: width,
                          color: Color(0xff130a38),
                          onPressed: () {
                            final form = formKey.currentState;
                            form.save();
                            form.validate() ? _showDialog() : () {};
                          },
                          child: Text(
                            'Save',
                            style: GoogleFonts.dmSans(
                              fontSize: McGyver.textSize(context, 2.5),
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          actionsPadding: EdgeInsets.only(right: McGyver.rsDoubleW(context, 1)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatDate(_selectedDateTime).toString(),
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 1.4),
                  color: Color(0xff6d6d6d),
                ),
              ),
              Text(
                _currentTime.toString(),
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 1.4),
                  color: Color(0xff6d6d6d),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Container(
              height: McGyver.rsDoubleH(context, 50),
              width: McGyver.rsDoubleW(context, 200),
              child: ListView(
                children: [
                  SizedBox(
                    height: McGyver.rsDoubleH(context, 5),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 18.0,
                      right: 18,
                    ),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How was your day today?',
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff130A38),
                            ),
                          ),
                          SizedBox(
                            height: McGyver.rsDoubleH(context, 1),
                          ),
                          Container(
                            width: McGyver.rsDoubleW(context, 100),
                            height: McGyver.rsDoubleH(context, 7),
                            child: TextFormField(
                              controller: title,
                              autocorrect: true,
                              enabled: false,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                fillColor: Color(0xffF7F9F9),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(),
                                hintText:
                                    'Not so bad, forgot to take one of my drugs',
                                hintStyle: GoogleFonts.dmSans(
                                  color: Color(0xff6D6D6D),
                                  fontSize: McGyver.textSize(context, 1.8),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: McGyver.rsDoubleH(context, 5),
                          ),
                          Text(
                            'Were you triggered by something?',
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff130A38),
                            ),
                          ),
                          SizedBox(
                            height: McGyver.rsDoubleH(context, 1),
                          ),
                          Container(
                            width: McGyver.rsDoubleW(context, 100),
                            height: McGyver.rsDoubleH(context, 7),
                            child: TextFormField(
                              controller: trigger,
                              autocorrect: true,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                fillColor: Color(0xffF7F9F9),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0,
                                    color: Color(0xfffbfbfb),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(),
                                hintText: 'Just the same old - Perfumes',
                                enabled: false,
                                hintStyle: GoogleFonts.dmSans(
                                  color: Color(0xff6D6D6D),
                                  fontSize: McGyver.textSize(context, 1.8),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: McGyver.rsDoubleH(context, 5),
                          ),
                          Text(
                            'Any new symptoms?',
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff130A38),
                            ),
                          ),
                          SizedBox(
                            height: McGyver.rsDoubleH(context, 1),
                          ),
                          Container(
                            width: McGyver.rsDoubleW(context, 100),
                            height: McGyver.rsDoubleH(context, 7),
                            child: TextFormField(
                              controller: symptoms,
                              autocorrect: true,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                fillColor: Color(0xffF7F9F9),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(),
                                hintText: 'None',
                                enabled: false,
                                hintStyle: GoogleFonts.dmSans(
                                  color: Color(0xff6D6D6D),
                                  fontSize: McGyver.textSize(context, 1.8),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: McGyver.rsDoubleH(context, 5),
                          ),
                          Text(
                            'Tell us more here:',
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff130A38),
                            ),
                          ),
                          SizedBox(
                            height: McGyver.rsDoubleH(context, 1),
                          ),
                          Container(
                            width: McGyver.rsDoubleW(context, 100),
                            height: McGyver.rsDoubleH(context, 17),
                            child: TextFormField(
                              controller: more,
                              autocorrect: true,
                              maxLines: 2,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF7F9F9),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(),
                                hintText: 'None',
                                enabled: false,
                                hintStyle: GoogleFonts.dmSans(
                                  color: Color(0xff6D6D6D),
                                  fontSize: McGyver.textSize(context, 1.8),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: McGyver.rsDoubleW(context, 100),
                              child: MaterialButton(
                                height: McGyver.rsDoubleH(context, 7),
                                minWidth: McGyver.rsDoubleW(context, 19),
                                color: Color(0xff130a38),
                                onPressed: () async {
                                  DB()
                                      .insertDiaryLog(DiaryLog(
                                    title: title.text,
                                    trigger: trigger.text,
                                    symptoms: symptoms.text,
                                    date: _selectedDateTime.toString(),
                                    time: _currentTime,
                                    description: more.text,
                                  ))
                                      .then((value) {
                                    title.clear();
                                    trigger.clear();
                                    symptoms.clear();
                                    more.clear();
                                    Get.snackbar('Success',
                                        'Your log has been added succesfully',
                                        snackPosition: SnackPosition.TOP,
                                        snackStyle: SnackStyle.FLOATING,
                                        leftBarIndicatorColor: buttonColor,
                                        backgroundColor: Colors.lightGreen,
                                        borderRadius: 0,
                                        duration: Duration(seconds: 4),
                                        icon: Icon(Icons.error));
                                    Future.delayed(Duration(seconds: 5), () {
                                      Get.off(MyHomePage());
                                    });
                                  });
                                },
                                child: Text(
                                  'Done',
                                  style: GoogleFonts.dmSans(
                                    fontSize: McGyver.textSize(context, 2.5),
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: McGyver.rsDoubleH(context, 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void onWhenChange(DateTime when) {
    setState(() {
      _selectedDateTime = when;
    });
  }
}

class Types {
  const Types(this.id, this.name);
  final String name;
  final int id;
}
