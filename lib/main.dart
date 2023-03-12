import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/datamodel/navigation_item.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/eshebahomepage.dart';
import 'package:flutterbascis/sblesheba/provider/navigationprovider.dart';
import 'package:flutterbascis/sblesheba/provider/popupmenu_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/alerts.dart';
import 'widgets/defaultpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

     return ChangeNotifierProvider(
       create: (BuildContext context) => DrawerNavigationProvider(),
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: MainPage(),
        ),
     );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<DrawerNavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case DrawerNavigationItem.home:
        return const EshebaHomePage();
      case DrawerNavigationItem.userManual:
        return const EshebaHomePage();

      default:
        return const EshebaHomePage();
    }
  }
}

