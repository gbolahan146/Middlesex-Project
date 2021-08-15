part of profile2;

class Profile2ViewMobile extends HookWidget {
  final Profile2ViewModel viewModel;
  final String country;
  final DateTime dob;
  final String gender;
  final String imagePath;

  Profile2ViewMobile({
    Key key,
    this.country,
    this.dob,
    this.imagePath,
    this.gender,
    this.viewModel,
  }) : super(key: key);

  String name;
  String fullname;

  Future<void> getName() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('username');
    fullname = prefs.getString('fullname');
  }

  @override
  Widget build(BuildContext context) {
    final ageController = useTextEditingController();
    final heightController = useTextEditingController();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: McGyver.rsDoubleW(context, 5)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: McGyver.rsDoubleH(context, 10)),
                  Center(
                    child: Text(
                      'Complete Your profile',
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff130a38),
                          fontSize: McGyver.textSize(context, 2.6)),
                    ),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 2)),
                  Center(
                    child: Text(
                      'To enable us provide valid health information, please provide valid information',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff30158c),
                        fontSize: McGyver.textSize(context, 2.1),
                      ),
                    ),
                  ),

                  SizedBox(height: McGyver.rsDoubleH(context, 5)),
                  Text(
                    'What age were you diagnosed?',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff130a38),
                        fontSize: McGyver.textSize(context, 2.1)),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 2)),
                  SignupTextField(
                    controller: ageController,
                    text: 'Type age here',
                    obscure: false,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 5)),
                  Text(
                    'What is your height?',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff130a38),
                        fontSize: McGyver.textSize(context, 2.1)),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 2)),
                  SignupTextField(
                    controller: heightController,
                    text: 'Height in cm',
                    obscure: false,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 5)),
                  Text(
                    'Trigger factors (optional)',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(19, 10, 56, 0.9),
                        fontSize: McGyver.textSize(context, 2.1)),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 2)),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Cold/Humid Air',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                viewModel.setBool(0, 'Cold/Humid Air');
                              },
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.trigger[0] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Smoking',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => viewModel.setBool(1, 'Smoking'),
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.trigger[1] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Allergy',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => viewModel.setBool(2, 'Allergy'),
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.trigger[2] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Heart Burn',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => viewModel.setBool(3, 'Heart Burn'),
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.trigger[3] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Exercises',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => viewModel.setBool(4, 'Exercises'),
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.trigger[4] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Others',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => viewModel.setBool(5, 'Others'),
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.trigger[5] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //symptoms
                  SizedBox(height: McGyver.rsDoubleH(context, 5)),
                  Text(
                    'Symptoms (optional)',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(19, 10, 56, 0.9),
                        fontSize: McGyver.textSize(context, 2.1)),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 2)),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Difficulty Breathing',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                viewModel.setSymptomBool(
                                    0, 'Difficulty Breathing');
                              },
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.symptoms[0] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 2)),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Chest tightness',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                viewModel.setSymptomBool(1, 'Chest tightness');
                              },
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.symptoms[1] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 2)),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Coughing',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                viewModel.setSymptomBool(2, 'Coughing');
                              },
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.symptoms[2] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 2)),
                  Container(
                    width: width,
                    height: McGyver.rsDoubleH(context, 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffdbdde0))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 3)),
                        child: Row(
                          children: [
                            Text(
                              'Sleep problems',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff0e1633),
                                  fontSize: McGyver.textSize(context, 2.1)),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                viewModel.setSymptomBool(3, 'Sleep problems');
                              },
                              child: Container(
                                width: McGyver.rsDoubleW(context, 5),
                                height: McGyver.rsDoubleW(context, 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black54)),
                                child: CircleAvatar(
                                  backgroundColor: viewModel.symptoms[3] == true
                                      ? Color(0xff30158c)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: McGyver.rsDoubleH(context, 5)),
                  Text(
                    'Emergency Contacts',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff130a38),
                        fontSize: McGyver.textSize(context, 2.1)),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: McGyver.rsDoubleH(context, 2),
                        );
                      },
                      shrinkWrap: true,
                      itemCount: viewModel.number,
                      itemBuilder: (context, index) {
                        return SignupTextField(
                          text: '(234) 1234 567',
                          obscure: false,
                          keyboardType: TextInputType.phone,
                          onChanged: (value) =>
                              viewModel.addNumber(value, index),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 3)),
                  Row(
                    children: [
                      Visibility(
                        visible: viewModel.number >= 2 ? true : false,
                        child: GestureDetector(
                          onTap: () => viewModel.decrement(),
                          child: Text(
                            'Remove -',
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff30159C),
                                fontSize: McGyver.textSize(context, 2.1)),
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () => viewModel.increment(),
                        child: Text(
                          '+ Add more',
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff30159C),
                              fontSize: McGyver.textSize(context, 2.1)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 5)),
                  viewModel.buttonStates == ButtonStates.Idle
                      ? MaterialButton(
                          minWidth: width,
                          height: McGyver.rsDoubleH(context, 9),
                          color: buttonColor,
                          onPressed: () async {
                            List<String> some = viewModel.phone;
                            if (some[0].isNotEmpty &&
                                ageController.text.isNotEmpty &&
                                heightController.text.isNotEmpty) {
                              if (some[0].length != 11) {
                                Get.snackbar(
                                    'Hey there', 'Please enter a valid contact',
                                    snackPosition: SnackPosition.TOP,
                                    snackStyle: SnackStyle.FLOATING,
                                    leftBarIndicatorColor: buttonColor,
                                    backgroundColor: Colors.red,
                                    borderRadius: 0,
                                    duration: Duration(seconds: 4),
                                    icon: Icon(Icons.error)
                                    // backgroundColor: buttonColor
                                    );
                              } else {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool('profile', true);
                                var days = DateTime.now().difference(dob);
                                var age = (days.inDays / 360).round();
                                DB().insertUser(User(
                                    ageDiagnosed: ageController.text,
                                    country: country,
                                    id: 1,
                                    height: heightController.text,
                                    //Using peak flow formula
                                    //TODO: Write on this
                                    peakflow:
                                        ((int.tryParse(heightController.text) *
                                                    5.3) -
                                                433)
                                            .round()
                                            .toString(),
                                    username: name,
                                    fullname: fullname,
                                    gender: gender,
                                    image: imagePath,
                                    symptoms: viewModel.symptomNames.join(','),
                                    age: age.toString(),
                                    birthdate: dob.toString(),
                                    contacts: viewModel.phone.join(','),
                                    triggers:
                                        viewModel.triggerNames.join(',')));

                                Get.snackbar('Success',
                                    'Your profile has been created successfully',
                                    snackPosition: SnackPosition.TOP,
                                    snackStyle: SnackStyle.FLOATING,
                                    leftBarIndicatorColor: buttonColor,
                                    backgroundColor: Colors.lightGreen,
                                    borderRadius: 0,
                                    duration: Duration(seconds: 4),
                                    icon: Icon(Icons.error)
                                    // backgroundColor: buttonColor
                                    );
                                Future.delayed(Duration(seconds: 3), () {
                                  Get.off(MyHomePage());
                                });
                              }
                            } else {
                              Get.snackbar(
                                  'Hey there', 'Fill in the required fields',
                                  snackPosition: SnackPosition.TOP,
                                  snackStyle: SnackStyle.FLOATING,
                                  leftBarIndicatorColor: buttonColor,
                                  backgroundColor: Colors.red,
                                  borderRadius: 0,
                                  duration: Duration(seconds: 4),
                                  icon: Icon(Icons.error)
                                  // backgroundColor: buttonColor
                                  );
                            }
                          },
                          child: Text(
                            'Done',
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
                  SizedBox(height: McGyver.rsDoubleH(context, 3)),
                ],
              ),
            ),
          ),
        ));
  }
}
