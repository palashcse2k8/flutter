import 'package:flutter/material.dart';
import 'package:flutterbascis/firebasebasics/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:flutterbascis/firebasebasics/constants/colors.dart';
import 'package:flutterbascis/firebasebasics/constants/image_strings.dart';
import 'package:flutterbascis/firebasebasics/constants/sizes.dart';
import 'package:flutterbascis/firebasebasics/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common_widgets/fade_in_animation/animation_design.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashScreenController = Get.put(FadeInAnimationController());
    splashScreenController.startAnimate();
    return Scaffold(
      body: Stack(
        children: [
          CustomFadeInAnimation(
            durationInMs: 1600,
            animatePosition: AnimatePosition(
              topAfter: 0,
              topBefore: -30,
              leftAfter: 0,
              leftBefore: -30,
            ),
            child: const Image(
              image: AssetImage(appSplashTopIcon),
            ),
          ),
          CustomFadeInAnimation(
            durationInMs: 2000,
            animatePosition: AnimatePosition(
              topAfter: 80,
              topBefore: 80,
              leftAfter: appDefaultSize,
              leftBefore: -80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [Text(appName), Text(appTagLine)],
            ),
          ),
          CustomFadeInAnimation(
            durationInMs: 2400,
            animatePosition: AnimatePosition(bottomAfter: 150, bottomBefore: 0, leftBefore: 0, leftAfter: 100),
            child: const Image(
              image: AssetImage(appSplashImage),
            ),
          ),
          CustomFadeInAnimation(
            durationInMs: 2400,
            animatePosition: AnimatePosition(
              bottomBefore: 0,
              bottomAfter: 60,
              rightBefore: appDefaultSize,
              rightAfter: appDefaultSize,
            ),
            child: Container(
              width: appSplashContainerSize,
              height: appSplashContainerSize,
              decoration: BoxDecoration(
                  color: appPrimaryColor,
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
        ],
      ),
    );
  }
}
