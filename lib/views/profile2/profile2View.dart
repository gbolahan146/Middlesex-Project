library profile2;

import 'package:asthma_management/core/models/userModel.dart';
import 'package:asthma_management/core/services/db.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/bottombar/bottombar.dart';
import 'package:asthma_management/views/login/loginViewModel.dart';
import 'package:asthma_management/views/profile2/profile2ViewModel.dart';
import 'package:asthma_management/views/signup/colors.dart';
import 'package:asthma_management/widgets/signup_textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile2Desktop.dart';
part 'profile2Mobile.dart';
part 'profile2Tablet.dart';

class Profile2 extends HookWidget {
  final String country;
  final DateTime dob;
  final String gender;
  final String imagePath;

  Profile2({
    this.country,
    this.imagePath,
    this.dob,
    this.gender,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<Profile2ViewModel>(context);
    return ScreenTypeLayout(
      mobile: Profile2ViewMobile(
        viewModel: viewModel,
        country: country,
        gender: gender,
        imagePath: imagePath,
        dob: dob,
      ),
      tablet: Profile2ViewTablet(
        viewModel: viewModel,
        country: country,
        gender: gender,
        imagePath: imagePath,
        dob: dob,
      ),
      desktop: Profile2ViewDesktop(
        viewModel: viewModel,
        country: country,
        gender: gender,
        imagePath: imagePath,
        dob: dob,
      ),
    );
  }
}
