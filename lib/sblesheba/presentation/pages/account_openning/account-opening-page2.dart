import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/home_pages/custom_appbar.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/home_pages/drawer_menu_page.dart';

class AccountOpeningPage1 extends StatelessWidget {
  const AccountOpeningPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomerDrawer(),
      body: Center(
        child: Column(

        ),
      ),
    );
  }
}

