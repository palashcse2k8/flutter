import 'package:flutter/material.dart';

import '../../../../common_widgets/form/form_footer_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const FormFooterWidget(
      imageLogo: appGoogleLogo,
      span1Text: appDontHaveAnAccount,
      span2Text: appSignUp,
    );
  }
}
