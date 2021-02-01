class User {
  final String uid;
  User({this.uid});
}

class UserData {
  static String uid;
  static var isSingin;
  static var isSelectedImage;
  static String phoneNumper;
  static var appLang;
  static String name;
  static String email;
  static String pasword;
  static String userImageUrl =
      'https://img.icons8.com/pastel-glyph/2x/person-male.png';
}

class Users {
  final String uid;

  final String phoneNumber;
  final String name;
  final String email;
  final String pasword;
  final String userImageUrl;

  Users({
    this.name,
    this.email,
    this.phoneNumber,
    this.pasword,
    this.userImageUrl,
    this.uid,
  });
}
