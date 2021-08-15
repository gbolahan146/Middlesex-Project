import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RedAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: 'Medical alert!!!',
              style: GoogleFonts.dmSans(
                fontSize: McGyver.textSize(context, 2.4),
                color: Color(0xffffb127),
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Get help!',
                  style: GoogleFonts.dmSans(
                    fontSize: McGyver.textSize(context, 2.4),
                    color: Color(0xff130a38),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
        ),
        SizedBox(height: McGyver.rsDoubleW(context, 5)),
        Row(
          children: [
            Container(
              width: McGyver.rsDoubleW(context, 7),
              height: McGyver.rsDoubleW(context, 7),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 1, color: Color.fromRGBO(0, 0, 0, 0.5))),
              child: Icon(
                Icons.check,
                size: 15,
              ),
            ),
            SizedBox(width: McGyver.rsDoubleW(context, 5)),
            Expanded(
              child: RichText(
                text: TextSpan(
                    text: 'Take every 30 minutes',
                    style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.4),
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                      fontWeight: FontWeight.normal,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' 4',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.4),
                          color: Color(0xff130a38),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' inhs of',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.4),
                          color: Color.fromRGBO(0, 0, 0, 0.8),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: ' Proair HFA',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.4),
                          color: Color(0xff130a38),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
        SizedBox(height: McGyver.rsDoubleW(context, 5)),
        Row(
          children: [
            Container(
              width: McGyver.rsDoubleW(context, 7),
              height: McGyver.rsDoubleW(context, 7),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 1, color: Color.fromRGBO(0, 0, 0, 0.5))),
              child: Icon(
                Icons.check,
                size: 15,
              ),
            ),
            SizedBox(width: McGyver.rsDoubleW(context, 5)),
            Expanded(
              child: RichText(
                text: TextSpan(
                    text: 'Click on the',
                    style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.4),
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                      fontWeight: FontWeight.normal,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Emergency button',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.4),
                          color: Color(0xff130a38),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
        SizedBox(height: McGyver.rsDoubleW(context, 5)),
        Row(
          children: [
            Container(
              width: McGyver.rsDoubleW(context, 7),
              height: McGyver.rsDoubleW(context, 7),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 1, color: Color.fromRGBO(0, 0, 0, 0.5))),
              child: Icon(
                Icons.check,
                size: 15,
              ),
            ),
            SizedBox(width: McGyver.rsDoubleW(context, 5)),
            Expanded(
              child: RichText(
                text: TextSpan(
                    text: 'Call ',
                    style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.4),
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                      fontWeight: FontWeight.normal,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' +234 815 555 4459',
                        style: GoogleFonts.dmSans(
                          decoration: TextDecoration.underline,
                          fontSize: McGyver.textSize(context, 2.4),
                          color: Colors.blue[800],
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      TextSpan(
                        text: ' or',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.4),
                          color: Color.fromRGBO(0, 0, 0, 0.8),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: ' +234 803 576 6767',
                        style: GoogleFonts.dmSans(
                          decoration: TextDecoration.underline,
                          fontSize: McGyver.textSize(context, 2.4),
                          color: Colors.blue[800],
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      TextSpan(
                        text: ' or',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.4),
                          color: Color.fromRGBO(0, 0, 0, 0.8),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: ' +234 810 994 2450',
                        style: GoogleFonts.dmSans(
                          decoration: TextDecoration.underline,
                          fontSize: McGyver.textSize(context, 2.4),
                          color: Colors.blue[800],
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
        SizedBox(height: McGyver.rsDoubleW(context, 5)),
      ],
    );
  }
}
