import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
// import 'package:vanillia/screenes/wrapper/authenticate/passwordRecovery.dart';
import 'package:vanillia/services/auth.dart';
import 'package:vanillia/services/database.dart';
import 'package:vanillia/services/helper.dart';

class LogIn extends StatefulWidget {
  final Function toggleView;
  LogIn({this.toggleView});
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  DatabaseServices _databaseServices = DatabaseServices();

  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  bool obscurePassword = true;
  saveUserLogInINfo(String email, String pasword) {
    DBHelper.saveUserSingIn(true);
    QuerySnapshot _snapshot;
    _databaseServices.getUserByUseremail(email).then(
      (val) {
        setState(() {
          _snapshot = val;
        });
        DBHelper.saveUserUserName(_snapshot.documents[0].data['name']);
        DBHelper.saveUserImageUrl(_snapshot.documents[0].data['userImageUrl']);
        DBHelper.saveUserUserEmail(_snapshot.documents[0].data['email']);
        DBHelper.saveUserUserPassrod(pasword);
        DBHelper.saveUserUserPhoneNumber(
            _snapshot.documents[0].data['phoneNamber']);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xfff880e4f).withOpacity(.8),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xfff880e4f),
      ),
      body: (loading)
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(
                  top: 80, left: 30, right: 30, bottom: 10),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslated(context, 'welcome'),
                        style: AppTheme.heading.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: textFormInputDecoration(
                              Icons.email,
                              getTranslated(context, 'email'),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'please enter an email' : null,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                          ),
                          SizedBox(height: 20),
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
                            validator: (val) =>
                                val.isEmpty ? 'please enter a password' : null,
                            obscureText: obscurePassword,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                          SizedBox(height: 20),
                          CustomButton(
                            onPress: () async {
                              if (_formKey.currentState.validate()) {
                                saveUserLogInINfo(email, password);
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(
                                    () {
                                      error = 'envild email or password';
                                      loading = false;
                                    },
                                  );
                                }
                              }
                            },
                            text: getTranslated(context, 'Entry'),
                          ),
                          SizedBox(height: 12),
                          Text(
                            error,
                            style:
                                AppTheme.heading.copyWith(color: Colors.white),
                          ),
                          SizedBox(height: 20),
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
                          SizedBox(height: 20),
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
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                getTranslated(context, 'forget'),
                                style: AppTheme.heading.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (_) => PasswordRecovery(),
                                  //   ),
                                  // );
                                },
                                child: Text(
                                  getTranslated(context, 'password?'),
                                  style: AppTheme.heading.copyWith(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * .15),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    getTranslated(context, 'havent_account'),
                                    style: AppTheme.heading.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => widget.toggleView(),
                                    child: Text(
                                      getTranslated(context, 'create_account'),
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
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
