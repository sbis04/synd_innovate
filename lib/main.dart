import 'package:flutter/material.dart';
import 'package:synd_innovate/dashboard_screen.dart';
import 'package:synd_innovate/sign_in.dart';
import 'package:synd_innovate/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: (uid != null && authSignedIn != false)
          ? DashboardScreen()
          : SplashScreen(),
    );
  }
}
