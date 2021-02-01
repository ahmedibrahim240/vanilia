import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/screenes/wrapper/authenticate/chagePassword.dart';
import 'package:code_fields/code_fields.dart';

class VerifyPhone extends StatefulWidget {
  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  final _formKey = GlobalKey<FormState>();
  final int codeLength = 4;

  String validateCode(String code) {
    if (code.length < codeLength)
      return "من فضلك اكمل الكود";
    else {
      bool isNumeric = int.tryParse(code) != null;
      if (!isNumeric) return "برجاء ادخال الكود المرسل";
    }
    return null;
  }

  void onButtonPressed() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ChagePassrowd(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff880e4f).withOpacity(.8),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTranslated(context, 'enter_code'),
                  style: AppTheme.heading.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${getTranslated(context, 'sent_code_to')}' + ' 0102412151',
                  style: AppTheme.subHeading.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: CodeFields(
                    length: codeLength,
                    validator: validateCode,
                    textStyle: TextStyle(color: Colors.white),
                    autofocus: true,
                    inputDecoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xfff880e4f),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide(color: Color(0xfff880e4f)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      getTranslated(context, 'not_send'),
                      style: AppTheme.heading.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        getTranslated(context, 'resend'),
                        style: AppTheme.heading.copyWith(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: getTranslated(context, 'send'),
                  onPress: onButtonPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
