import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/screenes/slider.dart';
import 'package:vanillia/services/helper.dart';

class SplashScreen extends StatefulWidget {
  static bool slider = true;
  static void isSlider() {
    slider = !slider;
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getUserInfo();
    print('spachAppLen:' + UserData.appLang.toString());
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => OnBoard(),
          ),
        );
      },
    );
  }

  getUserInfo() async {
    UserData.isSingin = await DBHelper.getUserSingIn();
    UserData.appLang = await DBHelper.getAppLang();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: customColor,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: AppTheme.containerBackground,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              Center(
                child: Container(
                  height: 170,
                  width: width * .6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(),
            ],
          ),
        ],
      ),
    );
  }
}
