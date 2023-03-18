

import 'package:flutter/material.dart';

class myclass extends StatelessWidget {
  const myclass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) {
                  return getValue();
                },
            )
          );
        }, child: Text("")
    );
  }
}

Widget getValue(){
  return const Text("");
}