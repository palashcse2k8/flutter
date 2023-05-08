
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutterbascis/firebasebasics/constants/sizes.dart';
import 'package:flutterbascis/firebasebasics/constants/text_strings.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordOTPScreen extends StatelessWidget {
  const ForgetPasswordOTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(appDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appOTPTitleTxt, style: GoogleFonts.montserrat(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
                  ),
                  Text(
                      appOTPSubTitleTxt, style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                      "$appOTPLabelTxt palashcse2k8@gmail.com", textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20,),
                  OtpTextField(
                    // borderWidth: 5,
                    // clearText: true,
                    borderColor: const Color(0xFF512DA8),
                    numberOfFields: 6,
                    autoFocus: true,
                    decoration: const InputDecoration(),
                    fillColor: Colors.black.withOpacity(0.1),
                    filled: true,
                    // borderColor: Colors.black,
                    onSubmit: (code) {
                      debugPrint("code is => $code");
                    },
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {  },
                      child: const Text(
                        "Next"
                      ),
                    ),
                  )
                ],
              ),

            ),
          ),
    ));
  }
}
