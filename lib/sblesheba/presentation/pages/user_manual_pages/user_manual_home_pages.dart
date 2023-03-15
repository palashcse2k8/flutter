import 'package:flutter/material.dart';

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
                  getUserManualButton("Bank Account Opening Manual"),
                  SizedBox(height: 10,),
                  getUserManualButton("Buet Fee Payment Manual"),
                  SizedBox(height: 10,),
                  getUserManualButton("XI Admission Fee Manual"),
                  SizedBox(height: 10,),
                  getUserManualButton("Travel Tax Payment Manual"),
                  SizedBox(height: 10,),
                  getUserManualButton("E-Passport Fee Manual"),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

Widget getUserManualButton(String text) {
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
        onPressed: null,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
    ),
  );
}
