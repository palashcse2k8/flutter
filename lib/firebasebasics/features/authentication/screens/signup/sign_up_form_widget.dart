import 'package:flutter/material.dart';
import 'package:flutterbascis/firebasebasics/features/authentication/controllers/sign_up_controller.dart';
import 'package:get/get.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: appFormHeight - 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: signUpController.fullNameController,
              decoration: const InputDecoration(
                  label: Text(appFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            const SizedBox(height: appFormHeight - 20),
            TextFormField(
              controller: signUpController.emailController,
              decoration: const InputDecoration(
                  label: Text(appEmail),
                  prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(height: appFormHeight - 20),
            TextFormField(
              controller: signUpController.phoneNoController,
              decoration: const InputDecoration(
                  label: Text(appPhoneNo),
                  prefixIcon: Icon(Icons.numbers_outlined)),
            ),
            const SizedBox(height: appFormHeight - 20),
            TextFormField(
              controller: signUpController.passwordController,
              decoration: const InputDecoration(
                  label: Text(appPassword),
                  prefixIcon: Icon(Icons.fingerprint)),
            ),
            const SizedBox(height: appFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()) {
                    SignUpController.instance.registerUser(signUpController.emailController.text.trim(), signUpController.passwordController.text.trim());
                  }
                },
                child: Text(appSignUp.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
