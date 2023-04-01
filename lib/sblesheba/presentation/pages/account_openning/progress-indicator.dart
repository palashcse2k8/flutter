import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({super.key});

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> {
  final List<int> steps = [1, 2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 280.0,
              child: const Divider(
                color: Colors.white,
                thickness: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var step in steps)
                  step < 3 ? CustomCompleteCircle() : CustomNotCompleteCircle(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget CustomCompleteCircle() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.amber,
          ),
        ],
      ),
      child: const Icon(
        Icons.circle,
        color: Colors.amber,
        size: 40.0,
      ),
    );
  }

  Widget CustomNotCompleteCircle() {
    return const Icon(
      Icons.circle,
      color: Colors.white,
      size: 40.0,
    );
  }
}
