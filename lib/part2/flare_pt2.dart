import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';

class FlarePT2 extends StatefulWidget {
  const FlarePT2({Key key}) : super(key: key);
  
  @override
  State<FlarePT2> createState() => _FlarePT2State();
}

class _FlarePT2State extends State<FlarePT2> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purple,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SmartFlareAnimation()
      ),
    );
  }
}

enum AnimationToPlay {
  activate,
  deactivate,
  cameraTapped,
  pulseTapped,
  imageTapped
}

class SmartFlareAnimation extends StatefulWidget {
  const SmartFlareAnimation({Key key}) : super(key: key);
  
  @override
  State<SmartFlareAnimation> createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  // ancho y alto recuperados de los valores de la artboard del archivo flr (linea 10 y 11) 
  static const double animationWidth = 295.0;
  static const double animationHeight = 251.0;

  AnimationToPlay _lastPlayedAnimation;

  // Controles de animación de Flare
  final FlareControls animationControls = FlareControls();

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: animationWidth,
      height: animationHeight,
      child: GestureDetector(
          onTapUp: (tapInfo) {
            var localTouchPosition = (context.findRenderObject() as RenderBox)
                .globalToLocal(tapInfo.globalPosition);

            var topHalfTouched = localTouchPosition.dy < animationHeight / 2;

            var leftSideTouched = localTouchPosition.dx < animationWidth / 3;

            var rightSideTouched = localTouchPosition.dx > (animationWidth / 3) * 2;

            var middleTouched = !leftSideTouched && !rightSideTouched;

            if (leftSideTouched && topHalfTouched) {
              _setAnimationToPlay(AnimationToPlay.cameraTapped);
            } else if (middleTouched && topHalfTouched) {
              _setAnimationToPlay(AnimationToPlay.pulseTapped);
            } else if (rightSideTouched && topHalfTouched) {
              _setAnimationToPlay(AnimationToPlay.imageTapped);
            } else {
              if (isOpen) {
                _setAnimationToPlay(AnimationToPlay.deactivate);
              } else {
                _setAnimationToPlay(AnimationToPlay.activate);
              }

              isOpen = !isOpen;
            }
          },
          child: FlareActor(
            'assets/button-animation.flr',
            controller: animationControls, 
            animation: 'deactivate',
          )
        ),
    );
  }

  String _getAnimationName(AnimationToPlay animationToPlay) {
    switch (animationToPlay) {
      case AnimationToPlay.activate:
        return 'activate';
      case AnimationToPlay.deactivate:
        return 'deactivate';
      case AnimationToPlay.cameraTapped:
        return 'camera_tapped';
      case AnimationToPlay.pulseTapped:
        return 'pulse_tapped';
      case AnimationToPlay.imageTapped:
        return 'image_tapped';
      default:
        return 'deactivate';
    }
  }

  void _setAnimationToPlay(AnimationToPlay animation) {
    var isTappedAnimation = _getAnimationName(animation).contains("_tapped");
    if (isTappedAnimation &&
        _lastPlayedAnimation == AnimationToPlay.deactivate) {
      return;
    }

    animationControls.play(_getAnimationName(animation));

    _lastPlayedAnimation = animation;
  }
}