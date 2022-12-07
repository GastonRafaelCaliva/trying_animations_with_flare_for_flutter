import 'package:flutter/material.dart';
import 'package:smart_flare/smart_flare.dart';

class FlarePT4 extends StatefulWidget {
  const FlarePT4({Key key}) : super(key: key);
  
  @override
  State<FlarePT4> createState() => _FlarePT4State();
}

class _FlarePT4State extends State<FlarePT4> {
  @override
  Widget build(BuildContext context) {
    var animationWidth = 295.0;
    var animationHeight = 251.0;

    //Espacio vacio del area de arriba (izquierda)
    var voidTopAreaWidth = animationWidth / 5.6;
    //Ancho de cada boton de arriba
    var leftTopAreaWidth = animationWidth / 4.3;
    var midTopAreaWidth = animationWidth / 4.45;
    var rightTopAreaWidth = animationWidth / 4.3;

    //Espacio vacio del area de arriba (arriba)
    var voidTopAreaHeight = animationHeight / 7.2;
    //Altura de cada boton de arriba
    var topAreaHeight = animationHeight / 3.7;

    //Espacio vacio del area de abajo 
    var voidBottomAreaWidth = animationWidth / 2.7;
    //Espacio del boton de abajo
    var cancelButtonAreaWidth = animationWidth / 3.35;
    //Espacio vacio del area de arriba (arriba)
    var voidBottomAreaHeight = animationHeight / 20;
    //Altura del boton de abajo
    var bottomAreaHeight = animationHeight / 2.9;

    var activeAreas = [
      ActiveArea(
        area: Rect.fromLTWH(
          voidTopAreaWidth, 
          voidTopAreaHeight, 
          leftTopAreaWidth, 
          topAreaHeight,
        ),
        debugArea: false,
        guardComingFrom: ['deactivate'],
        animationName: 'camera_tapped',
        onAreaTapped: () {
          print('Button "Camera" tapped');
        },
      ),
      
      ActiveArea(
        area: Rect.fromLTWH(
          voidTopAreaWidth + leftTopAreaWidth, 
          voidTopAreaHeight, 
          midTopAreaWidth, 
          topAreaHeight * 1.15,
        ),
        debugArea: false,
        guardComingFrom: ['deactivate'],
        animationName: 'pulse_tapped',
        onAreaTapped: () {
          print('Button "Pulse" tapped');
        },
      ),

      ActiveArea(
        area: Rect.fromLTWH(
          voidTopAreaWidth + leftTopAreaWidth + midTopAreaWidth, 
          voidTopAreaHeight, 
          rightTopAreaWidth, 
          topAreaHeight,
        ),
        debugArea: false,
        guardComingFrom: ['deactivate'],
        animationName: 'image_tapped',
        onAreaTapped: () {
          print('Button "Image" tapped');
        },
      ),

      ActiveArea(
        area: Rect.fromLTWH(
          voidBottomAreaWidth, 
          animationHeight / 2 + voidBottomAreaHeight, 
          cancelButtonAreaWidth, 
          bottomAreaHeight,
        ),
        debugArea: false,
        animationsToCycle: ['activate', 'deactivate'],
        onAreaTapped: () {
          print('Button "X" tapped');
        }
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.purple,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SmartFlareActor(
          width: animationWidth,
          height: animationHeight,
          filename: 'assets/button-animation.flr',
          startingAnimation: 'deactivate',
          activeAreas: activeAreas,
        ),
      ),
    );
  }
}