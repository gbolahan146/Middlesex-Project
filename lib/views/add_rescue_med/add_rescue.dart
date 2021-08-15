import 'package:asthma_management/core/models/rescue.dart';
import 'package:asthma_management/core/services/db.dart';
import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:asthma_management/core/services/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRescueScreen extends StatefulWidget {
  @override
  _AddRescueScreenState createState() => _AddRescueScreenState();
}

class _AddRescueScreenState extends State<AddRescueScreen> {
  final _textController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/bottomBar');
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: McGyver.rsDoubleW(context, 4),
              ),
              Text('Add rescue medication',
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: McGyver.textSize(context, 2.7),
                      color: Color(0xff130A38))),
            ],
          ),
          actions: [],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: McGyver.rsDoubleH(context, 4),
                ),
                Container(
                  height: McGyver.rsDoubleH(context, 8),
                  child: TextFormField(
                    // controller: _textController,

                    decoration: InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffF0EFEF),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff130A38),
                          ),
                        ),
                        fillColor: Color(0xffF0EFEF),
                        hintText: 'search for rescue medication',
                        hintStyle: GoogleFonts.dmSans(
                            color: Color(0xff777777),
                            fontWeight: FontWeight.w500,
                            fontSize: McGyver.textSize(context, 2))),
                  ),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 6),
                ),
                // !empty
                //     ? Container(
                //         child: Center(
                //           child: Padding(
                //             padding: const EdgeInsets.only(top: 118.0),
                //             child: Column(
                //               children: [
                //                 Image.asset(
                //                   'assets/images/empty.png',
                //                   scale: 11,
                //                 ),
                //                 Text(
                //                   'No rescue medication added',
                //                   style: GoogleFonts.dmSans(
                //                       color: Color(0xff777777),
                //                       fontWeight: FontWeight.w500,
                //                       fontSize: McGyver.textSize(context, 1.7)),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       )
                //     :
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Drugs',
                            style: GoogleFonts.dmSans(
                                color: Color(0xff130A38),
                                fontWeight: FontWeight.w500,
                                fontSize: McGyver.textSize(context, 2.2)),
                          ),
                          Text(
                            'CLEAR ALL',
                            style: GoogleFonts.dmSans(
                                color: Color(0xff30159C),
                                fontWeight: FontWeight.w500,
                                fontSize: McGyver.textSize(context, 2.0)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: McGyver.rsDoubleH(context, 6),
                      ),
                      Container(
                        height: McGyver.rsDoubleH(context, 30),
                        child: FutureBuilder<List>(
                          future: DB().getRescue(),
                          builder: (context, snapshot) {
                            return snapshot.connectionState ==
                                    ConnectionState.done
                                ? snapshot.hasData
                                    ? ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          var data = snapshot.data[index];
                                          return Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 20,
                                              ),
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              decoration: BoxDecoration(
                                                  color: Color(0xfff9f9f9),
                                                  border: Border.all(
                                                      color:
                                                          Color(0xfff9f9f9))),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text(
                                                      data['rescue'],
                                                      style: GoogleFonts.dmSans(
                                                          fontSize:
                                                              McGyver.textSize(
                                                                  context, 1.9),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                              0xff525252)),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Image.asset(
                                                      'assets/images/x.png',
                                                      scale: 49,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        })
                                    : CircularProgressIndicator()
                                : CircularProgressIndicator();
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Others',
                            style: GoogleFonts.dmSans(
                                color: Color(0xff130A38),
                                fontWeight: FontWeight.w500,
                                fontSize: McGyver.textSize(context, 2.2)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: McGyver.rsDoubleH(context, 3),
                      ),
                      Container(
                        height: McGyver.rsDoubleH(context, 8),
                        child: TextFormField(
                          controller: _textController,
                          validator: UsernameValidator.validate,
                          decoration: InputDecoration(
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffF0EFEF),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff130A38),
                                ),
                              ),
                              fillColor: Color(0xffF0EFEF),
                              hintText: 'Type drug here',
                              hintStyle: GoogleFonts.dmSans(
                                  color: Color(0xff777777),
                                  fontWeight: FontWeight.w500,
                                  fontSize: McGyver.textSize(context, 2))),
                        ),
                      ),
                      SizedBox(
                        height: McGyver.rsDoubleH(context, 12),
                      ),
                      Container(
                        width: McGyver.rsDoubleW(context, 90),
                        height: McGyver.rsDoubleH(context, 8),
                        child: GestureDetector(
                          onTap: () async {
                            final form = formKey.currentState;
                            form.save();
                            if (form.validate()) {
                              DB()
                                  .insertRescue(
                                      Rescue(title: _textController.text))
                                  .then((value) => _showDialog());
                              _textController.clear();
                            }

                          },
                          child: Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xff130A38),
                            child: Center(
                              child: Text('Done',
                                  style: GoogleFonts.dmSans(
                                      color: Color(0xffffffff),
                                      fontSize: McGyver.textSize(context, 2.9),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: McGyver.rsDoubleH(context, 6),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          actionsPadding:
              EdgeInsets.only(right: McGyver.rsDoubleW(context, 15)),
          title: Column(
            children: [
              Image.asset(
                'assets/images/greencheck.png',
                scale: 7,
              ),
              Text(
                "Successful!",
                style: GoogleFonts.dmSans(
                  color: Color(0xff1EC82F),
                  fontSize: McGyver.textSize(context, 2.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
              "You have successfully added a medication to the list of your rescue  medications",
              style: GoogleFonts.dmSans(
                color: Color(0xff000000),
                fontSize: McGyver.textSize(context, 1.7),
                fontWeight: FontWeight.normal,
              )),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: McGyver.rsDoubleH(context, 6),
                  width: McGyver.rsDoubleW(context, 40),
                  decoration: BoxDecoration(
                    color: Color(0xff1ec82f),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FlatButton(
                    child: Text("Ok",
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
