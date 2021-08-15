import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/actionPlan/actionPlanViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreenButton extends StatelessWidget {
  final ActionPlanViewModel viewModel;

  const GreenButton({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        MaterialButton(
          elevation: 0,
          minWidth: width,
          height: McGyver.rsDoubleH(context, 8),
          color: Color(0xff1ec82f),
          onPressed: () => viewModel.setGreenButton(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'View possible progress',
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
          visible: viewModel.greenButton,
          child: Container(
            width: width,
            height: McGyver.rsDoubleH(context, 25),
            color: Color(0xff1ec82f),
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
                          'You are doing well',
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
                          "Peak flow 80-100%",
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
                          "You have been very consistent with your medication",
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
                          "Enjoy your day.",
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
