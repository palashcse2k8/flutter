import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/home_pages/custom_appbar.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/home_pages/drawer_menu_page.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/home_pages/floating_action_button.dart';
import 'package:flutterbascis/sblesheba/provider/navigation_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../utilities/app_language.dart';
import '../../../utilities/constants.dart';

class UserManualHomePage extends StatelessWidget {
  const UserManualHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomerDrawer(),
      body: Padding(
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
                    UserManualButton(text: AppLocalizations.of(context)?.translate('account_opening_manual')?? "", pdfFileName: PDF.accountOpeningManual),
                    const SizedBox(
                      height: 10,
                    ),
                    UserManualButton(text: AppLocalizations.of(context)?.translate('buet_fee_manual')?? "", pdfFileName: PDF.buetFeeManual),
                    const SizedBox(
                      height: 10,
                    ),
                    UserManualButton(text: AppLocalizations.of(context)?.translate('xi_admission_manual')?? "", pdfFileName: PDF.xiAdmissionManual),
                    const SizedBox(
                      height: 10,
                    ),
                    UserManualButton(text: AppLocalizations.of(context)?.translate('travel_tax_manual')?? "", pdfFileName: PDF.travelTaxManual),
                    const SizedBox(
                      height: 10,
                    ),
                    UserManualButton(text: AppLocalizations.of(context)?.translate('e_passport_manual')?? "", pdfFileName: PDF.ePassPortManual),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}

class UserManualButton extends StatelessWidget {
  final String? text;
  final String pdfFileName;

  const UserManualButton({super.key, required this.text, required this.pdfFileName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.cyan,
        borderRadius: BorderRadius.circular(100),
          shape: BoxShape.rectangle
      ),
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
          // padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white)
                )
            )
        ),

        onPressed: () {
          // debugPrint("pdf clicked!");
          final provider =
              Provider.of<AppNavigationProvider>(context, listen: false);
            provider.sePdfPath(pdfFileName);
          // provider.setNavigationItem(DrawerNavigationItem.pdfViewer);
          context.pushNamed("user-manual-page-with-pdf");
        },
        child: Text(
          textAlign: TextAlign.center,
          text!.toUpperCase(),
          style: const TextStyle(fontSize: 15, color: Colors.white),
          // maxLines: 1,
        ),
      ),
    );
  }
}
