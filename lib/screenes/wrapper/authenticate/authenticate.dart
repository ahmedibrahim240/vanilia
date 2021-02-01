import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/screenes/wrapper/authenticate/login.dart';
import 'package:vanillia/screenes/wrapper/authenticate/sign_in.dart';
import 'package:vanillia/screenes/wrapper/home/home.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      if (showSignIn) {
        return Container(
          child: LogIn(toggleView: toggleView),
        );
      } else {
        return Container(
          child: SignIn(toggleView: toggleView),
        );
      }
    } else {
      return Home();
    }
  }
}
