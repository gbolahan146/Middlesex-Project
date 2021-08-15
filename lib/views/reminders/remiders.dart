import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:asthma_management/core/models/reminder.dart';
import 'package:asthma_management/core/services/db.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/bottombar/bottombar.dart';
import 'package:asthma_management/views/splash_screen/splash_screen.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  bool isSwitched = false;
  bool isSnoozeSwitched = true;
  String _dateTime = DateFormat.jm().format(DateTime.now());

  List<Reminder> itemList;

  String _initialRepeatValue = "Every Monday";

  var _repeat = [
    "Every Monday",
    "Every Tuesday",
    "Every Wednesday",
    "Every Thursday",
    "Every Friday",
    "Every Saturday",
    "Every Sunday",
  ];

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('launcher_icon');
    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, iosInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
      await Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (context) => SplashScreen()),
      );
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {

          },
          child: Text("okay"),
        )
      ],
    );
  }

  @override
  void dispose() {
    if (this.mounted) super.dispose();
  }

  TextEditingController _titleController = TextEditingController();
  TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          onPressed: () => Get.off(
            MyHomePage(),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Reminders ',
          style: GoogleFonts.dmSans(
            fontSize: McGyver.textSize(context, 3.0),
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Notifications for AsthmaMGT must be turned \'on\' for reminders to work',
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  fontSize: McGyver.textSize(context, 2)),
            ),
          ),
          SizedBox(height: McGyver.rsDoubleH(context, 4)),
          !DB().getReminders().isNull
              ? Container(
                  margin: EdgeInsets.only(top: 70, bottom: 30),
                  padding: EdgeInsets.only(bottom: 20),
                  child: FutureBuilder<List>(
                    future: DB().getReminders(),
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                var data = snapshot.data[index];
                                return Dismissible(
                                  key: Key(data['takeMeds'].toString()),
                                  confirmDismiss:
                                      (DismissDirection direction) async {
                                    return await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                              const Text("Delete Confirmation"),
                                          content: const Text(
                                              "Are you sure you want to delete this reminder?"),
                                          actions: <Widget>[
                                            FlatButton(
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(false),
                                              child: const Text("Cancel"),
                                            ),
                                            FlatButton(
                                                onPressed: () =>
                                                    Navigator.of(context)
                                                        .pop(true),
                                                child: const Text("Delete")),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  background: Container(
                                    color: Colors.blue,
                                  ),
                                  secondaryBackground: Container(
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(Icons.delete,
                                              color: Colors.white),
                                          Text('Delete Reminder',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onDismissed: (direction) async {
                                    // Remove the item from the data source.
                                    await DB()
                                        .deleteReminders(data['takeMeds']);

                                    // Then show a snackbar.
                                    Get.snackbar(
                                        "Reminder ", "Renider deleted.");
                                  },
                                  child: ReminderListView(
                                    text: data['takeMeds'],
                                    time: data['timeRem'],
                                    index: index,
                                    frequency: data['repeat'],
                                    notes: data['notes'],
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Container(
                              height: 400,
                              child: Text(
                                "No Reminders",
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ));
                    },
                  ),
                )
              : Center(
                  child: Container(
                  height: 400,
                  child: Text(
                    "No Reminders",
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 18),
                  ),
                )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 40, horizontal: McGyver.rsDoubleW(context, 4)),
              child: Material(
                color: Color(0xff130A38),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    _showAddReminderDialog(context);
                  },
                  child: Text(
                    'Add Reminder',
                    style: GoogleFonts.dmSans(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: McGyver.textSize(context, 2.5)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: McGyver.rsDoubleH(context, 2)),
        ],
      ),
    );
  }

  _showAddReminderDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return StatefulBuilder(builder: (context, setter) {
          return SingleChildScrollView(
            child: AlertDialog(
              actionsPadding:
                  EdgeInsets.only(right: McGyver.rsDoubleW(context, 1)),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.dmSans(
                        fontSize: McGyver.textSize(context, 1.5),
                        color: Color(0xff130A38),
                      ),
                    ),
                  ),
                  Text(
                    'Add Reminder',
                    style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 1.8),
                      fontWeight: FontWeight.bold,
                      color: Color(0xff130A38),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_titleController.text != "") {
                        DB()
                            .insertReminder(
                              Reminder(
                                  takeMeds: _titleController.text,
                                  timeRem: _dateTime.toString(),
                                  notes: _notesController.text,
                                  repeat: _initialRepeatValue),
                            )
                            .then((value) => _showSuccessDialog());
                        _titleController.clear();
                        _notesController.clear();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyHomePage()));
                    },
                    child: Text(
                      'Save',
                      style: GoogleFonts.dmSans(
                        fontSize: McGyver.textSize(context, 1.5),
                        color: Color(0xff130A38),
                      ),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                Container(
                  color: Color.fromRGBO(19, 10, 56, 0.03),
                  height: MediaQuery.of(context).size.height - 160,
                  width: McGyver.rsDoubleW(context, 200),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: McGyver.rsDoubleW(context, 4)),
                    padding: EdgeInsets.symmetric(
                        horizontal: McGyver.rsDoubleW(context, 4)),
                    child: ListView(
                      children: [
                        Container(
                          color: Colors.white,
                          height: 250,
                          width: double.infinity,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (datetime) {
                              setState(() {
                                _dateTime = DateFormat.jm().format(datetime);
                              });
                            },
                          ),
                        ),
                        SizedBox(height: McGyver.rsDoubleH(context, 2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Title',
                              style: GoogleFonts.dmSans(
                                fontSize: McGyver.textSize(context, 2.0),
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Color(0xff332F2F),
                              ),
                            ),
                            Container(
                              width: 150,
                              // height: 30,
                              child: TextField(
                                autocorrect: true,
                                textInputAction: TextInputAction.go,
                                controller: _titleController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder()),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Repeat',
                              style: GoogleFonts.dmSans(
                                fontSize: McGyver.textSize(context, 2.0),
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Color(0xff332F2F),
                              ),
                            ),
                            Container(
                              width: 150,
                              child: FormField<String>(
                                builder: (FormFieldState<String> state) {
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    isEmpty: _initialRepeatValue == '',
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: _initialRepeatValue,
                                        isDense: true,
                                        onChanged: (String newValue) {
                                          setState(() {
                                            _initialRepeatValue = newValue;
                                            state.didChange(newValue);
                                          });
                                        },
                                        items: _repeat.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 1.5),
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal,
                                                color: Color(0xffA4A4A4),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: McGyver.rsDoubleH(context, 2)),
                        // Divider(thickness: 0.5),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       'Sound',
                        //       style: GoogleFonts.dmSans(
                        //         fontSize: McGyver.textSize(context, 2.0),
                        //         fontWeight: FontWeight.w500,
                        //         fontStyle: FontStyle.normal,
                        //         color: Color(0xff332F2F),
                        //       ),
                        //     ),
                        //     Row(
                        //       children: [
                        //         Text(
                        //           'Radar',
                        //           style: GoogleFonts.dmSans(
                        //             fontSize: McGyver.textSize(context, 2.0),
                        //             fontWeight: FontWeight.normal,
                        //             fontStyle: FontStyle.normal,
                        //             color: Color(0xffA4A4A4),
                        //           ),
                        //         ),
                        //         Icon(
                        //           Icons.arrow_forward_ios,
                        //           color: Color(0xffA4A4A4),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: McGyver.rsDoubleH(context, 2)),
                        Divider(thickness: 0.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Snooze',
                              style: GoogleFonts.dmSans(
                                fontSize: McGyver.textSize(context, 2.0),
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Color(0xff332F2F),
                              ),
                            ),
                            Switch(
                              value: isSnoozeSwitched,
                              onChanged: (value) {
                                setter(() {
                                  isSnoozeSwitched = value;
                                });
                              },
                              activeTrackColor: Color(0xff30159C),
                              activeColor: Color(0xFFFFFFFF),
                              inactiveTrackColor: Color(0xFFA4A4A4),
                              //   activeColor: Color(0xff30159C),
                            ),
                          ],
                        ),
                        Divider(thickness: 0.5),
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Notes',
                                style: GoogleFonts.dmSans(
                                  fontSize: McGyver.textSize(context, 2.0),
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff332F2F),
                                ),
                              ),
                              SizedBox(width: McGyver.rsDoubleH(context, 3.5)),
                              Container(
                                width: 200,
                                child: TextField(
                                  maxLines: 2,
                                  textInputAction: TextInputAction.go,
                                  controller: _notesController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder()),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: McGyver.rsDoubleH(context, 1)),
                        SizedBox(height: McGyver.rsDoubleH(context, 4)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          actionsPadding:
              EdgeInsets.only(right: McGyver.rsDoubleW(context, 15)),
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
          content: Text("You have successfully added a new reminder ",
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
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

Widget _rowsUsed(Widget widget1, Widget widget2) {
  //Widget widget1, widget2;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      widget1,
      widget2,
    ],
  );
}

