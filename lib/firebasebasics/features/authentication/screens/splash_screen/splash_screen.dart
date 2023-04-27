import 'package:flutter/material.dart';
import 'package:flutterbascis/firebasebasics/constants/colors.dart';
import 'package:flutterbascis/firebasebasics/constants/image_strings.dart';
import 'package:flutterbascis/firebasebasics/constants/sizes.dart';
import 'package:flutterbascis/firebasebasics/constants/text_strings.dart';
import 'package:flutterbascis/firebasebasics/features/authentication/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimate();

    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: splashScreenController.animate.value ? 0 : -30,
              left: splashScreenController.animate.value ? 0 : -30,
              child: const Image(image: AssetImage(appSplashTopIcon)),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 125,
                left:
                    splashScreenController.animate.value ? appDefaultSize : -80,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: splashScreenController.animate.value ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [Text(appName), Text(appTagLine)],
                  ),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: 150,
              right: splashScreenController.animate.value ? 100 : 0,
              child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: splashScreenController.animate.value ? 1 : 0,
                  child: const Image(image: AssetImage(appSplashImage))),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashScreenController.animate.value ? 40 : 0,
              right: splashScreenController.animate.value ? appDefaultSize : 0,
              child: AnimatedOpacity(
                opacity: splashScreenController.animate.value ? 1 : 0,
                duration: const Duration(milliseconds: 2400),
                child: Container(
                  width: appSplashContainerSize,
                  height: appSplashContainerSize,
                  decoration: BoxDecoration(
                      color: appPrimaryColor,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
