// Package imports
import 'package:hero_agri/eula_page.dart';
import 'package:hero_agri/mobile_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:passwordfield/passwordfield.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({Key key}) : super(key: key);

  @override
  _UserRegisterPageState createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.amber;
    }

    return Scaffold(
      resizeToAvoidBottomInset:
          false, //desable bottm overflow when keyboard is on
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/Canvas_02.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // SizedBox(height: 50,),
              Container(
                padding: EdgeInsets.all(0),
                child: ListTile(
                  title: Text(
                    'ลงทะเบียนผู้ใช้งาน',
                    style: TextStyle(
                        fontFamily: 'Anakotmai',
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.lime[600]),
                  ),
                  subtitle: Text(
                    'สร้างบัญชีของคุณ และเริ่มต้นใช้งานได้เลย',
                    style: TextStyle(
                        fontFamily: 'Anakotmai',
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    // hintText: 'What do people call you?',
                    labelText: 'ชื่อ-นามสกุล',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                        fontFamily: 'Anakotmai', fontWeight: FontWeight.w500),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    // hintText: 'What do people call you?',
                    labelText: 'เบอร์โทรศัพท์',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                        fontFamily: 'Anakotmai', fontWeight: FontWeight.w500),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                child: PasswordField(
                  hintText: 'รหัสผ่าน',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  hintStyle: TextStyle(
                      fontFamily: 'Anakotmai', fontWeight: FontWeight.w500),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  )),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'รหัสผ่านควรมีจำนวนมากกว่าหรือเท่ากับ 6 ตัวอักษร',
                style: TextStyle(
                    fontFamily: 'Anakotmai',
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                child: PasswordField(
                  hintText: 'รหัสผ่านอีกครั้ง',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  hintStyle: TextStyle(
                      fontFamily: 'Anakotmai', fontWeight: FontWeight.w500),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  )),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    checkColor: Colors.white,
                    // fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                  Text(
                    'ฉันได้ยอมรับ',
                    style: TextStyle(
                        fontFamily: 'Anakotmai', fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    child: Text(
                      'ข้อตกลงและเงื่อนไข',
                      style: TextStyle(
                          fontFamily: 'Anakotmai',
                          decoration: TextDecoration.underline,
                          color: Colors.green,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EULAPage()));
                    },
                  ),
                  Text(
                    'ที่กำหนด',
                    style: TextStyle(
                        fontFamily: 'Anakotmai', fontWeight: FontWeight.w500),
                  )
                ],
              ),
              GestureDetector(
                child:
                    Image.asset('assets/image/button/register_commit_btn.png'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MobileAuthenticatePage()));
                },
              ),
              SizedBox(
                height: 35,
              )
            ],
          ),
        )),
      ),
    );
  }
}
