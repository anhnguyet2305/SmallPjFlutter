import 'package:flutter/material.dart';
import 'package:food/screens/body_home.dart';
import 'package:food/components/box_button.dart';
import 'package:food/components/tab_login2.dart';
import 'package:hexcolor/hexcolor.dart';

class TabLogin1 extends StatefulWidget {
  @override
  _TabLogin1State createState() => _TabLogin1State();
}

class _TabLogin1State extends State<TabLogin1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("F2F2F2"),
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TextField(
                controller: _userController,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  errorText: _userInvalid ? _usererror : null,
                  labelText: "Email Address",
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: _passController,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                obscureText: !_showPass,
                decoration: InputDecoration(
                  errorText: _passInvalid ? _passerror : null,
                  labelText: "Password",
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 100.0,
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: OnForgotPass,
                    child: const Text(
                      "Forgot Passcode?",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
              ),
              Button(
                  onPressed: () {
                    OnToggleSignIn();
                  },
                  buttonTitle: "Sign In"),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  bool _showPass = false;
  var _usererror = "Email Invalid";
  var _passerror = "Password Invalid";
  var _userInvalid = false;
  var _passInvalid = false;
  void OnToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void OnForgotPass() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: TabLogin2(),
            );
          },
        ),
      );
    });
  }

  void OnToggleSignIn() {
    setState(() {
      if (_userController.text.length < 6 ||
          !_userController.text.contains('@')) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }
      if (_passController.text.length < 6) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }
      if (!_userInvalid && !_passInvalid) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
      }
    });
  }
}
