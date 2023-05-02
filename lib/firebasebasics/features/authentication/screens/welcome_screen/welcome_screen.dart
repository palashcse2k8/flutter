import 'package:flutter/material.dart';
import 'package:flutterbascis/firebasebasics/constants/colors.dart';
import 'package:flutterbascis/firebasebasics/constants/sizes.dart';
import 'package:flutterbascis/firebasebasics/constants/text_strings.dart';
import 'package:flutterbascis/firebasebasics/features/authentication/screens/login/login_screen.dart';
import 'package:flutterbascis/firebasebasics/features/authentication/screens/signup/signup_screen.dart';
import '../../../../constants/image_strings.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    var isLight = brightness == Brightness.light;

    return Scaffold(
      backgroundColor: isLight ? appPrimaryColor : appSecondaryColor,
      body: Container(
          padding: const EdgeInsets.all(appDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: const AssetImage(appWelcomeScreenImage),
                height: height * 0.6,
                fit: BoxFit.fill,
              ),
              Column(
                children: [
                  Text(appWelcomeTitle,
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(appWelcomeSubTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge)
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Get.to(() => const LoginScreen());
                        }, child: Text(appLogin.toUpperCase())),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const SignUpScreen());
                      },
                      child: Text(appSignUp.toUpperCase()),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
