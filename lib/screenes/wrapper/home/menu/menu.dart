import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/model/data.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/screenes/wrapper/home/home.dart';
import 'package:vanillia/screenes/wrapper/home/menu/appinfo/app_info.dart';
import 'package:vanillia/screenes/wrapper/home/menu/myprofile.dart';
import 'package:vanillia/screenes/wrapper/home/menu/notifications.dart';
import 'package:vanillia/screenes/wrapper/home/menu/offers.dart';
import 'package:vanillia/services/database.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Widget> _menuItems = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addItems();
    });
  }

  void _addItems() {
    List<MenuData> _data = [
      MenuData(
        title: getTranslated(context, 'home_page'),
        icon: Icons.home,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => Home(),
            ),
          );
        },
      ),
      MenuData(
        title: getTranslated(context, 'notifications'),
        icon: Icons.notifications,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => Notifications(),
            ),
          );
        },
      ),
      MenuData(
        title: getTranslated(context, 'offers'),
        icon: Icons.local_offer,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => Offers(),
            ),
          );
        },
      ),
      MenuData(
        title: getTranslated(context, 'About_app'),
        icon: Icons.info_outline,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AppInfo(),
            ),
          );
        },
      ),
    ];

    Future futureItems = Future(() {});
    _data.forEach((MenuData items) {
      futureItems = futureItems.then((data) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _menuItems.add(_buildTile(items));
          _listKey.currentState.insertItem(_menuItems.length - 1);
        });
      });
    });
  }

  _buildTile(MenuData items) {
    return MenuItems(
      onTap: items.onTap,
      child: Row(
        children: [
          Icon(
            items.icon,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(width: 10),
          Text(
            items.title,
            style: AppTheme.heading.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.containerBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          children: [
            userInfo(),
            SizedBox(height: 10),
            AnimatedList(
              key: _listKey,
              shrinkWrap: true,
              initialItemCount: _menuItems.length,
              itemBuilder: (context, index, animation) {
                return Column(
                  children: [
                    SlideTransition(
                      position: animation.drive(_offset),
                      child: _menuItems[index],
                    ),
                    SizedBox(height: 30),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  userInfo() {
    final user = Provider.of<User>(context);
    return StreamBuilder<Users>(
        stream: DatabaseServices(userId: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Users userData = snapshot.data;
            return GestureDetector(
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => UserProfile(),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'userImg',
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 60,
                      backgroundImage: NetworkImage(
                        userData.userImageUrl,
                      ),
                      // AssetImage('lib/images/person.jpg'),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    userData.name,
                    style: AppTheme.heading.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Divider(
                    height: 4,
                    color: Colors.grey[900],
                  ),
                ],
              ),
            );
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

class MenuItems extends StatefulWidget {
  final Function onTap;
  final Widget child;
  MenuItems({@required this.child, this.onTap});
  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: widget.child,
    );
  }
}
