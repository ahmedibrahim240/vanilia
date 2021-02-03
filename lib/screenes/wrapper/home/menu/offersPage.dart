import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/model/Chat.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/screenes/wrapper/home/menu/menu.dart';

import '../../../search.dart';

class OffersPage extends StatefulWidget {
  final Chat item;

  const OffersPage({Key key, @required this.item}) : super(key: key);

  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        toolbarHeight: 0.0,
        elevation: 0.0,
      ),
      key: scaffoldKey,
      drawer: ClipRRect(
        borderRadius: (UserData.appLang == 'ar_EG')
            ? BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              )
            : BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
        child: Drawer(
          child: Menu(),
        ),
      ),
      body: ListView(
        children: [
          _appBaer(),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.yellow[800],
                        Colors.yellow[600],
                        Colors.yellow[800],
                      ],
                    ),
                    image: DecorationImage(
                      image: AssetImage(widget.item.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),
                        RichText(
                          textDirection: TextDirection.rtl,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'شركات : ',
                                style: AppTheme.heading.copyWith(
                                  color: customColor,
                                ),
                              ),
                              TextSpan(
                                text: widget.item.username,
                                style: AppTheme.subHeading,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        launchMessageToWhatsApp(
                            phoneNum: '+201551016887', massage: 'hi');
                      },
                      child: Row(
                        children: [
                          Text(
                            'حجز',
                            style:
                                AppTheme.heading.copyWith(color: customColor),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            maxRadius: 10,
                            backgroundImage:
                                AssetImage('lib/images/whatsapp.png'),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    widget.item.username,
                    style: AppTheme.heading,
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.item.message,
                        style: AppTheme.subHeading,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Color(0xfff880e4f),
                    ),
                    Text(
                      'المونصوره',
                      style: AppTheme.subHeading,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.attach_file_outlined,
                            color: Color(0xfff880e4f),
                          ),
                          Text(
                            'www.wddwdadw.com',
                            style: AppTheme.subHeading,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      // onTap: () => callNumber(widget.phoneNumber),
                      child: Row(
                        children: [
                          Text(
                            '010000000',
                            style: AppTheme.subHeading,
                          ),
                          Icon(
                            Icons.phone,
                            color: Color(0xfff880e4f),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: CircleAvatar(
                              maxRadius: 10,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage('lib/images/facebock.png'),
                            ),
                          ),
                          Text(
                            'com@djklfhgjkldfnv',
                            style: AppTheme.subHeading,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'com@djklfhgjkldfnv',
                            style: AppTheme.subHeading,
                          ),
                          Icon(
                            Icons.email,
                            color: Color(0xfff880e4f),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _appBaer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xfff880e4f),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 120,
              ),
              Text(
                getTranslated(context, 'vanillia'),
                style: AppTheme.heading.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => scaffoldKey.currentState.openDrawer(),
                  ),
                  InkWell(
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: DataSearch(),
                      );
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              CityList(),
            ],
          ),
        ],
      ),
    );
  }
}
