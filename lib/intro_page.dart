// Package imports
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

// Package import
import 'package:hero_agri/login_screen.dart';
import 'package:hero_agri/register_page.dart';

class AppIntroPage extends StatefulWidget {
  const AppIntroPage({Key key}) : super(key: key);

  @override
  _AppIntroPageState createState() => _AppIntroPageState();
}

class _AppIntroPageState extends State<AppIntroPage> {
  final _totalDots = 2;
  double _currentPosition = 0.0;
  // Progress dot
  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  @override
  Widget build(BuildContext context) {
    if (_currentPosition > 1) {
      _currentPosition = 1.0;
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/Group17188.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                child: _currentPosition == 0.0 ? PageOne() : PageTwo(),
                // onHorizontalDragEnd: print('a'),
              ),
              // Progress Bar
              new DotsIndicator(
                dotsCount: _totalDots,
                position: _currentPosition,
                decorator: DotsDecorator(activeColor: Colors.amber[400]),
                onTap: (position) {
                  setState(() => _currentPosition = position);
                },
              ),
              SizedBox(
                height: 20,
              ),
              startButton(),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _currentPosition == 0.0
          ? TextButton(
              child: Text('ข้าม',
                  style: TextStyle(
                      fontFamily: 'Anakotmai',
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.amber[400])),
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => UserLoginPage()));
                setState(() {
                  _currentPosition++;
                });
                print('Change Page $_currentPosition');
              })
          : null,
    );
  }

  Widget startButton() {
    return Column(
      children: <Widget>[
        GestureDetector(
            child: _currentPosition == 1.0
                ? Image.asset('assets/image/button/start_btn.png')
                : SizedBox(height: 70,),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserLoginPage()));
            }),
            SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _currentPosition == 1.0
                ? Text('ยังไม่มีบัญชีใช่หรือไม่?',
                    style: TextStyle(
                        fontFamily: 'Anakotmai',
                        fontSize: 20,
                        fontWeight: FontWeight.w500))
                : Text(''),
            GestureDetector(
                child: _currentPosition == 1.0
                    ? Text('สมัครสมาชิก',
                        style: TextStyle(
                            fontFamily: 'Anakotmai',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.amber[400]))
                    : SizedBox(),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserRegisterPage()));
                })
          ],
        )
      ],
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(
          //   'Picture1',
          //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
          // ),
          Image.asset('assets/image/plant-hands.png'),
          SizedBox(
            height: 10,
          ),
          Text(
            'จากองค์ความรู้นวัตกรรม 52 สัปดาห์',
            style: TextStyle(
                fontFamily: 'Anakotmai',
                fontSize: 23,
                fontWeight: FontWeight.w600),
          ),
          Text('สู่การใช้งานจริงในรูปแบบ',
              style: TextStyle(
                  fontFamily: 'Anakotmai',
                  fontSize: 23,
                  fontWeight: FontWeight.w600)),
          Text('Mobile Application',
              style: TextStyle(
                  fontFamily: 'Anakotmai',
                  fontSize: 23,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 65,
          ),
        ],
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/image/logo.png'),
        SizedBox(
          height: 50,
        ),
        Text(
          'Hero Agri ระบบที่ให้คำแนะนำการปลูก',
          style: TextStyle(
              fontFamily: 'Anakotmai',
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        Text('ดูแลรักษาพืช และพยากรณ์ผลผลิต',
            style: TextStyle(
                fontFamily: 'Anakotmai',
                fontSize: 20,
                fontWeight: FontWeight.w600)),
        Text('ด้วยองค์ความรู้จากคณาจารย์',
            style: TextStyle(
                fontFamily: 'Anakotmai',
                fontSize: 20,
                fontWeight: FontWeight.w600)),
        Text('นักวิจัยในประเทศไทย',
            style: TextStyle(
                fontFamily: 'Anakotmai',
                fontSize: 20,
                fontWeight: FontWeight.w600)),
        SizedBox(
          height: 40,
        ),
      ],
    ));
  }
}
