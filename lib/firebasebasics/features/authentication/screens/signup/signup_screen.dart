import 'package:flutter/material.dart';
import 'package:flutterbascis/firebasebasics/common_widgets/form/form_header_widget.dart';
import 'package:flutterbascis/firebasebasics/constants/image_strings.dart';
import 'package:flutterbascis/firebasebasics/constants/sizes.dart';
import 'package:flutterbascis/firebasebasics/constants/text_strings.dart';
import 'package:flutterbascis/firebasebasics/features/authentication/screens/signup/sign_up_form_widget.dart';

import '../../../../common_widgets/form/form_footer_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(appDefaultSize),
          child: Column(
            children: const [
              FormHeaderWidget(
                  image: appWelcomeScreenImage,
                  title: appSignUpTitle,
                  subtitle: appSignUpSubTitle),
              SignUpFormWidget(),
              FormFooterWidget(
                imageLogo: appGoogleLogo,
                span1Text: appAlreadyHaveAnAccount,
                span2Text: appLogin,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
