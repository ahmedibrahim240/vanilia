import 'package:flutter/material.dart';

class AppTheme {
  static final TextStyle heading = TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w700,
    fontSize: 12,
    letterSpacing: 1.2,
    color: Colors.black,
  );
  static final TextStyle subHeading = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 10,
    color: Colors.black,
  );
  static final containerBackground = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xfff880e4f),
      Color(0xfffc0116e),
    ],
  );
}

InputDecoration textFormInputDecorationForPassword(
    IconData icon, String label, Function obscureText, bool obscurepasswrod) {
  return InputDecoration(
    errorStyle: AppTheme.subHeading.copyWith(
      color: Colors.white,
    ),
    labelText: label,
    labelStyle: AppTheme.heading.copyWith(
      color: Colors.white,
      fontSize: 8,
    ),
    fillColor: Color(0xfff880e4f),
    filled: true,
    isDense: true,
    contentPadding: EdgeInsets.all(10),
    suffixIcon: IconButton(
      onPressed: obscureText,
      icon: obscurepasswrod
          ? Icon(
              icon,
              color: Colors.white,
            )
          : Icon(
              Icons.visibility,
              color: Colors.white,
            ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Color(0xfff880e4f),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Color(0xfff880e4f),
      ),
    ),
  );
}

InputDecoration textFormInputDecoration(
  IconData icon,
  String label,
) {
  return InputDecoration(
    errorStyle: AppTheme.subHeading.copyWith(
      color: Colors.white,
    ),
    labelText: label,
    labelStyle: AppTheme.heading.copyWith(
      color: Colors.white,
      fontSize: 8,
    ),
    fillColor: Color(0xfff880e4f),
    filled: true,
    isDense: true,
    contentPadding: EdgeInsets.all(10),
    suffixIcon: Icon(
      icon,
      color: Colors.white,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Color(0xfff880e4f),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Color(0xfff880e4f),
      ),
    ),
  );
}
