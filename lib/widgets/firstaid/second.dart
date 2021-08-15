import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: McGyver.rsDoubleW(context, 3),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 6,
              backgroundColor: Color.fromRGBO(110, 91, 186, 0.7),
            ),
            SizedBox(
              width: McGyver.rsDoubleW(context, 5),
            ),
            Expanded(
              child: Text(
                'Shake puffer',
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2.4),
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: McGyver.rsDoubleW(context, 3),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 6,
              backgroundColor: Color.fromRGBO(110, 91, 186, 0.7),
            ),
            SizedBox(
              width: McGyver.rsDoubleW(context, 5),
            ),
            Expanded(
              child: Text(
                "Put 1 puff into spacer",
                maxLines: 5,
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2.4),
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: McGyver.rsDoubleW(context, 3),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 6,
              backgroundColor: Color.fromRGBO(110, 91, 186, 0.7),
            ),
            SizedBox(
              width: McGyver.rsDoubleW(context, 5),
            ),
            Expanded(
              child: Text(
                "Take 4 breath from spacer",
                maxLines: 5,
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2.4),
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: McGyver.rsDoubleW(context, 3),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 6,
              backgroundColor: Color.fromRGBO(110, 91, 186, 0.7),
            ),
            SizedBox(
              width: McGyver.rsDoubleW(context, 5),
            ),
            Expanded(
              child: Text(
                "Repeat until 4 puffs have been taken",
                maxLines: 5,
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2.4),
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: McGyver.rsDoubleW(context, 3),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 6,
              backgroundColor: Color.fromRGBO(110, 91, 186, 0.7),
            ),
            SizedBox(
              width: McGyver.rsDoubleW(context, 5),
            ),
            Expanded(
              child: Text(
                "Remember\nShake, 1 puff, 4 breaths",
                maxLines: 5,
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2.4),
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: McGyver.rsDoubleW(context, 3),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 6,
              backgroundColor: Color.fromRGBO(110, 91, 186, 0.7),
            ),
            SizedBox(
              width: McGyver.rsDoubleW(context, 5),
            ),
            Expanded(
              child: Text(
                "OR Give 2 separate doses of bricanyl inhaler (age 6 and above) or a symbicort inhaler (over 12)",
                maxLines: 5,
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2.4),
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: McGyver.rsDoubleW(context, 3),
        ),
      ],
    );
  }
}
