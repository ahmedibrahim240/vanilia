import 'package:flutter/material.dart';
import 'package:vanillia/cityPage.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/model/Chat.dart';
import 'package:vanillia/model/data.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/screenes/search.dart';
import 'package:vanillia/screenes/wrapper/home/menu/menu.dart';
import 'package:vanillia/screenes/wrapper/home/menu/offers.dart';
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
      drawer: Drawer(
        child: Menu(),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          homeAppBarr(),
          SizedBox(height: 5),
          First(),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
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
          ),
        ],
      ),
    );
  }

  Widget homeAppBarr() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xfff880e4f),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTranslated(context, 'vanillia'),
                style: AppTheme.heading.copyWith(
                  color: Colors.white,
                  fontSize: 10,
                ),
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
            height: 80,
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
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTranslated(context, 'offers'),
                style: AppTheme.heading.copyWith(fontSize: 14),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Offers(),
                  ),
                ),
                child: Text(
                  getTranslated(context, 'more'),
                  style: AppTheme.heading
                      .copyWith(fontSize: 14, color: customColor),
                ),
              ),
            ],
          ),
          Container(
            height: 110,
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
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(items[i].imgUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 870,
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
