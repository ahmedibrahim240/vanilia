import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/screenes/wrapper/home/home.dart';

class ChagePassrowd extends StatefulWidget {
  @override
  _ChagePassrowdState createState() => _ChagePassrowdState();
}

class _ChagePassrowdState extends State<ChagePassrowd> {
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool obscureconPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff880e4f).withOpacity(.8),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getTranslated(context, 'new_password'),
                style: AppTheme.heading.copyWith(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                style: TextStyle(color: Colors.white),
                obscureText: obscurePassword,
                decoration: textFormInputDecorationForPassword(
                  Icons.visibility_off,
                  getTranslated(context, 'password'),
                  () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  obscurePassword,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                style: TextStyle(color: Colors.white),
                obscureText: obscureconPassword,
                decoration: textFormInputDecorationForPassword(
                  Icons.visibility_off,
                  getTranslated(context, 'Confirm_password'),
                  () {
                    setState(() {
                      obscureconPassword = !obscureconPassword;
                    });
                  },
                  obscureconPassword,
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: getTranslated(context, 'send'),
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => Home(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
