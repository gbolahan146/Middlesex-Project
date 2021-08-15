import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/views/signup/signupViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupTextField extends StatefulWidget {
  final String text;
  final Widget icon;
  final bool obscure;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final SignupViewModel viewModel;
  final String Function(String) validator;
  final TextInputType keyboardType;

  const SignupTextField(
      {Key key,
      this.text,
      this.icon,
      this.controller,
      this.onChanged,
      this.obscure,
      this.viewModel,
      this.validator,
      this.keyboardType})
      : super(key: key);

  @override
  _SignupTextFieldState createState() => _SignupTextFieldState();
}

class _SignupTextFieldState extends State<SignupTextField> {
  bool visible = false;
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.text == 'Password' ? visible ? false : true : false,
      decoration: InputDecoration(
        border: InputBorder.none,
        
        filled: false,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff9d9d9d), width: 1.0),
          borderRadius: BorderRadius.circular(3),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff9d9d9d), width: 1.0),
          borderRadius: BorderRadius.circular(3),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff9d9d9d), width: 1.0),
          borderRadius: BorderRadius.circular(9),
        ),
        labelText: widget.text,
        suffixIcon: widget.text == 'Password'
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                child: visible
                    ? Icon(
                        Icons.visibility,
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                      ),
              )
            : SizedBox(),
        labelStyle: GoogleFonts.dmSans(
          fontSize: McGyver.textSize(context, 2.2),
          color: Color(0xff332f2f),
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
