import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

class CustomWidget extends StatelessWidget {
  final String label, pathToImageIcon;
  final ServiceId id;

  const CustomWidget(
      {super.key,
      required this.label,
      required this.pathToImageIcon,
      required this.id});

  void getServicePage() {}

  @override
  Widget build(BuildContext context) {
    double deviceSize = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 6,110,139),
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: deviceSize/4,
      height: 115,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 12),
          Expanded(
            child: Image.asset(
              pathToImageIcon,
              height: 50,
              width: 50,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            textAlign: TextAlign.center,
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
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
