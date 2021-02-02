import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/screenes/wrapper/home/home.dart';

class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  void _showSettingsPanel() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              decoration: BoxDecoration(
                gradient: AppTheme.containerBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/check.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    getTranslated(context, 'thank_you'),
                    style: AppTheme.heading.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xfff880e4f),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Home(),
                            ),
                          );
                        },
                        minWidth: double.infinity,
                        height: 48,
                        child: Text(
                          getTranslated(context, 'home_page'),
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
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        Text(
          getTranslated(context, 'subscription'),
          style: AppTheme.heading.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CustomAppbar(
            //   height: 50,
            //   title: getTranslated(context, 'subscription'),
            //   width: 120,
            // ),
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
                  SizedBox(height: 40),
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
                  SizedBox(height: 40),
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
                  SizedBox(height: 40),
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
                      labelText: getTranslated(context, 'service_type'),
                    ),
                  ),
                  SizedBox(height: 40),
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
                      labelText: getTranslated(context, 'addition'),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xfff880e4f),
                      child: MaterialButton(
                        onPressed: () => _showSettingsPanel(),
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
