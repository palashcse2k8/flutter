
import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: appFormHeight - 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                label: Text(appFullName),
                prefixIcon: Icon(Icons.person_outline_rounded)
            ),
          ),
          const SizedBox(height: appFormHeight - 20),
          TextFormField(
            decoration: const InputDecoration(
                label: Text(appEmail),
                prefixIcon: Icon(Icons.email_outlined)
            ),
          ),
          const SizedBox(height: appFormHeight - 20),
          TextFormField(
            decoration: const InputDecoration(
                label: Text(appPhoneNo),
                prefixIcon: Icon(Icons.numbers_outlined)
            ),
          ),
          const SizedBox(height: appFormHeight - 20),
          TextFormField(
            decoration: const InputDecoration(
                label: Text(appPassword),
                prefixIcon: Icon(Icons.fingerprint)
            ),
          ),
          const SizedBox(height: appFormHeight - 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {  }, child: Text(appSignUp.toUpperCase()),
            ),
          )
        ],
      ),
    );
  }
}
