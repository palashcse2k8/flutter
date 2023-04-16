import 'package:flutter/material.dart';
import 'package:flutterbascis/firebasebasics/constants/colors.dart';
import 'package:flutterbascis/firebasebasics/constants/image_strings.dart';
import 'package:flutterbascis/firebasebasics/constants/sizes.dart';
import 'package:flutterbascis/firebasebasics/constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            child: Image(image: AssetImage(appSplashTopIcon)),
          ),
          Positioned(
              top: 125,
              left: appDefaultSize,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [Text(appName), Text(appTagLine)],
              )),
          const Positioned(
            bottom: 150,
            right: 100,
            child: Image(image: AssetImage(appSplashImage)),
          ),
          Positioned(
            bottom: 40,
            right: 100,
            child: Container(
              width: appSplashContainerSize,
              height: appSplashContainerSize,
              color: appPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
