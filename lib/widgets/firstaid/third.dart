import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdInfo extends StatelessWidget {
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
                'If there is no improvement, give 4 seperate puffs of proair or flovent reliever as above',
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
                "(OR give 1 more dose of Bricanyl or Symbicort inhaler)",
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
