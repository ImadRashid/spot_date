import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotadate/screens/onboarding.dart';
import 'package:spotadate/screens/wrapper.dart';
// import 'package:gymapp/authentication/login.dart';
// import 'package:gymapp/models/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Wrapper())));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/heartsplash.svg',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          // Icon(
                          //   Icons.shopping_cart,

                          //   color: Colors.greenAccent,
                          //   size: 50.0,
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
