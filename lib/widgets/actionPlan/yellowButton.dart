import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/actionPlan/actionPlanViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YellowButton extends StatelessWidget {
  final ActionPlanViewModel viewModel;

  const YellowButton({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        MaterialButton(
          elevation: 0,
          minWidth: width,
          height: McGyver.rsDoubleH(context, 8),
          color: Color(0xffffb127),
          onPressed: () => viewModel.setYellowButton(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                viewModel.yellowButton
                    ? 'GETTING WORSE'
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
          visible: viewModel.yellowButton,
          child: Container(
            width: width,
            height: McGyver.rsDoubleH(context, 30),
            color: Color(0xffffb127),
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
                          'Cough, wheeze, chest tightness, shortness of breath',
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
                          "Symptoms with daily activities",
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
                          "Waking at night due to asthma symptoms",
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
                          "Peak flow 50-100%",
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
