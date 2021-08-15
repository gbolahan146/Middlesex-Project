library login;

import 'package:asthma_management/core/routes/route_names.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/home/homeView.dart';
import 'package:asthma_management/views/login/loginViewModel.dart';
import 'package:asthma_management/views/login/utils/login_utils.dart';
import 'package:asthma_management/views/login/validators.dart';
import 'package:asthma_management/views/profile2/profile2View.dart';
import 'package:asthma_management/views/signup/colors.dart';
import 'package:asthma_management/views/signup/signupView.dart';
import 'package:asthma_management/widgets/login/button.dart';
import 'package:asthma_management/widgets/login/textfiels.dart';
import 'package:asthma_management/widgets/login/texts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
part 'loginMobile.dart';
part 'loginTablet.dart';
part 'loginDesktop.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    return ScreenTypeLayout(
      mobile: LogInMobile(
        loginViewModel: viewModel,
      ),
      tablet: LogInTablet(
        loginViewModel: viewModel,
      ),
      desktop: LogInDesktop(
        loginViewModel: viewModel,
      ),
    );
  }
}
