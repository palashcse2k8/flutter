
import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/datamodel/navigation_item.dart';
import 'package:flutterbascis/sblesheba/provider/navigationprovider.dart';
import 'package:provider/provider.dart';

class UserManualHomePage extends StatefulWidget {
  const UserManualHomePage({super.key});

  @override
  State<UserManualHomePage> createState() => _UserManualHomePageState();
}

class _UserManualHomePageState extends State<UserManualHomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  getUserManualButton(context, "Bank Account Opening Manual"),
                  const SizedBox(height: 10,),
                  getUserManualButton(context, "Buet Fee Payment Manual"),
                  const SizedBox(height: 10,),
                  getUserManualButton(context, "XI Admission Fee Manual"),
                  const SizedBox(height: 10,),
                  getUserManualButton(context, "Travel Tax Payment Manual"),
                  const SizedBox(height: 10,),
                  getUserManualButton(context, "E-Passport Fee Manual"),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

Widget getUserManualButton(BuildContext context, String text) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.cyan, borderRadius: BorderRadius.circular(20)),
    width: 300 ,
    height: 50,
    child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
          padding:
          MaterialStateProperty.all(const EdgeInsets.all(10)),
        ),
        onPressed: (){
          debugPrint("pdf clicked!");
          final provider =
          Provider.of<DrawerNavigationProvider>(context, listen: false);
          provider.setNavigationItem(DrawerNavigationItem.pdfViewer);
          },
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
    ),
  );
}
