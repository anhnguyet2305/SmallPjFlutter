import 'package:flutter/material.dart';
import 'package:food/components/logo_container.dart';
import 'package:food/components/tab_login1.dart';
import 'package:food/components/tab_login2.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 0, right: 0, bottom: 0),
        color: Colors.white,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 160.0,
              child: Logo(
                width: 100,
                height: 100,
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    bottomOpacity: 2.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      ),
                    ),
                    backgroundColor: HexColor('#FFFFFF'),
                    title: TabBar(
                      indicatorColor: HexColor('#FA4A0C'),
                      indicatorWeight: 2.5,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: const [
                        Tab(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: TabBarView(
                          children: [TabLogin1(), TabLogin2()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
