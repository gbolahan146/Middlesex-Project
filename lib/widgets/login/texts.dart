import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;
  const Texts({
    Key key,
    this.text,
    this.textStyle,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}

class RichTexts extends StatelessWidget {
  final String text;
  final String extraText;
  final TextStyle textStyle;
  final TapGestureRecognizer tapGestureRecognizer;
  final TextStyle extraTextStyle;
  final TextAlign textAlign;
  const RichTexts({
    Key key,
    this.text,
    this.textStyle,
    this.textAlign,
    this.extraText,
    this.extraTextStyle,
    this.tapGestureRecognizer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(text: text, style: textStyle, children: <TextSpan>[
        TextSpan(
          text: extraText,
          style: extraTextStyle,
          recognizer: tapGestureRecognizer,
        ),
      ]),
    );
  }
}
