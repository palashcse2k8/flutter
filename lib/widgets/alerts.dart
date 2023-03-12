import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyModel extends Equatable {
  String answer;

  MyModel({required this.answer});

  @override
  List<Object?> get props => [answer];
}

class AlertPage extends StatelessWidget {
  AlertPage({Key? key}) : super(key: key);

  MyModel model = MyModel(answer: "Yes");

  @override
  Widget build(BuildContext context) {
    void _showSnackbar(String txt, String ans) {
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
              color: result ? Colors.red : Colors.amberAccent,
              size: 20,
              semanticLabel: txt,
            ),
            Text(
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

    void simpleTimePicker() {
      final DateTime now = DateTime.now();
      showTimePicker(
              context: context,
              initialTime: TimeOfDay(hour: now.hour, minute: now.minute))
          .then((value) {
        if (value != null) {
          _showSnackbar(value.format(context), "Yes");
        } else {
          _showSnackbar("You clicked Cancel", "No");
        }
      });
    }

    void simpleDatePicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2050))
          .then((value) {
        if (value != null) {
          _showSnackbar(value.toString(), "Yes");
        } else {
          _showSnackbar("You clicked Cancel", "No");
        }
      });
    }

    void simpleDateRangePicker() {
      showDateRangePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(2025))
          .then((value) {
        if (value != null) {
          _showSnackbar(
              '${DateFormat.yMMMd().format(value.start)} - ${DateFormat.yMMMd().format(value.end)}',
              "Yes");
        } else {
          _showSnackbar("You clicked Cancel", "No");
        }
      });
    }

    Future<void> _simpleDialogue() async {
      switch (await showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: const Text("Simple Dialogue, is it nice?"),
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 'Yes');
                  },
                  child: const Text("Yes"),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 'No');
                  },
                  child: const Text("No"),
                )
              ],
            );
          })) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: _simpleDialogue,
                child: const Text("Simple Dialogue")),
            ElevatedButton(
                onPressed: () {}, child: const Text("Alert Dialogue")),
            ElevatedButton(
                onPressed: () {
                  simpleDatePicker();
                },
                child: const Text("Date Picker")),
            ElevatedButton(
                onPressed: () {
                  simpleTimePicker();
                },
                child: const Text("Time Picker")),
            ElevatedButton(
                onPressed: () {
                  simpleDateRangePicker();
                },
                child: const Text("Date Range Picker")),
            Builder(
              builder: (ctx) {
                return ElevatedButton(
                  child: const Text("Bottom Sheet"),
                  onPressed: () {
                    Scaffold.of(ctx).showBottomSheet<void>(
                          (BuildContext context) {
                        return Container(
                          alignment: Alignment.center,
                          height: 200,
                          color: Colors.amber,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
