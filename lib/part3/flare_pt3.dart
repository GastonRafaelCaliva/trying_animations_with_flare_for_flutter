import 'package:flutter/material.dart';
import 'package:smart_flare/smart_flare.dart';

class FlarePT3 extends StatefulWidget {
  const FlarePT3({Key key}) : super(key: key);
  
  @override
  State<FlarePT3> createState() => _FlarePT3State();
}

class _FlarePT3State extends State<FlarePT3> {
  @override
  Widget build(BuildContext context) {
    var animationWidth = 295.0;
    var animationHeight = 251.0;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SmartFlareActor(
          width: animationWidth,
          height: animationHeight,
          filename: 'assets/button-animation.flr',
          startingAnimation: 'deactivate',
        ),
      ),
    );
  }
}