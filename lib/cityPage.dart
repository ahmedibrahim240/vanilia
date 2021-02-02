import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(Text('city')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, i) {
          return ListTile(
            onTap: () => Navigator.of(context).pop(),
            leading: Icon(
              Icons.location_pin,
              color: customColor,
            ),
            title: Text(
              'المنصوره',
              style: AppTheme.heading,
            ),
          );
        },
      ),
    );
  }
}
