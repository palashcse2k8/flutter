import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

class CustomWidget extends StatelessWidget {
  final String lebel, pathToIamgeIcon;
  final ServiceId id;

  const CustomWidget(
      {super.key,
      required this.lebel,
      required this.pathToIamgeIcon,
      required this.id});

  void getServicePage() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 12),
          Expanded(
            child: Image.asset(
              pathToIamgeIcon,
              height: 50,
              width: 50,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            lebel,
            style: const TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
