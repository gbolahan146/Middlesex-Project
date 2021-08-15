import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/core/services/statefulWrapper.dart';
import 'package:asthma_management/views/chart/charts.dart';
import 'package:asthma_management/views/emergency/emergencyPopUp.dart';
import 'package:asthma_management/views/homepage/homePageViewModel.dart';
import 'package:asthma_management/views/peakflow/peakflow.dart';
import 'package:asthma_management/views/reminders/remiders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomePageViewModel>(context);
    return StatefulWrapper(
      onInit: () {
        viewModel.getName();
        viewModel.greeting();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: ListView(
            children: <Widget>[
              SizedBox(height: McGyver.rsDoubleH(context, 3)),
              Text(
                viewModel.greetings,
                style: GoogleFonts.dmSans(
                    fontSize: McGyver.textSize(context, 1.8),
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF130A38)),
              ),
              SizedBox(height: McGyver.rsDoubleH(context, 0.5)),
              Text(viewModel.name ?? '',
                  style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.7),
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF130A38))),
              SizedBox(height: McGyver.rsDoubleH(context, 2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: McGyver.rsDoubleH(context, 6),
                    child: Material(
                      borderRadius: BorderRadius.circular(2),
                      color: Color(0xffF3444E),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        padding: EdgeInsets.only(left: 14, right: 13, top: 6),
                        onPressed: () => Get.to(EmergencyPopUp()),
                        child: Container(
                          height: McGyver.rsDoubleH(context, 4),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Emergency",
                                  style: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              McGyver.textSize(context, 1.8)),
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: McGyver.rsDoubleH(context, 2)),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                      )
                    ],
                    border: Border.all(
                      color: Color(0xffFFFFFF),
                    )),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: McGyver.rsDoubleW(context, 2),
                    ),
                    Container(
                        height: McGyver.rsDoubleH(context, 5),
                        width: McGyver.rsDoubleW(context, 4.5),
                        child: Image(
                          image: AssetImage(
                            'assets/images/alarm.png',
                          ),
                        )),
                    SizedBox(
                      width: McGyver.rsDoubleW(context, 3),
                    ),
                    Expanded(
                      child: Text('Have you taken your medications today?',
                          style: GoogleFonts.dmSans(
                              fontSize: McGyver.textSize(context, 1.8),
                              color: Color(0xffF3444E),
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: McGyver.rsDoubleH(context, 3.5)),
              Text('Medication reminder',
                  style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.5),
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF130A38))),
              SizedBox(height: McGyver.rsDoubleH(context, 3.0)),
              GestureDetector(
                onTap: () => Get.to(() => Reminders()),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Color(0xff130A38),
                    border: Border.all(
                      color: Color(0xff424242),
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: McGyver.rsDoubleW(context, 6),
                          ),
                          Container(
                              height: McGyver.rsDoubleH(context, 6),
                              width: McGyver.rsDoubleW(context, 9),
                              child: Image(
                                image: AssetImage(
                                  'assets/images/maininhaler.png',
                                ),
                              )),
                          SizedBox(
                            width: McGyver.rsDoubleW(context, 6),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FittedBox(
                                child: Text('Click to set reminder',
                                    style: GoogleFonts.dmSans(
                                        fontSize: McGyver.textSize(context, 2),
                                        color: Color(0xffffffff),
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(
                                height: McGyver.rsDoubleH(context, 1),
                              ),
                              Text('Weekly/daily',
                                  style: GoogleFonts.dmSans(
                                      fontSize: McGyver.textSize(context, 1.8),
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          SizedBox(
                            width: McGyver.rsDoubleW(context, 6),
                          ),
                        ],
                      ),
                      Container(
                          height: McGyver.rsDoubleH(context, 3),
                          width: McGyver.rsDoubleW(context, 69),
                          child: Image(
                            image: AssetImage(
                              'assets/images/line.png',
                            ),
                          )),
                      Row(
                        children: <Widget>[
                          SizedBox(width: McGyver.rsDoubleW(context, 10)),
                          GestureDetector(
                            child: Text('Add',
                                style: GoogleFonts.dmSans(
                                    fontSize: McGyver.textSize(context, 2.1),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(width: McGyver.rsDoubleW(context, 12)),
                          Container(
                              width: McGyver.rsDoubleW(context, 2.5),
                              child: Image(
                                image: AssetImage('assets/images/close.png'),
                              )),
                          SizedBox(width: McGyver.rsDoubleW(context, 2)),
                          Text('Delete',
                              style: GoogleFonts.dmSans(
                                  fontSize: McGyver.textSize(context, 2.1),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: McGyver.rsDoubleW(context, 12)),
                          Container(
                              width: McGyver.rsDoubleW(context, 2.5),
                              child: Image(
                                image: AssetImage(
                                  'assets/images/correct.png',
                                ),
                              )),
                          SizedBox(width: McGyver.rsDoubleW(context, 2)),
                          Text('Remind',
                              style: GoogleFonts.dmSans(
                                  fontSize: McGyver.textSize(context, 2.1),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Peak Flow chart',
                  style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.5),
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF130A38))),
              SizedBox(height: 7),
              GestureDetector(
                onTap: () => Get.to(PeakFlow()),
                child: Text('Your weekly airflow progress',
                    style: GoogleFonts.dmSans(
                        fontSize: McGyver.textSize(context, 2.3),
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF30159c))),
              ),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () => Get.to(PeakFlow()), child: LineChartSample1()),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xffef1b1b),
                        radius: 5,
                      ),
                      SizedBox(width: 3),
                      Text(
                        'Red Zone',
                        style: GoogleFonts.dmSans(),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xffffc144),
                        radius: 5,
                      ),
                      SizedBox(width: 3),
                      Text(
                        'Yellow Zone',
                        style: GoogleFonts.dmSans(),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xff41e717),
                        radius: 5,
                      ),
                      SizedBox(width: 3),
                      Text(
                        'Green Zone',
                        style: GoogleFonts.dmSans(),
                      )
                    ],
                  ),
                ],
              ),
              // Row(
              //   children: <Widget>[
              //     GestureDetector(
              //       onTap: () => Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => Reminders())),
              //       child: MyCards(
              //         heading: "Reminder",
              //         color: Colors.white,
              //         image: 'assets/images/reminder.png',
              //         tap: null,
              //       ),
              //     ),
              //     Spacer(),
              //     MyCards(
              //       heading: "Asthma diary",
              //       color: Colors.white,
              //       image: 'assets/images/notebook.png',
              //       tap: null,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCards extends StatelessWidget {
  final String heading;
  final String image;
  final Color color;
  final Function tap;
  const MyCards({
    Key key,
    this.heading,
    this.image,
    this.color,
    this.tap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: tap,
      child: Card(
        elevation: 1,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, left: 25, right: 28),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 26.0),
                      child: Container(
                        width: McGyver.rsDoubleW(context, 8),
                        child: Image(
                            image: AssetImage(image),
                            width: McGyver.rsDoubleW(context, 5)),
                      ),
                    ),
                    Center(
                      child: Text(
                        heading,
                        style: TextStyle(
                          fontSize: McGyver.textSize(context, 2.3),
                          fontWeight: FontWeight.normal,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: McGyver.rsDoubleH(context, 2),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
