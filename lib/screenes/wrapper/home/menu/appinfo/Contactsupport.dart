import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';

class ContactSupport extends StatefulWidget {
  @override
  _ContactSupportState createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        Text(
          getTranslated(context, 'contact_support'),
          style: AppTheme.heading.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.edit,
                        color: customColor,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelStyle: AppTheme.heading.copyWith(
                        color: customColor,
                      ),
                      labelText: getTranslated(context, 'name'),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.edit,
                        color: customColor,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelStyle: AppTheme.heading.copyWith(
                        color: customColor,
                      ),
                      labelText: getTranslated(context, 'phone_num'),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.edit,
                        color: customColor,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelStyle: AppTheme.heading.copyWith(
                        color: customColor,
                      ),
                      labelText: getTranslated(context, 'email'),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    decoration: InputDecoration(
                      isDense: true,
                      suffixIcon: Icon(
                        Icons.edit,
                        color: customColor,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelStyle: AppTheme.heading.copyWith(
                        color: customColor,
                      ),
                      labelText: getTranslated(context, 'messages'),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xfff880e4f),
                      child: MaterialButton(
                        onPressed: () {},
                        minWidth: double.infinity,
                        height: 48,
                        child: Text(
                          getTranslated(context, 'send'),
                          style: AppTheme.heading.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
