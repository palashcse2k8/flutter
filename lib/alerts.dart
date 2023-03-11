
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyModel extends Equatable {
  String answer;

  MyModel ({required this.answer});
  @override
  List<Object?> get props => [answer];

}
class AlertPage extends StatelessWidget {
  AlertPage({Key? key}) : super (key: key);

  MyModel model = MyModel(answer: "Yes");
  @override
  Widget build(BuildContext context) {

    void _showSnackbar (String txt, String ans) {

      bool result = false;
      if (ans == "Yes") {
        result = true;
      }
      final snackbar = SnackBar(
        backgroundColor: result ? Colors.green : Colors.red,
        content: Row(
          children: [
            Icon(
              result ? Icons.favorite : Icons.sms_failed,
              color: result ? Colors.red: Colors.amberAccent,
              size: 20,
              semanticLabel: txt,
            ),
            Text (
              txt,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    Future <void> _simpleDialogue() async {
      switch ( await showDialog(
          context: context,
          builder: (context) {
            return  SimpleDialog(
              title: Text ("Simple Dialogue, is it nice?"),
              children: [
                SimpleDialogOption(
                  onPressed: (){
                    Navigator.pop(context, 'Yes');
                  },
                  child: const Text("Yes"),
                ),
                SimpleDialogOption(
                  onPressed: (){
                    Navigator.pop(context, 'No');
                  },
                  child: const Text("No"),
                )
              ],
            );

          }
      )
      ) {
        case "Yes":
          _showSnackbar("Oh Yes!", "Yes");
          break;
        case "No":
          _showSnackbar("Oh No!", "No");
          break;
      }
    }



    return Scaffold(
      appBar: AppBar(
        title: const Text("Alerts!"),
      ),
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: _simpleDialogue, child: const Text("Simple Dialogue")),
            ElevatedButton(onPressed: () {}, child: const Text("Alert Dialogue")),
            ElevatedButton(onPressed: () {}, child: const Text("Date Picker")),
            ElevatedButton(onPressed: () {}, child: const Text("Time Picker")),
            ElevatedButton(onPressed: () {}, child: const Text("Cupertino Dialogue")),
          ],
        ),
      ),


    );
  }

}