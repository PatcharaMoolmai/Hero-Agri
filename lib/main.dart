import 'package:flutter/material.dart';
import 'package:hero_agri/database/local_database.dart';
import 'package:hero_agri/home_screen.dart';
import 'package:hero_agri/login/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Anakotmai',
      ),
      // home: AppIntroPage()
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // @override
  // initState() async {
  //   _localDatabase = await LocalDatabase.getLocalDatabase();
  //   super.initState();
  // }
  LocalDatabase _localDatabase;

  // Check isLogin is true? if isLogin == true => Application will auto login
  bool _isLogin = false;
  _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = (prefs.get('isLogin') ?? false);

    setState(() {
      _isLogin = isLogin;
    });

    print('isLogin now is $isLogin');
  }

  @override
  void initState() {
    _checkLogin();
    LocalDatabase.getLocalDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !_isLogin ? AppIntroPage() : HomePage();
  }
}
