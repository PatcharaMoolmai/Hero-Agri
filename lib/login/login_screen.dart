// Package imports
import 'package:hero_agri/home_screen.dart';
import 'package:hero_agri/login/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hero_agri/navigator_tab_bar.dart';
import 'package:passwordfield/passwordfield.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage(
      {Key key,
      this.usernameTextEditingController,
      this.passwordTextEditingController,
      this.parentAction})
      : super(key: key);

  final TextEditingController usernameTextEditingController;
  final TextEditingController passwordTextEditingController;

  final ValueChanged<List<dynamic>> parentAction;

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  // TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //desable bottm overflow when keyboard is on
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/Canvas.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/icons/logo.png'),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'เบอร์โทรศัพท์ หรือ อีเมล',
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(fontWeight: FontWeight.w500),
                    labelStyle: TextStyle(fontWeight: FontWeight.w500),
                    enabledBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(5.0)
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                controller: widget.usernameTextEditingController,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // color: Colors.white,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: PasswordField(
                    controller: widget.passwordTextEditingController,
                    hintText: 'รหัสผ่าน',
                    hintStyle: TextStyle(
                        fontFamily: 'Anakotmai', fontWeight: FontWeight.w500),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white))),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                child: Text(
                  'ลืมรหัสผ่าน?',
                  style: TextStyle(
                      fontFamily: 'Anakotmai',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white),
                ),
                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => HomePage()));
                // },
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Image.asset('assets/image/button/login_btn.png'),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => HomePageTabbar(
                                index: 0,
                              )),
                      // MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                },
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Image.asset('assets/image/button/register_btn.png'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserRegisterPage()));
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
