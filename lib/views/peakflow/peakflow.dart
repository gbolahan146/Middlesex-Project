import 'package:asthma_management/core/services/db.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/addpeakflow/addPeak.dart';
import 'package:asthma_management/views/chart/charts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PeakFlow extends StatefulWidget {
  @override
  _PeakFlowState createState() => _PeakFlowState();
}

class _PeakFlowState extends State<PeakFlow> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Your Peak Flow ',
          style: GoogleFonts.dmSans(
            fontSize: McGyver.textSize(context, 3.0),
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: FutureBuilder<List>(
          future: DB().getUser(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            return snapshot.connectionState == ConnectionState.done
                ? snapshot.hasData
                    ? ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: McGyver.rsDoubleW(context, 5)),
                                child: Text('Peak Flow chart',
                                    style: GoogleFonts.dmSans(
                                        fontSize:
                                            McGyver.textSize(context, 2.5),
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF130A38))),
                              ),
                              SizedBox(height: McGyver.rsDoubleH(context, 4)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: McGyver.rsDoubleW(context, 5)),
                                child: LineChartSample1(),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: McGyver.rsDoubleW(context, 5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                              ),
                              SizedBox(height: McGyver.rsDoubleH(context, 4)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: McGyver.rsDoubleW(context, 5)),
                                child: Material(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color(0xff130A38),
                                  child: MaterialButton(
                                    padding: EdgeInsets.all(10),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Column(children: <Widget>[
                                          SvgPicture.asset(
                                              'assets/images/printer1.svg')
                                        ]),
                                        SizedBox(
                                          width: McGyver.rsDoubleW(context, 2),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            RichText(
                                              text: TextSpan(
                                                text:
                                                    'Your peak flow level is ',
                                                style: GoogleFonts.dmSans(
                                                    textStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            McGyver.textSize(
                                                                context, 2)),
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${data[0]['peakflow']} L/MIN ',
                                                    style: GoogleFonts.dmSans(
                                                        textStyle: TextStyle(
                                                            color: Color(
                                                                0xff9de3d1),
                                                            fontSize: McGyver
                                                                .textSize(
                                                                    context,
                                                                    2)),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: McGyver.rsDoubleH(context, 5)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: McGyver.rsDoubleW(context, 5)),
                                child: Row(
                                  children: [
                                    Text(
                                      'Peak Flow meter',
                                      style: GoogleFonts.dmSans(
                                          textStyle: TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: McGyver.textSize(
                                                  context, 2.3)),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: McGyver.rsDoubleH(context, 5)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: McGyver.rsDoubleW(context, 10)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Color(0xffe9e9e9)),
                                  )),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/peakInhaler.png',
                                            scale: 4,
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Text(
                                          'The Peak flow meter measures  your peak expiratory flow (PEF)  and helps monitor respiratory  conditions, such as asthma',
                                          style: GoogleFonts.dmSans(
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.w600,
                                              fontSize: McGyver.textSize(
                                                  context, 1.9)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: McGyver.rsDoubleH(context, 5)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: McGyver.rsDoubleW(context, 10)),
                                child: Material(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color(0xff130A38),
                                  child: MaterialButton(
                                    padding: EdgeInsets.all(10),
                                    onPressed: () {
                                      _awaitReturnValueFromSecondScreen(
                                          context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              "Measure now",
                                              style: GoogleFonts.dmSans(
                                                  textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          McGyver.textSize(
                                                              context, 2.7)),
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: McGyver.rsDoubleH(context, 5)),
                            ],
                          ),
                        ],
                      )
                    : SizedBox()
                : SizedBox();
          }),
    );
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddPeakFlow(),
        ));

    setState(() {
      text = result;
    });
  }
}
