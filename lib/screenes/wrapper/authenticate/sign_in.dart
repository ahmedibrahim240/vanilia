import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/services/auth.dart';
import 'package:vanillia/services/helper.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String name = '';
  String userImageUrl =
      'https://img.icons8.com/pastel-glyph/2x/person-male.png';
  String phoneNumber = '';
  String password = '';
  String confirmPassword = '';
  String error = '';
  List<String> _listCity = [
    'المنصورة',
    'القاهرة',
    'الاسكندرية',
    'الاسماعلية',
  ];
  List<DropdownMenuItem<String>> _dropDownItems1;
  String _selectedItems1;
  bool obscurePassword = true;
  bool obscureconPassword = true;
  @override
  void initState() {
    super.initState();
    _dropDownItems1 = buildDropDwonNemuItems(_listCity);
    _selectedItems1 = _dropDownItems1[0].value;
  }

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff880e4f).withOpacity(.8),
      body: (loading)
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          getTranslated(context, 'Join_family'),
                          style: AppTheme.heading.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            validator: (val) =>
                                val.isEmpty ? 'please enter your name' : null,
                            onChanged: (val) {
                              setState(() {
                                name = val;
                              });
                            },
                            decoration: textFormInputDecoration(
                              Icons.person,
                              getTranslated(context, 'name'),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.white),
                            validator: (val) => val.isEmpty
                                ? 'please enter your phone number'
                                : null,
                            onChanged: (val) {
                              setState(() {
                                phoneNumber = val;
                              });
                            },
                            decoration: textFormInputDecoration(
                              Icons.phone,
                              getTranslated(context, 'phone_num'),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            validator: (val) =>
                                val.isEmpty ? 'please enter an email' : null,
                            decoration: textFormInputDecoration(
                              Icons.email,
                              getTranslated(context, 'email'),
                            ),
                            onChanged: (val) {
                              setState(
                                () {
                                  email = val;
                                },
                              );
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: textFormInputDecorationForPassword(
                              Icons.visibility_off,
                              getTranslated(context, 'password'),
                              () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              obscurePassword,
                            ),
                            validator: (val) => validatePassord(val),
                            obscureText: obscurePassword,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: textFormInputDecorationForPassword(
                              Icons.visibility_off,
                              getTranslated(context, 'Confirm_password'),
                              () {
                                setState(() {
                                  obscureconPassword = !obscureconPassword;
                                });
                              },
                              obscureconPassword,
                            ),
                            validator: (val) => validateConfrimPassord(
                                val, password, confirmPassword),
                            obscureText: obscureconPassword,
                            onChanged: (val) {
                              setState(() {
                                confirmPassword = val;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Colors.white,
                              ),
                              Text(
                                getTranslated(context, 'choose_city'),
                                style: AppTheme.heading.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 50),
                              DropdownButton(
                                style: AppTheme.heading.copyWith(
                                  color: Colors.white,
                                ),
                                elevation: 0,
                                value: _selectedItems1,
                                dropdownColor: Color(0xfff880e4f),
                                focusColor: Colors.white,
                                isDense: true,
                                underline: Container(
                                  height: 2,
                                  color: Colors.grey[300],
                                ),
                                iconEnabledColor: Colors.white,
                                iconSize: 25,
                                items: _dropDownItems1,
                                onChanged: onChanged,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomButton(
                            onPress: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                DBHelper.saveUserUserEmail(email);
                                DBHelper.saveUserSingIn(true);
                                DBHelper.saveUserUserPassrod(password);
                                DBHelper.saveUserUserName(name);
                                DBHelper.saveUserImageUrl(userImageUrl);
                                DBHelper.saveUserUserPhoneNumber(phoneNumber);
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                  email,
                                  password,
                                  name,
                                  phoneNumber,
                                  userImageUrl,
                                );
                                if (result == null) {
                                  setState(
                                    () {
                                      error = 'plwase supply a vaild email';
                                      loading = false;
                                    },
                                  );
                                }
                              }
                            },
                            text: getTranslated(context, 'Sing_up'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            error,
                            style: AppTheme.heading.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 1,
                                width: width * .3,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                getTranslated(context, 'or'),
                                style: AppTheme.heading.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                height: 1,
                                width: width * .3,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: CircleAvatar(
                                  maxRadius: 25,
                                  backgroundImage:
                                      AssetImage('lib/images/twitter.png'),
                                ),
                                onTap: () {},
                              ),
                              // SizedBox(width: 20),
                              // InkWell(
                              //   child: Container(
                              //     width: width * .11,
                              //     height: 50,
                              //     decoration: BoxDecoration(
                              //       image: DecorationImage(
                              //         image: AssetImage('lib/images/iphone.png'),
                              //         fit: BoxFit.cover,
                              //       ),
                              //     ),
                              //   ),
                              //   onTap: () {},
                              // ),
                              // SizedBox(width: 20),
                              // InkWell(
                              //   child: CircleAvatar(
                              //     maxRadius: 25,
                              //     backgroundColor: Colors.white,
                              //     backgroundImage:
                              //         AssetImage('lib/images/google.png'),
                              //   ),
                              //   onTap: () {},
                              // ),
                              SizedBox(width: 20),
                              InkWell(
                                child: CircleAvatar(
                                  maxRadius: 25,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage('lib/images/facebock.png'),
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: height * .10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                getTranslated(context, 'have_account'),
                                style: AppTheme.heading.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () => widget.toggleView(),
                                child: Text(
                                  getTranslated(context, 'Entry'),
                                  style: AppTheme.heading.copyWith(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  String validatePassord(String val) {
    if (val.isEmpty) {
      return 'please enter a password';
    } else if (val.length < 6) {
      return 'the password should be at least 6 character';
    } else {
      return null;
    }
  }

  String validateConfrimPassord(
    String val,
    String password,
    String confrimPassord,
  ) {
    if (val.isEmpty) {
      return 'please enter a password';
    } else if (password != confirmPassword) {
      return 'password not matching';
    } else {
      return null;
    }
  }
}
