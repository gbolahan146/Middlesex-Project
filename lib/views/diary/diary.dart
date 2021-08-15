import 'dart:io';

import 'package:asthma_management/core/routes/route_names.dart';
import 'package:asthma_management/core/services/db.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/core/services/statefulWrapper.dart';
import 'package:asthma_management/views/homepage/homePageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  int tappedIndex;

  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
  }

  formatDate(date) {
    return new DateFormat("dd, MMM yyyy").format(DateTime.parse(date));
  }

  var user = "Oluwaseun";
  Types selectedTime;

  List types = [
    const Types(1, 'Daily'),
    const Types(2, 'Weekly'),
    const Types(3, 'Monthly'),
  ];
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomePageViewModel>(context);

    return StatefulWrapper(
      onInit: () {
        viewModel.getName();
        viewModel.getImage();
      },
      child: Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Asthma Diary ',
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
                  child: FutureBuilder<List>(
                      future: DB().getUser(),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? Container(
                                height: 100,
                                child: ListView.builder(
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      var data = snapshot.data;

                                      return Row(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: McGyver.rsDoubleW(
                                                    context, 30),
                                              ),
                                              Container(
                                                height: 100,
                                                width: 100,
                                                child: Container(
                                                  decoration: data[0]
                                                              ['image'] ==
                                                          null
                                                      ? BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: FileImage(
                                                                  File(viewModel
                                                                      .image))))
                                                      : BoxDecoration(
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: FileImage(
                                                                  File(data[0][
                                                                      'image']))),
                                                          shape:
                                                              BoxShape.circle),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                      text: 'Hey ',
                                                      style: GoogleFonts.dmSans(
                                                          color:
                                                              Color(0xff130A38),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize:
                                                              McGyver.textSize(
                                                                  context, 2)),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text:
                                                                '${viewModel.name ?? ''}',
                                                            style: GoogleFonts
                                                                .dmSans(
                                                              color: Color(
                                                                  0xff130A38),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: McGyver
                                                                  .textSize(
                                                                      context,
                                                                      2),
                                                            ))
                                                      ]),
                                                ),
                                                Text(
                                                  'How are you feeling today?',
                                                  style: GoogleFonts.dmSans(
                                                      color: Color(0xff130A38),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize:
                                                          McGyver.textSize(
                                                              context, 1.5)),
                                                ),
                                                SizedBox(
                                                  height: McGyver.rsDoubleH(
                                                      context, 2.5),
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      height: 36,
                                                      child: Material(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                        color:
                                                            Color(0xff130A38),
                                                        child: MaterialButton(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 9,
                                                                  left: 18,
                                                                  right: 18),
                                                          onPressed: () => {
                                                            Navigator.pushNamed(
                                                                context,
                                                                RouteNames
                                                                    .diarylog)
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Column(children: <
                                                                  Widget>[
                                                                Icon(
                                                                  Icons.add,
                                                                  size: 18,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ]),
                                                              SizedBox(
                                                                width: McGyver
                                                                    .rsDoubleW(
                                                                        context,
                                                                        2),
                                                              ),
                                                              Column(
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    "Add Diary Log",
                                                                    style: GoogleFonts.dmSans(
                                                                        textStyle: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize: McGyver.textSize(context,
                                                                                1.7)),
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              )
                            : SizedBox();
                      }),
                ),
              ),
              SizedBox(
                height: McGyver.rsDoubleH(context, 7),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Asthma Diary Log',
                      style: GoogleFonts.dmSans(
                        fontSize: McGyver.textSize(context, 2.4),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        dropdownColor: Color(0xff130A38),
                        hint: Text("Select Time",
                            style: GoogleFonts.dmSans(
                              color: Color(0xff6D6D6D),
                              fontSize: McGyver.textSize(context, 1.5),
                              fontWeight: FontWeight.w500,
                            )),
                        isDense: true,
                        value: selectedTime == null ? null : selectedTime,
                        onChanged: (newValue) {
                          setState(() {
                            selectedTime = newValue;
                          });
                        },
                        items: types.map((user) {
                          return DropdownMenuItem(
                            value: user,
                            child: selectedTime == null
                                ? Text(
                                    user.name,
                                    style: GoogleFonts.dmSans(
                                      color: Colors.white,
                                      fontSize: McGyver.textSize(context, 1.5),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : selectedTime.name == user.name
                                    ? Container(
                                        child: Text(
                                          user.name,
                                          style: GoogleFonts.dmSans(
                                            fontSize:
                                                McGyver.textSize(context, 1.5),
                                            color: Color(0xff6D6D6D),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        user.name,
                                        style: GoogleFonts.dmSans(
                                          color: Colors.white,
                                          fontSize:
                                              McGyver.textSize(context, 1.5),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: McGyver.rsDoubleH(context, 3),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: McGyver.rsDoubleH(context, 100),
                  child: FutureBuilder<List>(
                      future: DB().getDiaryLog(),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  var data = snapshot.data[index];
                                  return Dismissible(
                                    key: Key(data['title'].toString()),
                                    confirmDismiss:
                                        (DismissDirection direction) async {
                                      return await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                "Delete Confirmation"),
                                            content: const Text(
                                                "Are you sure you want to delete this log?"),
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
                                            Text('Delete Diary Log',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onDismissed: (direction) async {
                                      // Remove the item from the data source.
                                      await DB().deleteDiarylog(data['title']);

                                      // Then show a snackbar.
                                      Get.snackbar("Success ",
                                          "Diary log deleted successfully.");
                                    },
                                    child: Card(
                                      margin: EdgeInsets.only(bottom: 14),
                                      elevation: 3,
                                      child: Container(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, bottom: 10),
                                          color: tappedIndex == index
                                              ? Color(0xff130A38)
                                              : Colors.white,
                                          child: ListTile(
                                              title: Center(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      data['title'],
                                                      style: GoogleFonts.dmSans(
                                                        fontSize:
                                                            McGyver.textSize(
                                                                context, 1.8),
                                                        color: tappedIndex ==
                                                                index
                                                            ? Colors.white
                                                            : Color(0xff130A38),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: McGyver.rsDoubleH(
                                                          context, 2),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          formatDate(
                                                              data['logDate']),
                                                          style: GoogleFonts
                                                              .dmSans(
                                                            fontSize: McGyver
                                                                .textSize(
                                                                    context,
                                                                    1.3),
                                                            color: tappedIndex ==
                                                                    index
                                                                ? Colors.white
                                                                : Color(
                                                                    0xff130A38),
                                                          ),
                                                        ),
                                                        Text(
                                                          data['logTime'],
                                                          style: GoogleFonts
                                                              .dmSans(
                                                            fontSize: McGyver
                                                                .textSize(
                                                                    context,
                                                                    1.3),
                                                            color: tappedIndex ==
                                                                    index
                                                                ? Colors.white
                                                                : Color(
                                                                    0xff130A38),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  tappedIndex = index;
                                                });
                                              })),
                                    ),
                                  );
                                })
                            : CircularProgressIndicator();
                      }),
                ),
              ),
              SizedBox(
                height: McGyver.rsDoubleH(context, 7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Types {
  const Types(this.id, this.name);
  final String name;
  final int id;
}
