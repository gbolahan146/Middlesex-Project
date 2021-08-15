part of profile2;

class Profile2ViewTablet extends StatelessWidget {
  final Profile2ViewModel viewModel;
  final String country;
  final DateTime dob;
  final String gender;
 final  String imagePath;

  Profile2ViewTablet(

    {Key key,
    this.viewModel,
    this.country,
    this.dob,
    this.gender,
    this.imagePath,
  });
  @override
  Widget build(BuildContext context) {

    final ageController = useTextEditingController();
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
                      'To enable us provide valid health information,',
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff30158c),
                          fontSize: McGyver.textSize(context, 2.1)),
                    ),
                  ),
                  Center(
                    child: Text(
                      'please provide valid information',
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff30158c),
                          fontSize: McGyver.textSize(context, 2.1)),
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
                  SizedBox(height: McGyver.rsDoubleH(context, 5)),
                  Text(
                    'Emergency Contacts',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff130a38),
                        fontSize: McGyver.textSize(context, 2.1)),
                  ),
                  // SizedBox(height: McGyver.rsDoubleH(context, 2)),
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
                          text: '(234) 813 0665 028',
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
                  MaterialButton(
                    minWidth: width,
                    height: McGyver.rsDoubleH(context, 9),
                    color: buttonColor,
                    onPressed: () {
                      List<String> some = viewModel.phone;
                      if (some[0].isNotEmpty && ageController.text.isNotEmpty) {
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
                          var days = DateTime.now().difference(dob);
                          var age = (days.inDays / 360).round();
                          DB().insertUser(User(
                              ageDiagnosed: ageController.text,
                              country: country,
                              gender: gender,
                              image: imagePath,
                              age: age.toString(),
                              birthdate: dob.toString(),
                              contacts: viewModel.phone.join(','),
                              triggers: viewModel.triggerNames.join(',')));

                          Get.snackbar(
                              'Success', 'Your profile has been updated',
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
                        Get.snackbar('Hey there', 'Fill in the required fields',
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
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 3)),
                ],
              ),
            ),
          ),
        ));
  }
}
