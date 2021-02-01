import 'package:shared_preferences/shared_preferences.dart';

class DBHelper {
  static String sharedPrefUserSinginKey = 'IsSingIn';
  static String sharedPrefUserselectedProImage = 'IsSelected';
  static String sharedPrefAppLang = 'AppLan';
  static String sharedPrefUserName = 'UserName';
  static String sharedPrefUserUserEmail = 'UserEmail';
  static String sharedPrefUserUserPassrod = 'UserPassword';
  static String sharedPrefUserUserPhone = 'UserPhome';
  static String sharedPrefUserImageUrl = 'userImageUrl';
  //save data
  static Future<bool> saveUserSingIn(bool isSingin) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(sharedPrefUserSinginKey, isSingin);
  }

  static Future<bool> saveUserselectedProImage(bool isSelected) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPrefUserselectedProImage, isSelected);
  }

  static Future<bool> saveUserUserName(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPrefUserName, userName);
  }

  static Future<bool> saveAppLang(String appLang) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPrefAppLang, appLang);
  }

  static Future<bool> saveUserUserEmail(String userEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPrefUserUserEmail, userEmail);
  }

  static Future<bool> saveUserUserPassrod(String userPassrod) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPrefUserUserPassrod, userPassrod);
  }

  static Future<bool> saveUserUserPhoneNumber(String userPhoneNumber) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(
        sharedPrefUserUserPhone, userPhoneNumber);
  }

  static Future<bool> saveUserImageUrl(String userImageUrl) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPrefUserImageUrl, userImageUrl);
  }

  // getdata
  static getUserSingIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var isSingin = (preferences.getBool(sharedPrefUserSinginKey) ?? false);
    return isSingin;
  }

  static getUserselectedProImage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var isSelected =
        (preferences.getBool(sharedPrefUserselectedProImage) ?? false);
    return isSelected;
  }

  static getUserUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String name = preferences.getString(sharedPrefUserName);
    return name;
  }

  static getAppLang() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var appLang = preferences.getString(sharedPrefAppLang) ?? 'ar_EG';
    return appLang;
  }

  static getUserUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString(sharedPrefUserUserEmail);
    return email;
  }

  static getuserImageUrl() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userImageUrl = preferences.getString(sharedPrefUserImageUrl);
    return userImageUrl;
  }

  static getUserUserPassrod() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String password = preferences.getString(sharedPrefUserUserPassrod);
    return password;
  }

  static getUserUserPhoneNumber() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String phoneNamber = preferences.getString(sharedPrefUserUserPhone);
    return phoneNamber;
  }
}
