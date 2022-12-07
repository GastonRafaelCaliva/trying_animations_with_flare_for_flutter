import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FlarePT1 extends StatefulWidget {
  const FlarePT1({Key key}) : super(key: key);
  
  @override
  State<FlarePT1> createState() => _FlarePT1State();
}

class _FlarePT1State extends State<FlarePT1> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: GestureDetector(
        onTap: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: FlareActor(
          'assets/button-animation.flr',
          animation: isOpen ? 'activate' : 'deactivate'
        ),
      ),
    );
  }
}