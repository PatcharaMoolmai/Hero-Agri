// Package imports
import 'package:hero_agri/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:passwordfield/passwordfield.dart';

class MobileAuthenticatePage extends StatefulWidget {
  const MobileAuthenticatePage({Key key}) : super(key: key);

  @override
  _MobileAuthenticatePageState createState() => _MobileAuthenticatePageState();
}

class _MobileAuthenticatePageState extends State<MobileAuthenticatePage> {
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
            Text(
              '+XX XXXXXXXXXX',
              style: TextStyle(
                  fontFamily: 'Anakotmai',
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '_ _ _ _ _ _',
              style: TextStyle(
                  fontFamily: 'Anakotmai',
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              child: Image.asset('assets/image/button/confirm_btn.png'),
              onTap: (){
                Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
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
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            )
          ],
        ),
      )),
    ));
  }
}
