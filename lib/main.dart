import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterbascis/sblesheba/app-router/router.dart';
import 'package:flutterbascis/sblesheba/provider/app_language_provider.dart';
import 'package:flutterbascis/sblesheba/provider/navigation_provider.dart';
import 'package:flutterbascis/sblesheba/utilities/app_language.dart';
import 'package:provider/provider.dart';
import 'firebasebasics/firebase_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );// to ensure all the initialization before loading the app
  AppLanguageProvider appLanguage = AppLanguageProvider();
  await appLanguage.fetchLocale(); // to get the last local used for this app
  // runApp(MyApp(
  //   appLanguage: appLanguage,
  // ));
  runApp(
    const FireBaseLogin(),
  );
}

class MyApp extends StatelessWidget {
  final AppLanguageProvider appLanguage;

  const MyApp({super.key, required this.appLanguage});

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppNavigationProvider>(
              create: (_) => AppNavigationProvider()),
          ChangeNotifierProvider<AppLanguageProvider>(
              create: (_) => appLanguage),
        ],
        child: Consumer<AppLanguageProvider>(builder: (context, model, child) {
          return MaterialApp.router(
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('bn', 'BD'),
            ],
            locale: appLanguage.appLocal,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.deepOrange),
            // home: MainPage(),
            routerConfig: RouterConfiguration.router,
          );
        }));
  }
}
