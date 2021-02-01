import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/model/Chat.dart';
import 'package:vanillia/model/data.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/screenes/search.dart';
import 'package:vanillia/screenes/wrapper/home/menu/menu.dart';
import 'package:vanillia/screenes/wrapper/home/menu/offersPage.dart';
import 'package:vanillia/screenes/wrapper/home/wallPaper_tabs.dart';
import 'package:vanillia/services/helper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  getUserInfo() async {
    UserData.name = await DBHelper.getUserUserName();
    UserData.pasword = await DBHelper.getUserUserPassrod();
    UserData.email = await DBHelper.getUserUserEmail();
    UserData.userImageUrl = await DBHelper.getuserImageUrl();
    UserData.appLang = await DBHelper.getAppLang();
  }

  @override
  void initState() {
    getUserInfo();
    print('userLang:' + UserData.appLang.toString());
    super.initState();
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
          homeAppBarr(),
          SizedBox(height: 15),
          First(),
        ],
      ),
    );
  }

  Widget homeAppBarr() {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 85,
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
          Text(
            getTranslated(context, 'vanillia'),
            style: AppTheme.heading.copyWith(
              color: Colors.white,
              fontSize: 14,
            ),
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
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.messenger,
                  //     color: Colors.white,
                  //   ),
                  //   onPressed: () {
                  //     Navigator.of(context).push(
                  //       MaterialPageRoute(
                  //         builder: (_) => Messages(),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Chat> items = List.of(Data.chats);

    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'اعلان',
                style: AppTheme.heading.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            getTranslated(context, 'offers'),
            style: AppTheme.heading,
          ),
          Container(
            height: 130,
            child: ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => OffersPage(
                            item: items[i],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 250,
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
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * .37,
                                child: RichText(
                                  textDirection: TextDirection.rtl,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: items[i].username,
                                        style: AppTheme.heading
                                            .copyWith(fontSize: 9),
                                      ),
                                      TextSpan(
                                        text: '\n',
                                      ),
                                      TextSpan(
                                        text: items[i].message,
                                        style: AppTheme.subHeading
                                            .copyWith(fontSize: 9),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(items[i].imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 97,
            child: WallPaperTabs(),
          ),
        ],
      ),
    );
  }
}
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // @override
//   // void initState() {
//   //   getUserInfo();
//   //   super.initState();
//   // }

//   // getUserInfo() async {
//   //   UserData.isSelectedImage = await DBHelper.getUserselectedProImage();
//   //   print('isSelected bef:' + UserData.isSelectedImage.toString());
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // getUserInfo();
//     print('isSelected bulid:' + UserData.isSelectedImage.toString());

//     if (UserData.isSelectedImage == true) {
//       return Home();
//     } else {
//       return UserImagePicker();
//     }
//   }
// }
