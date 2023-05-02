import 'package:get/get.dart';

import '../../features/authentication/screens/welcome_screen/welcome_screen.dart';

class FadeInAnimationController extends GetxController {

  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimate() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 2000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.offAll( () => const WelcomeScreen());
  }
}
