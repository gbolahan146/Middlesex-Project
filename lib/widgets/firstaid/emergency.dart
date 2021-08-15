import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: McGyver.rsDoubleW(context, 3),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 18),
          ),
          child: GestureDetector(
            onTap: () => launch("tel://080002255372"),
            child: Text(
              'Call emergency assistance immediately\n(Dial 080002255372)',
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                fontSize: McGyver.textSize(context, 2.5),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          height: McGyver.rsDoubleW(context, 3),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 8,
              backgroundColor: Color.fromRGBO(110, 91, 186, 0.7),
            ),
            SizedBox(
              width: McGyver.rsDoubleW(context, 5),
            ),
            Expanded(
              child: Text(
                'If the person is not breathing',
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
              radius: 8,
              backgroundColor: Color.fromRGBO(110, 91, 186, 0.7),
            ),
            SizedBox(
              width: McGyver.rsDoubleW(context, 5),
            ),
            Expanded(
              child: Text(
                "If the person's asthma suddenly becomes worse or is not improving",
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
              radius: 8,
              backgroundColor: Color.fromRGBO(110, 91, 186, 0.7),
            ),
            SizedBox(
              width: McGyver.rsDoubleW(context, 5),
            ),
            Expanded(
              child: Text(
                "If the person is having an asthma attack and a reliever is not available",
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
              radius: 8,
              backgroundColor: Color.fromRGBO(110, 91, 186, 0.7),
            ),
            SizedBox(
              width: McGyver.rsDoubleW(context, 5),
            ),
            Expanded(
              child: Text(
                "If you are not sure its asthma",
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
              radius: 8,
              backgroundColor: Color.fromRGBO(110, 91, 186, 0.7),
            ),
            SizedBox(
              width: McGyver.rsDoubleW(context, 5),
            ),
            Expanded(
              child: Text(
                "If the person is known to have Anaphylaxis, follow their Anaphylaxis action plan, then give asthma first aid",
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
              radius: 8,
              backgroundColor: Color.fromRGBO(110, 91, 186, 0.7),
            ),
            SizedBox(
              width: McGyver.rsDoubleW(context, 5),
            ),
            Expanded(
              child: Text(
                "Proair or flovent is likely to harm if the person doesn't have asthma",
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
      ],
    );
  }
}
