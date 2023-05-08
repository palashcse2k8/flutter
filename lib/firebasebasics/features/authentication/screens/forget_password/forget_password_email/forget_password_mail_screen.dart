
import 'package:flutter/material.dart';
import 'package:flutterbascis/firebasebasics/common_widgets/form/form_header_widget.dart';
import 'package:flutterbascis/firebasebasics/constants/sizes.dart';
import 'package:flutterbascis/firebasebasics/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/image_strings.dart';
import '../forget_password_otp/forget_password_otp_screen.dart';

class ForgetPasswordEmailScreen extends StatelessWidget {
  const ForgetPasswordEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(appDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox( height: appDefaultSize * 2,),
                const FormHeaderWidget(
                    image: appForgetPasswordImage,
                    title: appForgetPasswordTxt ,
                    subtitle: appForgetPasswordSubTitle,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 20.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text(appEmail),
                          hintText: appEmail,
                          prefixIcon: Icon(Icons.mail_outline_rounded)
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => const ForgetPasswordOTPScreen());
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}