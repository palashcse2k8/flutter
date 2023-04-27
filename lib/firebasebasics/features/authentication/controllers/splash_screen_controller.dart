import 'package:get/get.dart';

import '../screens/on_boarding_screen/on_boarding_screen.dart';
import '../screens/welcome_screen/welcome_screen.dart';

class SplashScreenController extends GetxController {

  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimate() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 5000));
    Get.to( () => const WelcomeScreen());
  }
}
