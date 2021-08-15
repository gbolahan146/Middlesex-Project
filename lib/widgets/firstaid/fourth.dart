import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FourthInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 5)),
        child: Column(
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
                    "Say 'ambulance' and that someone is having an attack",
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
                    "Keep giving 4 separate puffs every 4 minutes until emergency assitance arrives",
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
                    "(OR 1 dose of Bricanyl or Symbicort every 4 minutes-up to 3 more doses of symbicort)",
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
        ),
      ),
    );
  }
}
