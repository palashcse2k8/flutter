import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../forget_password_email/forget_password_mail_screen.dart';
import 'forget_password_option_button.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowBottomModalSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(appDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appForgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            Text(appForgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(
              height: 30,
            ),
            ForgetPasswordOptionButton(
                buttonIcon: Icons.email_outlined,
                title: appEmail,
                subTitle: appPasswordResetViaEmail,
                func: () {
                  Navigator.pop(context);
                  Get.to(() => const ForgetPasswordEmailScreen());
                },
            ),
            const SizedBox(
              height: 10,
            ),
            ForgetPasswordOptionButton(
              buttonIcon: Icons.phone_android_outlined,
              title: appPhoneNo,
              subTitle: appPasswordResetViaPhone,
              func: () {},
            )
          ],
        ),
      ),
    );
  }
}
