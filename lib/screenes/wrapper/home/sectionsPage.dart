import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
// import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/model/data.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/screenes/search.dart';
import 'package:vanillia/screenes/wrapper/home/menu/menu.dart';
import 'package:vanillia/screenes/wrapper/home/postPage.dart';

import '../../../cityPage.dart';

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
      drawer: Drawer(
        child: Menu(),
      ),
      body: Column(
        children: [
          _appBaer(),
          _gridViewCount(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 360,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 70,
                                width: (MediaQuery.of(context).size.width) * .2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        widget.listDate.imgeList[i]),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              SizedBox(width: 3),
                              Container(
                                width: 140,
                                child: RichText(
                                  textDirection: TextDirection.rtl,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            'الأستاذة :ندي ندي ندي ندي ندي ندي ندي ندي ندي ندي',
                                        style: AppTheme.heading
                                            .copyWith(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
    final double itemHeight = (size.height - 350) / 2.5;
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
            padding: const EdgeInsets.all(0.0),
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
                child: Column(
                  crossAxisAlignment: (UserData.appLang == 'ar_EG')
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Hero(
                      tag: 'imgUrl-${widget.listDate.imgeList[index]}',
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: (MediaQuery.of(context).size.height) * .12,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage(widget.listDate.imgeList[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3, left: 10),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: SmoothStarRating(
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
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: () {
                                      callNumber(widget.listDate.phoneNamber);
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: customColor,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.call,
                                          color: Colors.white,
                                          size: 25,
                                        ),

                                        //  IconButton(
                                        //   onPressed: () =>
                                        //       callNumber(widget.listDate.phoneNamber),
                                        // icon: Icon(
                                        //   Icons.call,
                                        //   color: Colors.white,
                                        // ),
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  SizedBox(width: 10),
                  Text(
                    widget.listDate.title,
                    style: AppTheme.heading.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              FlatButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CityPage(),
                    ),
                  );
                },
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(30),
                //   side: BorderSide(
                //     color: Colors.white,
                //   ),
                // ),
                icon: Icon(
                  Icons.location_pin,
                  color: Colors.white,
                  size: 15,
                ),
                label: Text(
                  'المنصوره',
                  style: AppTheme.heading.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                  ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => _showSettingsPanel(),
                  child: Container(
                    height: 30,
                    width: 30,
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
                  "الاعلي تقيما",
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
                  "الاحدث",
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
