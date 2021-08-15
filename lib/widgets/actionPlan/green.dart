import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreenAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: 'Prevent',
              style: GoogleFonts.dmSans(
                fontSize: McGyver.textSize(context, 2.4),
                color: Color(0xff1ec82f),
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' asthma symptoms everyday:',
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
                    text: 'Take my',
                    style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.4),
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                      fontWeight: FontWeight.normal,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Flovent HFA',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.4),
                          color: Color(0xff130a38),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' everyday',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.4),
                          color: Color.fromRGBO(0, 0, 0, 0.8),
                          fontWeight: FontWeight.normal,
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
                    text: 'Before exercise, take',
                    style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.4),
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                      fontWeight: FontWeight.normal,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' 1',
                        style: GoogleFonts.dmSans(
                          fontSize: McGyver.textSize(context, 2.4),
                          color: Color(0xff130a38),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' inh of',
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
              child: Text(
                'Avoid things that make asthma worse',
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2.4),
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
