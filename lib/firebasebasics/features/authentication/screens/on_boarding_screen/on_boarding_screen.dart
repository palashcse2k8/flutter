import 'package:flutter/material.dart';
import 'package:flutterbascis/firebasebasics/constants/colors.dart';
import 'package:flutterbascis/firebasebasics/constants/image_strings.dart';
import 'package:flutterbascis/firebasebasics/constants/text_strings.dart';
import 'package:flutterbascis/firebasebasics/features/authentication/models/on_boarding_screen_model.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'on_boarding_page_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pages = [
      OnBoardingPage(
          onBoardingModel: OnBoardingModel(
        image: appOnBoardingImage1,
        height: size.height,
        title: appOnBoardingTitle1,
        subTitle: appOnBoardingSubTitle1,
        counterText: appOnBoardingCounter1,
        bgColor: appOnBoardingPage1Color,
      )),
      OnBoardingPage(
          onBoardingModel: OnBoardingModel(
        image: appOnBoardingImage2,
        height: size.height,
        title: appOnBoardingTitle2,
        subTitle: appOnBoardingSubTitle2,
        counterText: appOnBoardingCounter2,
        bgColor: appOnBoardingPage2Color,
      )),
      OnBoardingPage(
          onBoardingModel: OnBoardingModel(
        image: appOnBoardingImage3,
        height: size.height,
        title: appOnBoardingTitle3,
        subTitle: appOnBoardingSubTitle3,
        counterText: appOnBoardingCounter3,
        bgColor: appOnBoardingPage3Color,
      )),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: controller,
            onPageChangeCallback: onPageChangeCallback
            ,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            enableLoop: false,
          ),
          Positioned(
              bottom: 35,
              child: OutlinedButton(
                  onPressed: () {
                    int nextPage = controller.currentPage + 1;
                    controller.animateToPage(page: nextPage);
                  },
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.black26),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      foregroundColor: Colors.white
                  ),
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: appDarkColor
                      ),
                      child: const Icon(Icons.arrow_forward_ios)
                  )
              )
          ),
          Positioned(
            top: 50,
              right: 20,
              child: TextButton(
                onPressed: () => controller.jumpToPage(page: 2),
                child: const Text("Skip", style: TextStyle(
                  color: Colors.grey
                ),),

          )),
          Positioned(
            bottom: 15,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,
                count: pages.length,
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0
                ),
              )
          )
        ],
      ),
    );
  }

  onPageChangeCallback(int index) {
    currentPage = ++index;
    setState(() {

    });
  }
}
