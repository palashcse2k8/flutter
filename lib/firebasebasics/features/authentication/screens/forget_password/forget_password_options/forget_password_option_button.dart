
import 'package:flutter/material.dart';

class ForgetPasswordOptionButton extends StatelessWidget {
  const ForgetPasswordOptionButton({
    super.key, required this.title, required this.subTitle, required this.buttonIcon, required this.func
  });

  final String title, subTitle;
  final IconData buttonIcon;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200
        ),
        child: Row(
          children: [
            Icon(buttonIcon , size: 60,),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge,),
                Text(subTitle, style: Theme.of(context).textTheme.bodyMedium)
              ],
            )
          ],
        ),
      ),
    );
  }
}