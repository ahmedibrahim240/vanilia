import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/model/user.dart';

const customColor = Color(0xfff880e4f);

const String vanilliaUrl = 'https://vanillia.net/Vanillia/';
const String registerServiceUrl =
    'https://vanillia.net/Vanillia/RegisterService';

List<String> listImages = [
  'https://images.pexels.com/photos/5913177/pexels-photo-5913177.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2658450/pexels-photo-2658450.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6070129/pexels-photo-6070129.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/4786952/pexels-photo-4786952.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/4709027/pexels-photo-4709027.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2886574/pexels-photo-2886574.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/4297812/pexels-photo-4297812.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5478104/pexels-photo-5478104.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2308891/pexels-photo-2308891.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5659558/pexels-photo-5659558.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5715253/pexels-photo-5715253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5438825/pexels-photo-5438825.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6154624/pexels-photo-6154624.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6227427/pexels-photo-6227427.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/1535422/pexels-photo-1535422.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/3989578/pexels-photo-3989578.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/6032603/pexels-photo-6032603.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5309143/pexels-photo-5309143.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5615782/pexels-photo-5615782.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5997712/pexels-photo-5997712.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5566812/pexels-photo-5566812.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5326990/pexels-photo-5326990.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2774197/pexels-photo-2774197.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/3071625/pexels-photo-3071625.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/5652782/pexels-photo-5652782.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
];

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPress;
  CustomButton({this.onPress, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: MaterialButton(
          onPressed: onPress,
          minWidth: double.infinity,
          height: 48,
          child: Text(
            text,
            style: AppTheme.heading.copyWith(
              fontSize: 14,
              color: Color(0xfff880e4f),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDropMenuBottom extends StatefulWidget {
  final List<String> list;
  final String title;
  CustomDropMenuBottom({this.list, this.title});
  @override
  _CustomDropMenuBottomState createState() => _CustomDropMenuBottomState();
}

class _CustomDropMenuBottomState extends State<CustomDropMenuBottom> {
  List<DropdownMenuItem<String>> _dropDownItems1;
  String _selectedItems1;
  @override
  void initState() {
    _dropDownItems1 = buildDropDwonNemuItems(widget.list);
    _selectedItems1 = _dropDownItems1[0].value;
    super.initState();
  }

  String answer =
      'balblblblbblblblblblblblbblbbblblblblbblblbblblbblblbbbalbblablablablalbalbalblablalbalblablablalbalbalblablalbalbalblalbal';
  List<DropdownMenuItem<String>> buildDropDwonNemuItems(List<String> list) {
    List<DropdownMenuItem<String>> items = List();
    for (var item in list) {
      items.add(
        DropdownMenuItem(
          value: item,
          child: Text(item),
        ),
      );
    }
    return items;
  }

  onChanged1(String selectedItems) {
    setState(() {
      _showSettingsPanel(context, _selectedItems1, answer);
      _selectedItems1 = selectedItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10, left: 13),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: AppTheme.heading,
            ),
            DropdownButton(
              elevation: 0,
              dropdownColor: Colors.white,
              focusColor: Colors.white,
              isDense: true,
              underline: Container(),
              iconSize: 25,
              icon: Icon(
                Icons.arrow_drop_down_circle_outlined,
                color: Colors.black,
              ),
              items: _dropDownItems1,
              onChanged: onChanged1,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}

Container menuDropListViue(List<String> list, BuildContext context) {
  String answer =
      'balblblblbblblblblblblblbblbbblblblblbblblbblblbblblbbbalbblablablablalbalbalblablalbalblablablalbalbalblablalbalbalblalbal';
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 100,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (conText, int i) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                _showSettingsPanel(context, list[i], answer);
              },
              child: Text(list[i], style: AppTheme.subHeading),
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
          ],
        );
      },
    ),
  );
}

void _showSettingsPanel(BuildContext context, String title, String answer) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(35.0),
    ),
    context: context,
    enableDrag: true,
    builder: (context) {
      return Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          decoration: BoxDecoration(
            gradient: AppTheme.containerBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTheme.heading.copyWith(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                answer,
                style: AppTheme.subHeading.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class DismissibleWidget<T> extends StatelessWidget {
  final T item;
  final Widget child;
  final DismissDirectionCallback onDismissed;

  const DismissibleWidget({
    @required this.item,
    @required this.child,
    @required this.onDismissed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Dismissible(
        key: UniqueKey(),
        background: buildSwipeActionRight(),
        child: child,
        onDismissed: onDismissed,
      );
  Widget buildSwipeActionRight() => Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: Icon(Icons.delete_forever, color: Colors.white, size: 32),
      );
}

Future<void> launchMessageToWhatsApp(
    {@required String phoneNum, String massage}) async {
  String url = 'whatsapp://send?phone=$phoneNum&text=$massage';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}

PreferredSizeWidget customAppBar(Widget title) => AppBar(
      centerTitle: true,
      toolbarHeight: 50,
      backgroundColor: Color(0xfff880e4f),
      title: title,
    );

class CityList extends StatefulWidget {
  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  List<String> _listCity = [
    'المنصورة',
    'القاهرة',
    'الاسكندرية',
    'الاسماعلية',
  ];
  List<DropdownMenuItem<String>> _dropDownItems1;
  List<DropdownMenuItem<String>> buildDropDwonNemuItems(List<String> list) {
    List<DropdownMenuItem<String>> items = List();
    for (var item in list) {
      items.add(
        DropdownMenuItem(
          value: item,
          child: Text(item),
        ),
      );
    }
    return items;
  }

  onChanged(String selectedItems) {
    setState(() {
      _selectedItems1 = selectedItems;
    });
  }

  String _selectedItems1;

  @override
  void initState() {
    super.initState();
    _dropDownItems1 = buildDropDwonNemuItems(_listCity);
    _selectedItems1 = _dropDownItems1[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: (UserData.appLang == 'ar_EG')
          ? [
              Icon(
                Icons.location_pin,
                color: Colors.white,
              ),
              DropdownButton(
                style: AppTheme.heading.copyWith(
                  color: Colors.pinkAccent,
                ),
                hint: Text(
                  _selectedItems1,
                  style: AppTheme.heading.copyWith(
                    color: Colors.white,
                  ),
                ),
                elevation: 0,
                dropdownColor: Colors.white,
                focusColor: Colors.white,
                underline: Container(
                  height: 2,
                  color: Colors.grey[300],
                ),
                iconEnabledColor: Colors.white,
                iconSize: 25,
                items: _dropDownItems1,
                onChanged: onChanged,
              ),
            ]
          : [
              DropdownButton(
                style: AppTheme.heading.copyWith(
                  color: Colors.pinkAccent,
                ),
                elevation: 0,
                hint: Text(
                  _selectedItems1,
                  style: AppTheme.heading.copyWith(
                    color: Colors.white,
                  ),
                ),
                dropdownColor: Colors.white,
                focusColor: Colors.white,
                underline: Container(
                  height: 2,
                  color: Colors.grey[300],
                ),
                iconEnabledColor: Colors.white,
                iconSize: 25,
                items: _dropDownItems1,
                onChanged: onChanged,
              ),
              Icon(
                Icons.location_pin,
                color: Colors.white,
              ),
            ],
    );
  }
}
