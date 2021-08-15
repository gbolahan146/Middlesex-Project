import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/actionPlan/actionPlanViewModel.dart';
import 'package:asthma_management/widgets/actionPlan/green.dart';
import 'package:asthma_management/widgets/actionPlan/greenButton.dart';
import 'package:asthma_management/widgets/actionPlan/red.dart';
import 'package:asthma_management/widgets/actionPlan/redButton.dart';
import 'package:asthma_management/widgets/actionPlan/yellow.dart';
import 'package:asthma_management/widgets/actionPlan/yellowButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActionPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ActionPlanViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Actions Plan',
          style: GoogleFonts.dmSans(
            fontSize: McGyver.textSize(context, 2.9),
            color: Color(0xff130a38),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () => viewModel.setGreenZone(),
                child: Text('Green zone'),
                color: viewModel.zones[0] == true
                    ? Color(0xff1ec82f)
                    : Color.fromRGBO(196, 196, 196, 0.3),
              ),
              FlatButton(
                onPressed: () => viewModel.setYellowZone(),
                child: Text(
                  'Yellow zone',
                  style: GoogleFonts.dmSans(
                    fontSize: McGyver.textSize(context, 2.2),
                    color: Color(0xff130a38),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: viewModel.zones[1] == true
                    ? Color(0xffffb127)
                    : Color.fromRGBO(196, 196, 196, 0.3),
              ),
              FlatButton(
                onPressed: () => viewModel.setRedZone(),
                child: Text('Red zone'),
                color: viewModel.zones[2] == true
                    ? Color(0xffdd300a)
                    : Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ],
          ),
          SizedBox(
            height: McGyver.rsDoubleH(context, 3),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 7),
            ),
            child: viewModel.zones[1] == true
                ? YellowAction()
                : viewModel.zones[2] == true
                    ? RedAction()
                    : GreenAction(),
          ),
          SizedBox(
            height: McGyver.rsDoubleH(context, 5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 7),
            ),
            child: viewModel.zones[1] == true
                ? YellowButton(
                    viewModel: viewModel,
                  )
                : viewModel.zones[2] == true
                    ? RedButton(
                        viewModel: viewModel,
                      )
                    : GreenButton(
                        viewModel: viewModel,
                      ),
          ),
          SizedBox(
            height: McGyver.rsDoubleH(context, 5),
          ),
        ],
      ),
    );
  }
}
