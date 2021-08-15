library home;

import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


part 'homeDesktop.dart';
part 'homeMobile.dart';
part 'homeTablet.dart';



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //responsive builder for various screen types.. Its optional.
    return ScreenTypeLayout(
      mobile: HomeViewMobile(),
      tablet: HomeViewTablet(),
      desktop: HomeViewDesktop(),
    );
  }
}
