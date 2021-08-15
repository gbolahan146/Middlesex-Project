import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/actionPlan/actionPlanViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RedButton extends StatelessWidget {
  final ActionPlanViewModel viewModel;

  const RedButton({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        MaterialButton(
          elevation: 0,
          minWidth: width,
          height: McGyver.rsDoubleH(context, 8),
          color: Color(0xffdd3001),
          onPressed: () => viewModel.setRedButton(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                viewModel.redButton
                    ? 'GET HELP IMMEDIATELY'
                    : 'View possible symptoms',
                style: GoogleFonts.dmSans(
                  fontSize: McGyver.textSize(context, 2.3),
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              )
            ],
          ),
        ),
        Visibility(
          visible: viewModel.redButton,
          child: Container(
            width: width,
            height: McGyver.rsDoubleH(context, 60),
            color: Color(0xffdd3001),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: McGyver.rsDoubleW(context, 3),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: McGyver.rsDoubleW(context, 5),
                      ),
                      Expanded(
                        child: Text(
                          'Difficulty in breathing, coughing, wheezing, not helped with medication',
                          style: GoogleFonts.dmSans(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
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
                        radius: 5,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: McGyver.rsDoubleW(context, 5),
                      ),
                      Expanded(
                        child: Text(
                          "Trouble walking or talking due to shortness of breath or if lips or fingernails are gray or blue",
                          maxLines: 5,
                          style: GoogleFonts.dmSans(
                              fontSize: McGyver.textSize(context, 2.4),
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
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
                        radius: 5,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: McGyver.rsDoubleW(context, 5),
                      ),
                      Expanded(
                        child: Text(
                          "Not responding to quick rescue medication",
                          maxLines: 5,
                          style: GoogleFonts.dmSans(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
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
                        radius: 5,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: McGyver.rsDoubleW(context, 5),
                      ),
                      Expanded(
                        child: Text(
                          "For child, if kin sucked in around neck and ribs during breaths or child doesn't respond normally",
                          maxLines: 5,
                          style: GoogleFonts.dmSans(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
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
                        radius: 5,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: McGyver.rsDoubleW(context, 5),
                      ),
                      Expanded(
                        child: Text(
                          "Peak flow less than 50%",
                          maxLines: 5,
                          style: GoogleFonts.dmSans(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
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
                        radius: 5,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: McGyver.rsDoubleW(context, 5),
                      ),
                      Expanded(
                        child: Text(
                          "CALL YOUR DOCTOR NOW!!!",
                          maxLines: 5,
                          style: GoogleFonts.dmSans(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
