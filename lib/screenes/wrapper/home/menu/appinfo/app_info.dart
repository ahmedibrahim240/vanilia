import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/screenes/wrapper/home/menu/appinfo/Contactsupport.dart';
import 'package:vanillia/screenes/wrapper/home/menu/appinfo/appRating.dart';
import 'package:vanillia/screenes/wrapper/home/menu/appinfo/subscription.dart';

class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  List<String> _list = [
    ' أسئلة متكررة',
    'text1text1text1text1text1text1text1text1text1text1text1text1',
    'text2text1text1text1text1text1text1text1text1text1text1text1',
    'text3text1text1text1text1text1text1text1text1text1text1',
  ];
  List<String> _list2 = [
    ' أخصوصية الموقع',
    'text1',
    'text2',
    'text3',
  ];
  bool _isOnTap = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        Text(
          getTranslated(context, 'About_app'),
          style: AppTheme.heading.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isOnTap = !_isOnTap;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            getTranslated(context, 'faqs'),
                            style: AppTheme.heading,
                          ),
                          Icon(Icons.arrow_drop_down_circle_outlined),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  (_isOnTap) ? menuDropListViue(_list, context) : Container(),
                  SizedBox(height: 20),
                  CustomDropMenuBottom(
                    list: _list2,
                    title: getTranslated(context, 'site_privacy'),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => AppRating(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        getTranslated(context, 'share_your_opinion'),
                        style: AppTheme.heading,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ContactSupport(),
                        ),
                      );
                    },
                    child: Container(
                      width: width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        getTranslated(context, 'contact_support'),
                        style: AppTheme.heading,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      launchInBrowser(registerServiceUrl);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: height * .06,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        getTranslated(context, 'advertise_with_us'),
                        style: AppTheme.heading,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Subscription(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        getTranslated(context, 'subscription'),
                        style: AppTheme.heading,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      launchInBrowser(vanilliaUrl);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        getTranslated(context, 'our_site'),
                        style: AppTheme.heading,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: CircleAvatar(
                          maxRadius: 25,
                          backgroundImage: AssetImage('lib/images/twitter.png'),
                        ),
                        onTap: () {},
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        child: CircleAvatar(
                          maxRadius: 25,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('lib/images/google.png'),
                        ),
                        onTap: () {},
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        child: CircleAvatar(
                          maxRadius: 25,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('lib/images/facebock.png'),
                        ),
                        onTap: () {},
                      ),
                    ],
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
