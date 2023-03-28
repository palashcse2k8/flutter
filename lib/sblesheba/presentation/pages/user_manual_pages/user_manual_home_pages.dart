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
                    UserManualButton(text: AppLocalizations.of(context)?.translate('account_opening_manual')?? ""),
                    const SizedBox(
                      height: 10,
                    ),
                    UserManualButton(text: AppLocalizations.of(context)?.translate('buet_fee_manual')?? ""),
                    const SizedBox(
                      height: 10,
                    ),
                    UserManualButton(text: AppLocalizations.of(context)?.translate('xi_admission_manual')?? ""),
                    const SizedBox(
                      height: 10,
                    ),
                    UserManualButton(text: AppLocalizations.of(context)?.translate('travel_tax_manual')?? ""),
                    const SizedBox(
                      height: 10,
                    ),
                    UserManualButton(text: AppLocalizations.of(context)?.translate('e_passport_manual')?? ""),
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

  const UserManualButton({super.key, required this.text});

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

          if (text == UserManual.ePassPortManual) {
            provider.sePdfPath(PDF.ePassPortManual);
          } else if (text == UserManual.accountOpeningManual) {
            provider.sePdfPath(PDF.accountOpeningManual);
          } else if (text == UserManual.travelTaxManual) {
            provider.sePdfPath(PDF.travelTaxManual);
          } else if (text == UserManual.buetFeeManual) {
            provider.sePdfPath(PDF.buetFeeManual);
          } else if (text == UserManual.xiAdmissionManual) {
            provider.sePdfPath(PDF.xiAdmissionManual);
          }
          // provider.setNavigationItem(DrawerNavigationItem.pdfViewer);
          context.pushNamed("user-manual-page-with-pdf");
        },
        child: Text(
          text!.toUpperCase(),
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
