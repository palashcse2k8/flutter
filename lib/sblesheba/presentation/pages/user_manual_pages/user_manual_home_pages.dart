import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/datamodel/navigation_item.dart';
import 'package:flutterbascis/sblesheba/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

import '../../../utilities/constants.dart';

class UserManualHomePage extends StatefulWidget {
  const UserManualHomePage({super.key});

  @override
  State<UserManualHomePage> createState() => _UserManualHomePageState();
}

class _UserManualHomePageState extends State<UserManualHomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(children: [
        Flexible(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            // padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.cyan, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserManualButton( text: UserManual.accountOpeningManual),
                  const SizedBox(
                    height: 10,
                  ),
                  UserManualButton(text: UserManual.buetFeeManual),
                  const SizedBox(
                    height: 10,
                  ),
                  UserManualButton(text: UserManual.xiAdmissionManual),
                  const SizedBox(
                    height: 10,
                  ),
                  UserManualButton(text: UserManual.travelTaxManual),
                  const SizedBox(
                    height: 10,
                  ),
                  UserManualButton(text: UserManual.ePassPortManual),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class UserManualButton extends StatelessWidget {
  String? text;
  UserManualButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.cyan, borderRadius: BorderRadius.circular(20)),
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        ),
        onPressed: () {
          // debugPrint("pdf clicked!");
          final provider =
          Provider.of<AppNavigationProvider>(context, listen: false);

          if(text == UserManual.ePassPortManual) {
            provider.sePdfPath(PDF.ePassPortManual);
          } else if(text == UserManual.accountOpeningManual) {
            provider.sePdfPath(PDF.accountOpeningManual);
          } else if(text == UserManual.travelTaxManual) {
            provider.sePdfPath(PDF.travelTaxManual);
          } else if(text == UserManual.buetFeeManual) {
            provider.sePdfPath(PDF.buetFeeManual);
          } else if(text == UserManual.xiAdmissionManual) {
            provider.sePdfPath(PDF.xiAdmissionManual);
          }

          provider.setNavigationItem(DrawerNavigationItem.pdfViewer);
        },
        child: Text(
          text!.toUpperCase(),
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}