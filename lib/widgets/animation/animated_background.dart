import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:everything_flutter/helpers/app_colors.dart';

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(
          Duration(seconds: 3),
          ColorTween(
              begin: AppColors.THALLIUM_FLAME, end: AppColors.TOMB_BLUE)),
      Track("color2").add(
          Duration(seconds: 3),
          ColorTween(
              begin: AppColors.SPANISH_BLUE, end: AppColors.BRACING_BLUE))
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}
