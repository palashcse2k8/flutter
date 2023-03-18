import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/datamodel/navigation_item.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/account_openning/account_openning_page.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/error_page.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/esheba_home_page.dart';
import 'package:flutterbascis/sblesheba/provider/navigationprovider.dart';
import 'package:flutterbascis/sblesheba/utilities/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  // runApp(const MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: MyLearningHomePage(title: 'Flutter Learning',)));
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
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
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
  errorBuilder: (context, state) => const ErrorScreen(),
  // errorPageBuilder: (context, state) => MaterialPage(
  //   key: state.pageKey,
  //   child: Scaffold(
  //     appBar: AppBar(
  //         centerTitle: true,
  //         title: const Text(
  //             "Coming Soon....!"
  //         )
  //     ),
  //     body:  const Center(
  //       child: Text(
  //         "Nothing to show. Coming Soon.....!",
  //         style: TextStyle(
  //             fontSize: 20
  //         ),
  //       ),
  //     ),
  //   ),
  // ),
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
