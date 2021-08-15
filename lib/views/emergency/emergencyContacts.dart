import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:asthma_management/core/services/db.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/emergency/addNumber.dart';
import 'package:asthma_management/views/emergency/emergencyPopUp.dart';

class EmergencyContacts extends StatefulWidget {
  @override
  _EmergencyContactsState createState() => _EmergencyContactsState();
}

class _EmergencyContactsState extends State<EmergencyContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 8),
          ),
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
                  EmergencyPopUp(),
                ),
              ),
              Text(
                'Emergency Contacts',
                style: GoogleFonts.dmSans(
                    fontSize: McGyver.textSize(context, 3.5),
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(19, 10, 56, 0.9)),
              ),
              Text(
                "List of contacts to request help from",
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: Color(0xff30159c),
                ),
              ),
              Expanded(
                child: FutureBuilder<List>(
                    future: DB().getEmergencyContacts(),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.done
                          ? snapshot.hasData
                              ? ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    var data = snapshot.data[index];
                                    return Dismissible(
                                      key:
                                          Key(data['emergencyName'].toString()),
                                      onDismissed: (direction) async {
                                        // Remove the item from the data source.
                                        await DB().deleteEmergencyContacts(
                                            data['emergencyName']);

                                        Get.snackbar("Emergency Contact",
                                            "Emergency contact removed.");
                                      },
                                      confirmDismiss:
                                          (DismissDirection direction) async {
                                        return await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  "Delete Confirmation"),
                                              content: const Text(
                                                  "Are you sure you want to delete this contact?"),
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
                                                    child:
                                                        const Text("Delete")),
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
                                              Text('Delete Contact',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            title: Text(
                                              data['emergencyName'],
                                              style: GoogleFonts.dmSans(
                                                fontSize: McGyver.textSize(
                                                    context, 2.7),
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff0e1633),
                                              ),
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data['emergencyRelation'],
                                                  style: GoogleFonts.dmSans(
                                                    fontSize: McGyver.textSize(
                                                        context, 2),
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff9d9d9d),
                                                  ),
                                                ),
                                                Text(
                                                  data['emergencyNumber'],
                                                  style: GoogleFonts.dmSans(
                                                    fontSize: McGyver.textSize(
                                                        context, 1.8),
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff9d9d9d),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            trailing: FlatButton(
                                              color: Colors.red,
                                              onPressed: () {
                                                _sendSMS(
                                                    recipientNumber:
                                                        data['emergencyNumber'],
                                                    recipientName:
                                                        data['emergencyName']);
                                              },
                                              child: Text(
                                                'SEND',
                                                style: GoogleFonts.dmSans(
                                                  fontSize: McGyver.textSize(
                                                      context, 2.4),
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2,
                                            color: Color(0xffe9e9e9),
                                          )
                                        ],
                                      ),
                                    );
                                  })
                              : Container(
                                  child: Center(
                                    child: Text("No emergency contacts"),
                                  ),
                                )
                          : Container();
                    }),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.red,
                        onPressed: () => Get.to(
                          AddEmergencyNumber(),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Add new contact',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.4),
                          fontWeight: FontWeight.bold,
                          color: Color(0xff130a38),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Future<void> _sendSMS({String recipientNumber, String recipientName}) async {
    try {
      String _result = await sendSMS(
          message: "Help! I am having an emergency",
          recipients: [recipientNumber]);

      SentMessageDialog(recipientName: recipientName);
    } catch (error) {

    }
  }
}

class SentMessageDialog extends StatelessWidget {
  String recipientName;
  SentMessageDialog({
    this.recipientName,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.only(right: McGyver.rsDoubleW(context, 15)),
      title: Container(
        color: Color(0xffDE3025),
        child: Column(
          children: [
            Image.asset(
              'assets/images/send_message.png',
              scale: 3,
            ),
            Text(
              "Message Sent",
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: McGyver.textSize(context, 2.5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      content: Text(
          "Your message has been delivered to $recipientName Help is on the way.",
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: McGyver.textSize(context, 1.7),
            fontWeight: FontWeight.normal,
          )),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Material(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              child: MaterialButton(
                padding: EdgeInsets.all(10),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Done",
                          style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: McGyver.textSize(context, 1.7)),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
