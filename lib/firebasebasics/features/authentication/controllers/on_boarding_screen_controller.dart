import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/on_boarding_screen_model.dart';
import '../screens/on_boarding_screen/on_boarding_page_widget.dart';

class OnBoardingScreenController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;
  final pages = [
    OnBoardingPage(
        onBoardingModel: OnBoardingModel(
      image: appOnBoardingImage1,
      title: appOnBoardingTitle1,
      subTitle: appOnBoardingSubTitle1,
      counterText: appOnBoardingCounter1,
      bgColor: appOnBoardingPage1Color,
    )),
    OnBoardingPage(
        onBoardingModel: OnBoardingModel(
      image: appOnBoardingImage2,
      title: appOnBoardingTitle2,
      subTitle: appOnBoardingSubTitle2,
      counterText: appOnBoardingCounter2,
      bgColor: appOnBoardingPage2Color,
    )),
    OnBoardingPage(
        onBoardingModel: OnBoardingModel(
      image: appOnBoardingImage3,
      title: appOnBoardingTitle3,
      subTitle: appOnBoardingSubTitle3,
      counterText: appOnBoardingCounter3,
      bgColor: appOnBoardingPage3Color,
    )),
  ];

  onPageChangeCallback(int index) => currentPage.value = index;

  jumpToNextPage() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  skip() => controller.jumpToPage(page: 2);
}
