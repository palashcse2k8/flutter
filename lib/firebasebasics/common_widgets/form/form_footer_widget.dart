import 'package:flutter/material.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

class FormFooterWidget extends StatelessWidget {
  const FormFooterWidget({
    super.key,
    required this.imageLogo,
    required this.span1Text,
    required this.span2Text,
  });

  final String imageLogo, span1Text, span2Text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: appFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Image(
              image: AssetImage(imageLogo),
              height: 20.0,
            ),
            onPressed: () {},
            label: Text(appSignInWithGoogle.toUpperCase()),
          ),
        ),
        const SizedBox(
          height: appFormHeight - 20,
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(TextSpan(
              text: span1Text,
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                    text: span2Text, style: const TextStyle(color: Colors.blue))
              ])),
        )
      ],
    );
  }
}
