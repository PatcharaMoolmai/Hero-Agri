// Package imports
import 'package:hero_agri/login/eula_page.dart';
import 'package:hero_agri/login/mobile_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:passwordfield/passwordfield.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage(
      {Key key,
      this.telephoneTextEditingController,
      this.nameTextEditingController,
      this.passwordTextEditingController,
      this.parentAction})
      : super(key: key);

  final TextEditingController telephoneTextEditingController;
  final TextEditingController nameTextEditingController;
  final TextEditingController passwordTextEditingController;

  final ValueChanged<List<dynamic>> parentAction;

  @override
  _UserRegisterPageState createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {

  bool isChecked = false;
  bool _agreedToTerm = false;

  void _setAgreedToTerm(bool newValue) {
    // _passDataToParent('term',newValue);
    setState(() {
      _agreedToTerm = newValue;
    });
  }

  void _passDataToParent(String key, dynamic value) {
    List<dynamic> addData = List<dynamic>();
    addData.add(key);
    addData.add(value);
    widget.parentAction(addData);
  }

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
                    '??????????????????????????????????????????????????????',
                    style: TextStyle(
                        fontFamily: 'Anakotmai',
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.lime[600]),
                  ),
                  subtitle: Text(
                    '???????????????????????????????????????????????? ?????????????????????????????????????????????????????????????????????',
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
                    hintText: '????????????-?????????????????????',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                        fontFamily: 'Anakotmai', fontWeight: FontWeight.w500),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                // name controller
                controller: widget.nameTextEditingController,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: '???????????????????????????????????????',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                        fontFamily: 'Anakotmai', fontWeight: FontWeight.w500),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                // telephone controller
                controller: widget.telephoneTextEditingController,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                child: PasswordField(
                    hintText: '????????????????????????',
                    // password controller
                    controller: widget.passwordTextEditingController,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintStyle: TextStyle(
                        fontFamily: 'Anakotmai', fontWeight: FontWeight.w500),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '???????????????????????????????????????????????????????????????????????????????????????????????????????????? 6 ????????????????????????',
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
                    hintText: '????????????????????????????????????????????????',
                    // password controller
                    controller: widget.passwordTextEditingController,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintStyle: TextStyle(
                        fontFamily: 'Anakotmai', fontWeight: FontWeight.w500),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    checkColor: Colors.white,
                    // fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: _setAgreedToTerm
                  ),
                  Text(
                    '????????????????????????????????????',
                    style: TextStyle(
                        fontFamily: 'Anakotmai', fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    child: Text(
                      '??????????????????????????????????????????????????????',
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
                    '????????????????????????',
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
