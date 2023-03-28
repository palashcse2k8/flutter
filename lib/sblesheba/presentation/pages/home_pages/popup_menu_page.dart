import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/provider/app_language_provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/navigation_provider.dart';
import '../../../utilities/app_language.dart';

PopupMenuButton getPopUpMenu(BuildContext context) {
  final provider = Provider.of<AppNavigationProvider>(context, listen: false);
  var appLanguage = Provider.of<AppLanguageProvider>(context);
  return PopupMenuButton(itemBuilder: (context) {
    return [
      buildPopUpItem(
        context,
        text: AppLocalizations.of(context)?.translate('language_bangla')?? "",
        val: 0,
      ),
      buildPopUpItem(
        context,
        text: AppLocalizations.of(context)?.translate('language_english')?? "",
        val: 1,
      )
    ];
  }, onSelected: (value) {
    provider.sePopUpMenuNavigationItem(value);
    if (value == 0) {
      // debugPrint("Bangla is selected.");
      appLanguage.changeLanguage(const Locale("bn"));
    } else if (value == 1) {
      // debugPrint("English is selected.");
      appLanguage.changeLanguage(const Locale("en"));
    }
  });
}

PopupMenuEntry buildPopUpItem(BuildContext context,
    {required String text, required int val}) {
  // final provider = Provider.of<AppNavigationProvider>(context, listen: false);
  var selectedIndex = 1;
  var appLanguage = Provider.of<AppLanguageProvider>(context, listen: false);

  if (appLanguage.appLocal == const Locale("bn")) {
    selectedIndex = 0;
  } else {
    selectedIndex = 1;
  }

  return PopupMenuItem(
      value: val,
      child: ListTile(
        title: FittedBox(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
            ),
            maxLines: 1,
          ),
        ),
        trailing: Radio(
          value: val,
          groupValue: selectedIndex,
          onChanged: null,
        ),
      ));
}
