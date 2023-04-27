import 'package:flutter/material.dart';
import 'package:flutterbascis/firebasebasics/constants/colors.dart';
import 'package:flutterbascis/firebasebasics/features/authentication/controllers/on_boarding_screen_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingScreenController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obController.pages,
            liquidController: obController.controller,
            onPageChangeCallback: obController.onPageChangeCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            enableLoop: true,
          ),
          Positioned(
              bottom: 35,
              child: OutlinedButton(
                  onPressed: () => obController.jumpToNextPage(),
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.black26),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      foregroundColor: Colors.white),
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: appDarkColor),
                      child: const Icon(Icons.arrow_forward_ios)))),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: () => obController.skip(),
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.grey),
                ),
              )),
          Obx(
            () => Positioned(
                bottom: 15,
                child: AnimatedSmoothIndicator(
                  activeIndex: obController.currentPage.value,
                  count: obController.pages.length,
                  effect: const WormEffect(
                      activeDotColor: Color(0xff272727), dotHeight: 5.0),
                )),
          )
        ],
      ),
    );
  }
}
