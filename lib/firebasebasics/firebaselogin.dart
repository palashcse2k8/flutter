import 'package:flutter/material.dart';
import 'package:flutterbascis/firebasebasics/utils/themes/theme.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'features/authentication/screens/splash_screen/splash_screen.dart';

class FireBaseLogin extends StatelessWidget {
  const FireBaseLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      // showPerformanceOverlay: true,
    );
  }
}

class FireBaseHome extends StatelessWidget {
  const FireBaseHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("./appable"),
        leading: const Icon(Icons.ondemand_video),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.shopping_cart_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text("Heading", style: Theme.of(context).textTheme.displayMedium),
            Text("Subheading", style: Theme.of(context).textTheme.titleSmall),
            Text("Paragraph", style: Theme.of(context).textTheme.bodyLarge),
            ElevatedButton(
                onPressed: () {}, child: const Text("Elevated Button")),
            OutlinedButton(
                onPressed: () {}, child: const Text("Outlined Button")),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: AssetImage("assets/images/customer-signature.png"),
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