class ReminderListView extends StatefulWidget {
  final String title;
  final String text;
  final time;
  final int index;
  final String frequency;
  final String notes;
  final bool taken;

  ReminderListView(
      {this.title,
      this.text,
      this.index,
      this.frequency,
      this.notes,
      this.taken,
      this.time});

  @override
  _ReminderListViewState createState() => _ReminderListViewState();
}

class _ReminderListViewState extends State<ReminderListView> {
  bool isSwitched = false;
  var preferences;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      preferences = await SharedPreferences.getInstance();
      // startTimer();
      getSwtichedValue(widget.index);
      assignSwtichedValue();
      setState(() {});
    });
  }

  Future<bool> getSwtichedValue(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool value = prefs.getBool("reminder$index") ?? false;
    return value;
  }

  bool mainValue = false;

  Future<bool> assignSwtichedValue() async {
    mainValue = await getSwtichedValue(widget.index);
    return mainValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 4)),
      child: Card(
        elevation: 20,
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
          decoration: BoxDecoration(),
          child: Column(
            children: [
              _rowsUsed(
                Expanded(
                  child: Text(
                    widget.text,
                    style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.0),
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff332F2F),
                    ),
                  ),
                ),
                Switch(
                  value: mainValue ??
                      //  getSwtichedValue(widget.index) ??
                      isSwitched,
                  onChanged: (value) async {
                    setState(() {
                      // isSwitched = value;
                      mainValue = value;
                      preferences.setBool("reminder${widget.index}", value);

                      if (mainValue == true) {
                        showNotification(widget.index);
                        showWeeklyAtDayTime(widget.index);
                      } else {
                        flutterLocalNotificationsPlugin.cancel(widget.index);
                      }
                    });
                  },
                  activeTrackColor: Color(0xff30159C),
                  activeColor: Color(0xFFFFFFFF),
                  inactiveTrackColor: Color(0xFFA4A4A4),
                  //   activeColor: Color(0xff30159C),
                ),
              ),
              SizedBox(height: McGyver.rsDoubleH(context, 1)),
              _rowsUsed(
                Text(
                  'Time',
                  style: GoogleFonts.dmSans(
                    fontSize: McGyver.textSize(context, 2.0),
                    fontWeight: FontWeight.normal,
                    color: Color(0xff332F2F),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      widget.time,
                      style: GoogleFonts.dmSans(
                        fontSize: McGyver.textSize(context, 2.0),
                        fontWeight: FontWeight.normal,
                        color: Color(0xff30159C),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: McGyver.rsDoubleH(context, 2)),
              _rowsUsed(
                Text(
                  'Repeat',
                  style: GoogleFonts.dmSans(
                    fontSize: McGyver.textSize(context, 2.0),
                    fontWeight: FontWeight.normal,
                    color: Color(0xff332F2F),
                  ),
                ),
                Text(
                  widget.frequency,
                  style: GoogleFonts.dmSans(
                    fontSize: McGyver.textSize(context, 2.0),
                    fontWeight: FontWeight.normal,
                    color: Color(0xff30159C),
                  ),
                ),
              ),
              SizedBox(height: McGyver.rsDoubleH(context, 1)),
              Divider(
                thickness: 0.5,
              ),
              Text(
                'Notes',
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2.2),
                  fontWeight: FontWeight.w500,
                  color: Color(0xff30159C),
                ),
              ),
              SizedBox(height: McGyver.rsDoubleH(context, 1)),
              Text(
                widget.notes,
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2.0),
                  fontWeight: FontWeight.normal,
                  color: Color(0xff332F2F),
                ),
              ),
              SizedBox(height: McGyver.rsDoubleH(context, 3)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showNotification(int index) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        index.toString(), 'AsthmaMgt', 'Manage your Asthma Effectively',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        index,
        '${widget.text}\n  by ${widget.time}',
        'Repeat by ${widget.frequency} \n${widget.notes}',
        platformChannelSpecifics,
        payload: 'item $index');
  }

  Future<void> showWeeklyAtDayTime(int index) async {
    var timeWithoutZone = widget.time.split(' ')[0];
    var time = widget.time.toString().split(" ")[1] == "PM"
        ? Time(int.parse(timeWithoutZone.toString().split(":")[0]),
            int.parse(timeWithoutZone.toString().split(":")[1]))
        : Time(int.parse(timeWithoutZone.toString().split(":")[0]) + 12,
            int.parse(timeWithoutZone.toString().split(":")[1]));
    var androidChannelSpecifics = AndroidNotificationDetails(
      (index + 1).toString(),
      'AsthmaMgt',
      "Manage your Asthma Effectively",
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
      index + 1,
      '${widget.text.toString().toUpperCase()} at ${time.hour}:${time.minute}',
      '${widget.text}: ${widget.notes} ${widget.frequency}',
      widget.frequency == "Every Sunday"
          ? Day(1)
          : widget.frequency == "Every Monday"
              ? Day(2)
              : widget.frequency == "Every Tuesday"
                  ? Day(3)
                  : widget.frequency == "Every Wednesday"
                      ? Day(4)
                      : widget.frequency == "Every Thursday"
                          ? Day(5)
                          : widget.frequency == "Every Friday"
                              ? Day(6)
                              : Day(7),
      time,
      platformChannelSpecifics,
      payload: 'None',
    );
  }
}
