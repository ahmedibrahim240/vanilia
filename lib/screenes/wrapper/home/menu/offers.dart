import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/model/Chat.dart';
import 'package:vanillia/model/data.dart';
import 'package:vanillia/screenes/wrapper/home/menu/offersPage.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  List<Chat> items = List.of(Data.chats);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        Text(
          getTranslated(context, 'offers'),
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
            height: height - 100,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    InkWell(
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
                        height: height * .25,
                        width: width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.yellow[800],
                              Colors.yellow[600],
                              Colors.yellow[800],
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: width * .6,
                                  child: RichText(
                                    textDirection: TextDirection.rtl,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: items[i].username,
                                          style: AppTheme.heading
                                              .copyWith(fontSize: 13),
                                        ),
                                        TextSpan(
                                          text: '\n',
                                        ),
                                        TextSpan(
                                          text: items[i].message,
                                          style: AppTheme.subHeading
                                              .copyWith(fontSize: 13),
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
                                  image: AssetImage('lib/images/person2.png'),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
