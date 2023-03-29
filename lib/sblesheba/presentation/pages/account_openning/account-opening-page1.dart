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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton( text: "Savings Account",  func: (){
              debugPrint("Savings Clicked");
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const AccountOpeningPage1(),
                  )
              );
            },),
            const SizedBox(
              height: 15,
            ),
            CustomButton( text: "Probashi Account",  func: (){
              debugPrint("Probashi Clicked");
            },),
            const SizedBox(
              height: 15,
            ),
            CustomButton( text: "Student Account",  func: (){
              debugPrint("Student Clicked");
            },)
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  final String text;
  final Function func;
  const CustomButton({Key? key, required this.text, required this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
          shadowColor: Colors.greenAccent,
          elevation: 3,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          // maximumSize: const Size(375, 100), //////// HERE
        ),
        onPressed: () {
          func();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            // Icon(Icons.forward),
            const Image(
              image: AssetImage("assets/icons/forward-icon.png"),
              fit: BoxFit.fitHeight,
              height: 30,
              width: 30,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

