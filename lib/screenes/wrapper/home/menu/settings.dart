import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/model/language.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/screenes/wrapper/authenticate/authenticate.dart';
import 'package:vanillia/services/auth.dart';
import 'package:vanillia/services/helper.dart';

import '../../../../main.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isEidt;

  @override
  void initState() {
    super.initState();
    isEidt = true;
  }

  final AuthServices _auth = AuthServices();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
    DBHelper.saveAppLang(_locale.toString());
    UserData.appLang = await DBHelper.getAppLang();
    print('_lacal:' + _locale.toString());
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: customAppBar(
        Text(
          getTranslated(context, 'settings'),
          style: AppTheme.heading.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 30),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: customColor,
                ),
                SizedBox(width: 5),
                Text(
                  getTranslated(context, 'account'),
                  style: AppTheme.heading,
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getTranslated(context, 'Change_password'),
                    style: AppTheme.heading,
                  ),
                  Transform.rotate(
                    angle: 180 * 3.14 / 180,
                    child: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(height: 10),
            lan(),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(height: 10),
            CustomButton(
              onPress: () async {
                DBHelper.saveUserselectedProImage(false);
                await _auth.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => Authenticate(),
                  ),
                );
              },
              text: getTranslated(context, 'sign_out'),
            ),
          ],
        ),
      ),
    );
  }

  Widget lan() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          getTranslated(context, 'language'),
          style: AppTheme.heading,
        ),
        DropdownButton<Language>(
          dropdownColor: Colors.white,
          underline: SizedBox(),
          icon: Icon(
            Icons.language,
            color: Colors.lightBlueAccent,
          ),
          onChanged: (Language language) {
            _changeLanguage(language);
          },
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
