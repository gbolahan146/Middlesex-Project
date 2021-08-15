import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/core/services/validators.dart';
import 'package:asthma_management/views/profile1/profile1.dart';
import 'package:asthma_management/views/signup/colors.dart';
import 'package:asthma_management/widgets/signup_textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends HookWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final fullnameController = useTextEditingController();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    // color: Colors.red,
                    width: McGyver.rsDoubleW(context, 70),
                    height: McGyver.rsDoubleH(context, 30),
                    child: SvgPicture.asset(
                      'assets/images/signup.svg',
                      fit: BoxFit.contain,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ),
                SizedBox(height: McGyver.rsDoubleH(context, 6)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 7)),
                  child: Text(
                    'Welcome!',
                    style: GoogleFonts.dmSans(
                        color: welcomeTextColor,
                        fontSize: McGyver.textSize(context, 3.4),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 7)),
                  child: Text(
                    'Managing your asthma doesn’t have to be so hard, Enter your details to continue.',
                    style: GoogleFonts.dmSans(
                        color: Color.fromRGBO(19, 10, 56, 0.8),
                        fontSize: McGyver.textSize(context, 2.2),
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: McGyver.rsDoubleH(context, 6)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 7)),
                  child: SignupTextField(
                    controller: usernameController,
                    validator: UsernameValidator.validate,
                    keyboardType: TextInputType.text,
                    text: 'Username',
                    obscure: false,
                  ),
                ),
                SizedBox(height: McGyver.rsDoubleH(context, 4)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 7)),
                  child: SignupTextField(
                    controller: fullnameController,
                    validator: UsernameValidator.validate,
                    keyboardType: TextInputType.text,
                    text: 'Full Name',
                    obscure: false,
                  ),
                ),
                SizedBox(height: McGyver.rsDoubleH(context, 4)),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: McGyver.rsDoubleW(context, 7)),
                    child: MaterialButton(
                      minWidth: width,
                      height: McGyver.rsDoubleH(context, 9),
                      color: buttonColor,
                      onPressed: () async {
                        final form = formKey.currentState;
                        if (form.validate()) {
                          form.save();
                          final preferences =
                              await SharedPreferences.getInstance();
                          await preferences.setString(
                              'name', usernameController.text);
                              await preferences.setString(
                              'fullname', fullnameController.text);
                          Get.off(ProfilePage1());
                        }
                      },
                      child: Text(
                        'Continue',
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: McGyver.textSize(context, 2.5)),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
