import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/screenes/wrapper/authenticate/verfyPassword.dart';

class PasswordRecovery extends StatefulWidget {
  @override
  _PasswordRecoveryState createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  final _formKey = GlobalKey<FormState>();
  bool verification = true;
  bool changePass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff880e4f).withOpacity(.8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTranslated(context, 'password_recovery'),
                  style: AppTheme.heading.copyWith(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  getTranslated(context, 'valid_email_phone'),
                  style: AppTheme.subHeading.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Color(0xfff880e4f).withOpacity(.8),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Color(0xfff880e4f).withOpacity(.8),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: getTranslated(context, 'send'),
                  onPress: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => VerifyPhone(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
