// Package imports
import 'dart:async';

import 'package:hero_agri/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hero_agri/navigator_tab_bar.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class MobileAuthenticatePage extends StatefulWidget {
  const MobileAuthenticatePage({Key key}) : super(key: key);

  @override
  _MobileAuthenticatePageState createState() => _MobileAuthenticatePageState();
}

class _MobileAuthenticatePageState extends State<MobileAuthenticatePage> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.yellow,
          Colors.green,
        ],
      )),
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: ListTile(
                title: Text(
                  'รหัสยืนยัน 6 หลัก',
                  style: TextStyle(
                      fontFamily: 'Anakotmai',
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Colors.lightGreen[600]),
                ),
                subtitle: Text(
                  'โปรดตรวจสอบรหัสผ่านที่เบอร์',
                  style: TextStyle(
                      fontFamily: 'Anakotmai',
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.lime[900]),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Tel. number
            Text(
              '+66 XXX-XXX-XXXX',
              style: TextStyle(
                  fontFamily: 'Anakotmai',
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            // mobile authenticator pin form
            Form(
              key: formKey,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    // pastedTextStyle: TextStyle(
                    //   color: Colors.green.shade600,
                    //   fontWeight: FontWeight.bold,
                    // ),
                    length: 6,
                    obscureText: true,
                    // obscuringCharacter: '*',
                    // obscuringWidget: FlutterLogo(
                    //   size: 24,
                    // ),
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    // Validation
                    validator: (v) {
                      if (v.length < 3) {
                        return "ต้องการรหัส OTP";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                        // shape: PinCodeFieldShape.underline,
                        inactiveFillColor: Colors.transparent,
                        selectedFillColor: Colors.transparent,
                        activeFillColor: Colors.transparent,
                        inactiveColor: Color(0xFF57BD37),
                        borderWidth: 3
                        // borderRadius: BorderRadius.circular(5),
                        // fieldHeight: 50,
                        // fieldWidth: 40,
                        // activeFillColor:
                        //     hasError ? Colors.blue.shade100 : Colors.white,
                        ),
                    cursorColor: Colors.black,
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    // Controller
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    // boxShadows: [
                    //   BoxShadow(
                    //     offset: Offset(0, 1),
                    //     color: Colors.black12,
                    //     blurRadius: 10,
                    //   )
                    // ],
                    onCompleted: (v) {
                      print("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              child: Image.asset('assets/image/button/confirm_btn.png'),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => HomePageTabbar(
                              index: 0,
                            )),
                    (route) => false);
                // Navigator.of(context).pushAndRemoveUntil(
                //   MaterialPageRoute(builder: (context) => HomePage()),
                //   (route) => false);
              },
            ),
            SizedBox(
              height: 15,
            ),
            // Resend OTP
            GestureDetector(
              child: Text('ยังไม่ได้รับรหัส OTP?',
                  style: TextStyle(
                      fontFamily: 'Anakotmai',
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            )
          ],
        ),
      )),
    ));
  }
}
