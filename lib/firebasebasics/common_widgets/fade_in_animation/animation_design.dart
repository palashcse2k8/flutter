import 'package:flutter/material.dart';
import 'package:flutterbascis/firebasebasics/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:get/get.dart';
import 'fade_in_animation_controller.dart';

class CustomFadeInAnimation extends StatelessWidget {
  CustomFadeInAnimation(
      {super.key,
      required this.durationInMs,
      this.animatePosition,
      required this.child});

  final splashScreenController = Get.put(FadeInAnimationController());
  final int durationInMs;
  final AnimatePosition? animatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
          duration: Duration(milliseconds: durationInMs),
          top: splashScreenController.animate.value
              ? animatePosition?.topAfter
              : animatePosition?.topBefore,
          bottom: splashScreenController.animate.value
              ? animatePosition?.bottomAfter
              : animatePosition?.bottomBefore,
          left: splashScreenController.animate.value
              ? animatePosition?.leftAfter
              : animatePosition?.leftBefore,
          right: splashScreenController.animate.value
              ? animatePosition?.rightAfter
              : animatePosition?.rightBefore,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: durationInMs),
            opacity: splashScreenController.animate.value ? 1 : 0,
            child: child,
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: const [Text(appName), Text(appTagLine)],
            // ),
          )),
    );
  }
}
