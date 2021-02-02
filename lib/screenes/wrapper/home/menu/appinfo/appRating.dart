import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';

class AppRating extends StatefulWidget {
  @override
  _AppRatingState createState() => _AppRatingState();
}

class _AppRatingState extends State<AppRating> {
  var rating = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        Text(
          getTranslated(context, 'share_your_opinion'),
          style: AppTheme.heading.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTranslated(context, 'your_rate'),
                  style: AppTheme.heading,
                ),
                SizedBox(height: 20),
                Center(
                  child: SmoothStarRating(
                    rating: rating,
                    isReadOnly: false,
                    size: 50,
                    filledIconData: Icons.star,
                    color: Colors.pink,
                    halfFilledIconData: Icons.star_half,
                    borderColor: Colors.pinkAccent,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    spacing: 2.0,
                    onRated: (value) {
                      // print("rating value -> $value");
                      // print("rating value dd -> ${value.truncate()}");
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  getTranslated(context, 'your_opinion'),
                  style: AppTheme.heading,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    getTranslated(context, 'your_opinion_suggestions'),
                    style: AppTheme.subHeading,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.grey[300],
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xfff880e4f),
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: double.infinity,
                      height: 48,
                      child: Text(
                        getTranslated(context, 'send'),
                        style: AppTheme.heading.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
