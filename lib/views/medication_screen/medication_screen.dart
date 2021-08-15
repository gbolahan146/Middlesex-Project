import 'package:asthma_management/core/routes/route_names.dart';
import 'package:asthma_management/core/services/db.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Medications',
          style: GoogleFonts.dmSans(
              fontSize: McGyver.textSize(context, 3),
              color: Color(0xff130A38),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 17),
        child: ListView(
          children: <Widget>[
            SizedBox(height: McGyver.rsDoubleH(context, 3)),
            Text(
              'Your rescue medication',
              style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2.5),
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF30159C)),
            ),
            SizedBox(height: McGyver.rsDoubleH(context, 1.5)),
            Text(
                'Quick-relief medications taken as needed for relief of symptoms',
                style: GoogleFonts.dmSans(
                    fontSize: McGyver.textSize(context, 1.4),
                    color: Color(0xFF000000))),
            SizedBox(height: McGyver.rsDoubleH(context, 2)),
            Container(
              // height: McGyver.rsDoubleH(context, 30),
              child: FutureBuilder<List>(
                future: DB().getRescue(),
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.done
                      ? snapshot.hasData
                          ? Container(
                              height: McGyver.rsDoubleH(context, 10) *
                                  snapshot.data.length,
                              child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    var data = snapshot.data[index];

                                    return Dismissible(
                                      key: Key(data['rescue'].toString()),
                                      confirmDismiss:
                                          (DismissDirection direction) async {
                                        return await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  "Delete Confirmation"),
                                              content: const Text(
                                                  "Are you sure you want to delete this medication?"),
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
                                              Text('Delete Rescue medication',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      onDismissed: (direction) async {
                                        // Remove the item from the data source.
                                        await DB().deleteRescue(data['rescue']);

                                        // Then show a snackbar.
                                        Get.snackbar("Rescue ",
                                            "Rescue medication deleted.");
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                                color: Color(0xff424242)),
                                            right: BorderSide(
                                                color: Color(0xff424242)),
                                            left: BorderSide(
                                                color: Color(0xff424242)),
                                            bottom: BorderSide(
                                                color: Color(0xff424242)),
                                          ),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width:
                                                  McGyver.rsDoubleW(context, 3),
                                            ),
                                            Container(
                                                height: McGyver.rsDoubleH(
                                                    context, 6),
                                                width: McGyver.rsDoubleW(
                                                    context, 9),
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/inhaler2.png',
                                                  ),
                                                )),
                                            SizedBox(
                                              width:
                                                  McGyver.rsDoubleW(context, 6),
                                            ),
                                            Text(data['rescue'],
                                                style: GoogleFonts.dmSans(
                                                    fontSize: McGyver.textSize(
                                                        context, 2.5),
                                                    color: Color(0xff0E1633),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          : Container()
                      : Container();
                },
              ),
            ),
            SizedBox(height: McGyver.rsDoubleH(context, 3)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xff130A38),
                  child: MaterialButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.add_rescue);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(children: <Widget>[
                          Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                        ]),
                        Column(
                          children: <Widget>[
                            Text(
                              "Add rescue medications",
                              style: GoogleFonts.dmSans(
                                  textStyle: TextStyle(
                                      color: Colors.white,
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
            SizedBox(height: McGyver.rsDoubleH(context, 2)),
            Text(
              'Your controller medication',
              style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2.5),
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF30159C)),
            ),
            SizedBox(height: McGyver.rsDoubleH(context, 1.5)),
            Text('Only use when you having trouble breathing ',
                style: GoogleFonts.dmSans(
                    fontSize: McGyver.textSize(context, 1.4),
                    color: Color(0xFF000000))),
            SizedBox(height: McGyver.rsDoubleH(context, 2)),
            FutureBuilder<List>(
              future: DB().getMedication(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.done
                    ? snapshot.hasData
                        ? Container(
                            height: McGyver.rsDoubleH(context, 10) *
                                snapshot.data.length,
                            child: ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  var data = snapshot.data[index];
                                  return Dismissible(
                                    key: Key(data['medication'].toString()),
                                    confirmDismiss:
                                        (DismissDirection direction) async {
                                      return await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                "Delete Confirmation"),
                                            content: const Text(
                                                "Are you sure you want to delete this medication?"),
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
                                            Text('Delete Controller medication',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onDismissed: (direction) async {
                                      // Remove the item from the data source.
                                      await DB()
                                          .deleteMedication(data['medication']);

                                      // Then show a snackbar.
                                      Get.snackbar("Controller ",
                                          "Controller medication deleted.");
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                              color: Color(0xff424242)),
                                          right: BorderSide(
                                              color: Color(0xff424242)),
                                          left: BorderSide(
                                              color: Color(0xff424242)),
                                          bottom: BorderSide(
                                              color: Color(0xff424242)),
                                        ),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width:
                                                McGyver.rsDoubleW(context, 3),
                                          ),
                                          Container(
                                              height:
                                                  McGyver.rsDoubleH(context, 6),
                                              width:
                                                  McGyver.rsDoubleW(context, 9),
                                              child: Image(
                                                image: AssetImage(
                                                  'assets/images/inhaler2.png',
                                                ),
                                              )),
                                          SizedBox(
                                            width:
                                                McGyver.rsDoubleW(context, 6),
                                          ),
                                          Text(data['medication'],
                                              style: GoogleFonts.dmSans(
                                                  fontSize: McGyver.textSize(
                                                      context, 2.5),
                                                  color: Color(0xff0E1633),
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : Container()
                    : Container();
              },
            ),
            SizedBox(height: McGyver.rsDoubleH(context, 3)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xff130A38),
                  child: MaterialButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.add_ctrl);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(children: <Widget>[
                          Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                        ]),
                        Column(
                          children: <Widget>[
                            Text(
                              "Add controller medications",
                              style: GoogleFonts.dmSans(
                                  textStyle: TextStyle(
                                      color: Colors.white,
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
        ),
      ),
    );
  }
}
