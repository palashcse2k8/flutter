import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/datamodel/navigation_item.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/account_openning/account_openning_page.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/eshebahomepage.dart';
import 'package:flutterbascis/sblesheba/provider/navigationprovider.dart';
import 'package:flutterbascis/sblesheba/utilities/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DrawerNavigationProvider(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        // home: MainPage(),
        routerConfig: _router,
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

// GoRouter configuration
final _router = GoRouter(
  initialLocation: '/',
  errorPageBuilder: null,
  routes: [
    GoRoute(
      name: 'home',
      // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => const EshebaHomePage(),
    ),
    GoRoute(
      name: Constants.ACCCOUNT_OPPENING,
      path: '/account_opening_page',
      builder: (context, state) => const AccountOpeningPage(),
    ),
  ],
  redirect: (context, state) {
    late bool isAuthenticated =
        true; // Add your logic to check whether a user is authenticated or not
    if (!isAuthenticated) {
      return '/auth';
    } else {
      return null;
    }
  },
);
