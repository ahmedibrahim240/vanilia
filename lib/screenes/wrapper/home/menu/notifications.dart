import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/model/Chat.dart';
import 'package:vanillia/model/data.dart';
import 'package:vanillia/model/utils.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Chat> items = List.of(Data.chats);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        Text(
          getTranslated(context, 'notifications'),
          style: AppTheme.heading.copyWith(
            color: Colors.white,
          ),
        ),
        80,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: height,
            width: width,
            child: ListView.separated(
              itemCount: items.length,
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final item = items[index];

                return DismissibleWidget(
                  item: item,
                  child: buildListTile(item, width, height),
                  onDismissed: (direction) =>
                      dismissItem(context, index, direction),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void dismissItem(
      BuildContext context, int index, DismissDirection direction) {
    setState(() {
      items.removeAt(index);
    });

    switch (direction) {
      case DismissDirection.endToStart:
        Utils.showSnackBar(context, getTranslated(context, 'deleting_done'));
        break;
      default:
        break;
    }
  }

  Widget buildListTile(Chat item, double width, double heigt) => ListTile(
        contentPadding: EdgeInsets.all(8),
        leading: Container(
          height: 100,
          width: width * .2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(item.imgUrl),
            ),
          ),
        ),
        title: Text(
          item.username,
          textDirection: TextDirection.rtl,
          style: AppTheme.heading,
        ),
        subtitle: Text(
          item.message,
          textDirection: TextDirection.rtl,
          style: AppTheme.subHeading,
        ),
      );

  // InkWell(
  //   onTap: () {},
  //   child: Container(
  //     height: 121,
  //     width: width,
  //     padding: EdgeInsets.all(10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.end,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Container(
  //               width: width * .7,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 children: [
  //                   Text(
  //                     item.username,
  //                     style: AppTheme.heading,
  //                   ),
  //                   Text(
  //                     item.message,
  //                     style: AppTheme.subHeading,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               height: 100,
  //               width: width * .2,
  //               decoration: BoxDecoration(
  //                 image: DecorationImage(
  //                   image: AssetImage(item.imgUrl),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   ),
  // );
}
