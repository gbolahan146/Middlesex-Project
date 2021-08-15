import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/login/utils/login_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  final Function onPressed;
  final String text;

  const Buttons({
    Key key,
    this.onPressed,
    this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: McGyver.rsDoubleW(context, 95),
      child: MaterialButton(
          child: Text(
            text,
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: Colors.white,
              fontSize: McGyver.textSize(context, 3.4),
            ),
          ),
          height: McGyver.rsDoubleH(context, 9.7),
          color: darkblue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          onPressed: onPressed),
    );
  }
}
