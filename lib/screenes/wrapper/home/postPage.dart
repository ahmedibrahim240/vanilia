import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/screenes/wrapper/home/menu/menu.dart';
import 'package:vanillia/screenes/wrapper/home/videoscreens.dart';

import '../../search.dart';

class PostPage extends StatefulWidget {
  final String imgUrl;
  final String title;
  final String phoneNumber;
  PostPage({@required this.imgUrl, this.title, @required this.phoneNumber});
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool addComment = false;
  double rating = 1.0;
  String contant =
      'الصناعة منذ القرن لوريم إيبسوم هو ببساطة نصشكلي يستخدم في صناعة الطباعة والتنضيد. كان النصالوهمي لوريم إيبسوم هو القياسي في الصناعة منذ القرن لوريم إيبسوم هو ببساطة نصشكلي يستخدم في صناعة الطباعة والتنضيد. كاالقياسي في الصناعة منذ القرن لوريم إيبسوم هو ببساطة نصشكلي يستخدم في صناعة الطباعة والتنضيد. القياسي في الصناعة منذ القرن لوريم إيبسوم هو ببساطة نصشكلي يستخدم في صناعة الطباعة والتنضيد. كان ببساطة نصشكلي يستخدم في صناعة الطباعة والتنضيد. كان النصالوهمي القياسي في';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff880e4f),
        toolbarHeight: 0,
        elevation: 0,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _appBaer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: 'imgUrl-${widget.imgUrl}',
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(widget.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Hero(
                      tag: 'title-${widget.title}',
                      child: Text(
                        widget.title,
                        style: AppTheme.heading,
                      ),
                    ),
                  ),
                  Center(
                    child: SmoothStarRating(
                      rating: 4,
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
                  RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: contant,
                          style: AppTheme.subHeading,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
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
                        onTap: () => callNumber(widget.phoneNumber),
                        child: Row(
                          children: [
                            Text(
                              widget.phoneNumber,
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ChewieVideo(),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getTranslated(context, 'ratings'),
                        style: AppTheme.heading,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            addComment = !addComment;
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              getTranslated(context, 'add_comment'),
                              style: AppTheme.heading,
                            ),
                            Icon(
                              Icons.add_comment,
                              size: 20,
                              color: Color(0xfff880e4f),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  (addComment == false)
                      ? Container()
                      : Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.edit,
                                  color: customColor,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  getTranslated(context, 'rate'),
                                  style: AppTheme.heading,
                                ),
                                SizedBox(width: 5),
                                SmoothStarRating(
                                  rating: rating,
                                  size: 20,
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
                            SizedBox(height: 10),
                            CustomButton(
                              text: getTranslated(context, 'addition'),
                              onPress: () {},
                            ),
                          ],
                        ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height) - 200,
                    child: _gridViewCount(),
                  ),
                ],
              ),
            ),
          ],
        ),
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

  callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  _gridViewCount() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
      shrinkWrap: true,
      children: List.generate(
        10,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Card(
              // color:  Color(0xfff880e4f),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              elevation: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: AppTheme.containerBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: 60,
                          width: (MediaQuery.of(context).size.width) * .2,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.imgUrl),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: SmoothStarRating(
                          rating: 4,
                          size: 15,
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
                      Center(
                        child: Text(
                          widget.title,
                          textDirection: TextDirection.rtl,
                          style: AppTheme.heading.copyWith(color: Colors.white),
                        ),
                      ),
                      Text(
                        'لوريم إيبسوم هو ببساطة نصشكلي يستخدم في صناعة الطباعة والتنضيد. كان النصالوهمي',
                        textDirection: TextDirection.rtl,
                        style: AppTheme.subHeading.copyWith(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
