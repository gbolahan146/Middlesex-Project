import 'dart:ui';

import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:flutter/material.dart';

class Raven extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff646464),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Text('Tickets', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 0,
            spacing: 1,
            children: [
              Cards1(),
              Cards1(),
              Cards1(),
              Cards1(),
              Cards1(),
              Cards1(),
              Cards1(),
              Cards1(),
            ],
          ),
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: McGyver.rsDoubleW(context, 48),
      height: McGyver.rsDoubleH(context, 40),
      // color: Colors.red,
      decoration: BoxDecoration(
        // color: Colors.red,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/Vector 18 (1).png',
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 2),
            vertical: McGyver.rsDoubleH(context, 4)),
        child: Column(
          children: [
            SizedBox(
              height: McGyver.rsDoubleH(context, 1),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.star,
                color: Colors.purple,
                size: 20,
              ),
            ),
            
            Text(
              'Make up Masterclass w/the best in the industry',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: McGyver.textSize(context, 2)),
            ),
            
            Divider(
              color: Colors.white30,
            ),
            // SizedBox(
            //   height: McGyver.rsDoubleH(context, 1),
            // ),
            Row(
              children: [
                // Icon(
                //   Icons.calendar_view_day,
                //   color: Colors.white30,
                // ),
                Text(
                  'May 12, 2020',
                  style: TextStyle(
                      color: Colors.white30,
                      fontSize: McGyver.textSize(context, 2)),
                ),
                Spacer(),
                Text(
                  '11:00pm',
                  style: TextStyle(
                      color: Colors.white30,
                      fontSize: McGyver.textSize(context, 2)),
                ),
              ],
            ),
            // SizedBox(
            //   height: McGyver.rsDoubleH(context, 1),
            // ),
            Divider(
              color: Colors.white30,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '2 Tickets available',
                style: TextStyle(
                    color: Colors.white30,
                    fontSize: McGyver.textSize(context, 1.7)),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '#7.7',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: McGyver.textSize(context, 1.7),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 10),
              ),
              child: Divider(
                color: Colors.white30,
              ),
            ),
            SizedBox(
              height: McGyver.rsDoubleH(context, 1),
            ),
            Align(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: McGyver.rsDoubleW(context, 6),
                      height: McGyver.rsDoubleW(context, 6),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '    Jerome Alash',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: McGyver.textSize(context, 1.8),
                          ),
                        ),
                        Text(
                          '     Creator',
                          style: TextStyle(
                            color: Colors.white30,
                            fontSize: McGyver.textSize(context, 1.8),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class Cards1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: McGyver.rsDoubleW(context, 48),
      height: McGyver.rsDoubleH(context, 38),
      // color: Colors.red,
      decoration: BoxDecoration(
        // color: Colors.red,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/Vector 18 (1).png',
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 4),
            vertical: McGyver.rsDoubleH(context, 4)),
        child: Column(
          children: [
            SizedBox(
              height: McGyver.rsDoubleH(context, 1),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.star,
                color: Colors.purple,
                size: 20,
              ),
            ),
             SizedBox(
              height: McGyver.rsDoubleH(context, 1),
            ),

            Text(
              'Make up Masterclass w/the best in the industry',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: McGyver.textSize(context, 2)),
            ),
             SizedBox(
              height: McGyver.rsDoubleH(context, 1),
            ),

            Divider(
              color: Colors.white30,
            ),
            SizedBox(
              height: McGyver.rsDoubleH(context, 1),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_view_day,
                  color: Colors.white30,
                ),
                Text(
                  'May 12, 2020',
                  style: TextStyle(
                      color: Colors.white30,
                      fontSize: McGyver.textSize(context, 2)),
                ),
                // Spacer(),
                // Text(
                //   '11:00pm',
                //   style: TextStyle(
                //       color: Colors.white30,
                //       fontSize: McGyver.textSize(context, 2)),
                // ),
              ],
            ),
            SizedBox(
              height: McGyver.rsDoubleH(context, 1),
            ),
            Divider(
              color: Colors.white30,
            ),
             SizedBox(
              height: McGyver.rsDoubleH(context, 1),
            ),

            Row(
              children: [
                Text(
                  '#7.7',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: McGyver.textSize(context, 1.7),
                  ),
                ),
                Spacer(),
                Text(
                  '11:00pm',
                  style: TextStyle(
                    color: Colors.white30,
                    fontSize: McGyver.textSize(context, 1.7),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.white30,
            ),
            SizedBox(
              height: McGyver.rsDoubleH(context, 1),
            ),
          ],
        ),
      ),
    );
  }
}
