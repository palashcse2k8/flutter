
import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/home_pages/popup_menu_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize{
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Sonali eSheba"),
      backgroundColor: const Color(0xffFF9A00),
      // backgroundColor: const Color.fromARGB(255,154,0,255),
      centerTitle: true,
      actions: [
        getPopUpMenu(context),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
