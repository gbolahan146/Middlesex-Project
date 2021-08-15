part of signup;

class SignupViewTablet extends StatefulHookWidget {
  final SignupViewModel viewModel;

  const SignupViewTablet({Key key, this.viewModel}) : super(key: key);

  @override
  _SignupViewTabletState createState() => _SignupViewTabletState();
}

class _SignupViewTabletState extends State<SignupViewTablet> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 7)),
                  child: Text(
                    'Welcome!',
                    style: GoogleFonts.dmSans(
                        color: welcomeTextColor,
                        fontSize: McGyver.textSize(context, 3),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 7)),
                  child: Text(
                    'Signup to get started.',
                    style: GoogleFonts.dmSans(
                        color: Color.fromRGBO(19, 10, 56, 0.8),
                        fontSize: McGyver.textSize(context, 2),
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: McGyver.rsDoubleH(context, 8)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 7)),
                  child: SignupTextField(
                    controller: usernameController,
                    viewModel: widget.viewModel,
                    validator: UsernameValidator.validate,
                    keyboardType: TextInputType.text,
                    text: 'Name',
                    obscure: false,
                  ),
                ),
                SizedBox(height: McGyver.rsDoubleH(context, 4)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 7)),
                  child: SignupTextField(
                    controller: emailController,
                    validator: EmailValidator.validate,
                    keyboardType: TextInputType.emailAddress,
                    viewModel: widget.viewModel,
                    text: 'Email Address',
                    obscure: false,
                  ),
                ),
                SizedBox(height: McGyver.rsDoubleH(context, 4)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 7)),
                  child: SignupTextField(
                    controller: passwordController,
                    viewModel: widget.viewModel,
                    validator: PasswordValidator.validate,
                    text: 'Password',
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(height: McGyver.rsDoubleH(context, 4)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 7)),
                  child: widget.viewModel.buttonState == ButtonState.Idle
                      ? MaterialButton(
                          minWidth: width,
                          height: McGyver.rsDoubleH(context, 9),
                          color: buttonColor,
                          onPressed: () {

                            final form = formKey.currentState;
                            if (form.validate()) {

                              form.save();
                              widget.viewModel
                                  .signup(
                                      usernameController.text,
                                      emailController.text,
                                      passwordController.text)
                                  .then((value) {
                                if (value != null) {
                                  Future.delayed(Duration(seconds: 3), () {
                                    Get.offAll(Home());
                                  });
                                }
                              });
                            }
                          },
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: McGyver.textSize(context, 2.5)),
                          ),
                        )
                      : SpinKitThreeBounce(
                          color: buttonColor,
                          size: 30,
                        ),
                ),
                SizedBox(height: McGyver.rsDoubleH(context, 4)),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'I am an existing user,',
                        style: GoogleFonts.dmSans(
                            fontSize: McGyver.textSize(context, 2),
                            color: Color(0xff332f2f)),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign in',
                              style: GoogleFonts.dmSans(
                                  fontSize: McGyver.textSize(context, 2.4),
                                  fontWeight: FontWeight.bold,
                                  color: welcomeTextColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //Navigate to signin screen
                                  Get.to(LoginView());
                                })
                        ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
