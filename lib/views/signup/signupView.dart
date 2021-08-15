library signup;

import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/core/services/validators.dart';
import 'package:asthma_management/views/home/homeView.dart';
import 'package:asthma_management/views/login/login_view.dart';

import 'package:asthma_management/views/signup/colors.dart';
import 'package:asthma_management/views/signup/signupViewModel.dart';
import 'package:asthma_management/widgets/signup_textfield/textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'signupDesktop.dart';
part 'signupMobile.dart';
part 'signupTablet.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignupViewModel>(context);
    return ScreenTypeLayout(
      mobile: SignupViewMobile(
        viewModel: viewModel,
      ),
      tablet: SignupViewTablet(
        viewModel: viewModel,
      ),
      desktop: SignupViewDesktop(
        viewModel: viewModel,
      ),
    );
  }
}
