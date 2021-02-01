import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/model/data.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/screenes/search.dart';
import 'package:vanillia/screenes/wrapper/home/menu/menu.dart';
import 'package:vanillia/screenes/wrapper/home/postPage.dart';

class SectionsPage extends StatefulWidget {
  final Data2 listDate;
  SectionsPage({@required this.listDate});
  @override
  _SectionsPageState createState() => _SectionsPageState();
}

class _SectionsPageState extends State<SectionsPage> {
  var rating = 4.0;
  int selectedRadioTile;
  bool isSelect = true;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xfff880e4f),
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
        shrinkWrap: true,
        children: [
          _appBaer(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 200,
            child: Column(
              children: [
                SizedBox(height: 5),
                _gridViewCount(),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 250,
            child: ListView.builder(
              shrinkWrap: true,
              primary: true,
              itemCount: widget.listDate.imgeList.length,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => PostPage(
                            imgUrl: widget.listDate.imgeList[i],
                            title: widget.listDate.title + '$i',
                            phoneNumber: widget.listDate.phoneNamber,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 70,
                            width: (MediaQuery.of(context).size.width) * .2,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    NetworkImage(widget.listDate.imgeList[i]),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          SizedBox(width: 3),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SmoothStarRating(
                                rating: rating,
                                size: 20,
                                isReadOnly: true,
                                filledIconData: Icons.star,
                                color: Colors.yellow[700],
                                halfFilledIconData: Icons.star_half,
                                borderColor: Colors.yellow[900],
                                defaultIconData: Icons.star_border,
                                starCount: 5,
                                allowHalfRating: true,
                                spacing: 2.0,
                              ),
                              Text(
                                'الأستاذة :ندي',
                                style: AppTheme.heading,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _gridViewCount() {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - 100) / 2.5;
    final double itemWidth = size.width / 2;
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 1.0,
      mainAxisSpacing: 1.0,
      primary: false,
      childAspectRatio: (itemWidth / itemHeight),
      shrinkWrap: true,
      children: List.generate(
        4,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PostPage(
                      imgUrl: widget.listDate.imgeList[index],
                      title: widget.listDate.title + '$index',
                      phoneNumber: widget.listDate.phoneNamber,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Column(
                  crossAxisAlignment: (UserData.appLang == 'ar_EG')
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Hero(
                      tag: 'imgUrl-${widget.listDate.imgeList[index]}',
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: (MediaQuery.of(context).size.height) * .15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18.0),
                            topRight: Radius.circular(18.0),
                          ),
                          image: DecorationImage(
                            image:
                                NetworkImage(widget.listDate.imgeList[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3, left: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SmoothStarRating(
                              rating: rating,
                              size: 20,
                              isReadOnly: true,
                              filledIconData: Icons.star,
                              color: Color(0xfff880e4f),
                              halfFilledIconData: Icons.star_half,
                              borderColor: Color(0xfff880e4f),
                              defaultIconData: Icons.star_border,
                              starCount: 5,
                              allowHalfRating: true,
                              spacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4, left: 4),
                            child: Column(
                              crossAxisAlignment: (UserData.appLang == 'ar_EG')
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end,
                              children: [
                                Hero(
                                  tag: 'title-${widget.listDate.title}$index',
                                  child: RichText(
                                    textDirection: TextDirection.rtl,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              widget.listDate.title + '$index',
                                          style: AppTheme.heading,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        (UserData.appLang == 'ar_EG')
                                            ? MainAxisAlignment.start
                                            : MainAxisAlignment.end,
                                    children: (UserData.appLang == 'ar_EG')
                                        ? [
                                            Icon(
                                              Icons.location_pin,
                                              color: Color(0xfff880e4f),
                                              size: 20,
                                            ),
                                            Text(
                                              'المونصوره',
                                              style: AppTheme.subHeading,
                                            ),
                                          ]
                                        : [
                                            Text(
                                              'المونصوره',
                                              style: AppTheme.subHeading,
                                            ),
                                            Icon(
                                              Icons.location_pin,
                                              color: Color(0xfff880e4f),
                                              size: 20,
                                            ),
                                          ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: (MediaQuery.of(context).size.height) *
                                      .044,
                                  child: RichText(
                                    textDirection: TextDirection.rtl,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: widget.listDate.contant
                                              .substring(0, 72),
                                          style: AppTheme.subHeading.copyWith(
                                            fontSize: 8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width) * .2,
                                  height: 35,
                                  child: FlatButton(
                                    onPressed: () =>
                                        callNumber(widget.listDate.phoneNamber),
                                    color: Color(0xfff880e4f),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side:
                                          BorderSide(color: Color(0xfff880e4f)),
                                    ),
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 3),
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width) * .2,
                                  height: 35,
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => PostPage(
                                            imgUrl:
                                                widget.listDate.imgeList[index],
                                            title: widget.listDate.title +
                                                '$index',
                                            phoneNumber:
                                                widget.listDate.phoneNamber,
                                          ),
                                        ),
                                      );
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side:
                                          BorderSide(color: Color(0xfff880e4f)),
                                    ),
                                    child: Text(
                                      getTranslated(context, 'more'),
                                      style: AppTheme.heading
                                          .copyWith(color: Color(0xfff880e4f)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
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
              Row(
                children: [
                  CityList(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => _showSettingsPanel(),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('lib/images/filter.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showSettingsPanel() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
      ),
      context: context,
      enableDrag: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            gradient: AppTheme.containerBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20),
            children: [
              Row(
                mainAxisAlignment: (UserData.appLang == 'ar_EG')
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                children: (UserData.appLang == 'ar_EG')
                    ? [
                        Icon(
                          Icons.list,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          'حدد بجثك',
                          textDirection: TextDirection.rtl,
                          style: AppTheme.heading.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ]
                    : [
                        Text(
                          'حدد بجثك',
                          textDirection: TextDirection.rtl,
                          style: AppTheme.heading.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.list,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
              ),
              RadioListTile(
                value: 1,
                groupValue: selectedRadioTile,
                activeColor: Colors.white,
                title: Text(
                  "التقييم",
                  textDirection: TextDirection.rtl,
                  style: AppTheme.heading.copyWith(color: Colors.white),
                ),
                onChanged: (val) {
                  setSelectedRadioTile(val);
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile(
                value: 2,
                groupValue: selectedRadioTile,
                title: Text(
                  "عروض وخصومات",
                  textDirection: TextDirection.rtl,
                  style: AppTheme.heading.copyWith(color: Colors.white),
                ),
                activeColor: Colors.white,
                onChanged: (val) {
                  setSelectedRadioTile(val);
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile(
                value: 3,
                groupValue: selectedRadioTile,
                activeColor: Colors.white,
                title: Text(
                  "الاعلي سعرا",
                  textDirection: TextDirection.rtl,
                  style: AppTheme.heading.copyWith(color: Colors.white),
                ),
                onChanged: (val) {
                  setSelectedRadioTile(val);
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile(
                value: 3,
                groupValue: selectedRadioTile,
                activeColor: Colors.white,
                title: Text(
                  "اقل سعرا",
                  textDirection: TextDirection.rtl,
                  style: AppTheme.heading.copyWith(color: Colors.white),
                ),
                onChanged: (val) {
                  setSelectedRadioTile(val);
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile(
                value: 4,
                groupValue: selectedRadioTile,
                activeColor: Colors.white,
                title: Text(
                  "الاقرب",
                  textDirection: TextDirection.rtl,
                  style: AppTheme.heading.copyWith(color: Colors.white),
                ),
                onChanged: (val) {
                  setSelectedRadioTile(val);
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile(
                value: 5,
                groupValue: selectedRadioTile,
                activeColor: Colors.white,
                title: Text(
                  "اجدد التحديثات",
                  textDirection: TextDirection.rtl,
                  style: AppTheme.heading.copyWith(color: Colors.white),
                ),
                onChanged: (val) {
                  setSelectedRadioTile(val);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
