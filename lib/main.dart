import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/account_openning/account_openning_page.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/error_page/error_page.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/home_pages/esheba_home_page.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/home_pages/web_view_services.dart';
import 'package:flutterbascis/sblesheba/provider/navigation_provider.dart';
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
      create: (BuildContext context) => AppNavigationProvider(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        // home: MainPage(),
        routerConfig: _router,
      ),
    );
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
      name: AppService.ACCCOUNT_OPPENING,
      path: '/account_opening_page',
      builder: (context, state) => const AccountOpeningPage(),
    ),
    GoRoute(
      name: AppService.BUET_FEE,
      path: '/buet_fee',
      builder: (context, state) => WebViewApp(url: ServiceURL.BUET_FEE),
    ),
    // GoRoute(
    //   name: AppService.XI_ADMISSION,
    //   path: '/buet_fee',
    //   builder: (context, state) => WebViewApp(url: ServiceURL.XI_ADMISSION),
    // ),
    // GoRoute(
    //   name: AppService.BUET_FEE,
    //   path: '/buet_fee',
    //   builder: (context, state) => WebViewApp(url: ServiceURL.BUET_FEE),
    // ),
    // GoRoute(
    //   name: AppService.BUET_FEE,
    //   path: '/buet_fee',
    //   builder: (context, state) => WebViewApp(url: ServiceURL.BUET_FEE),
    // )
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
