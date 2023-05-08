import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
        this.crossAxisAlignment = CrossAxisAlignment.start,
        this.imageColor,
        this.imageHeight = 0.2,
        this.heightBetween,
        this.textAlign
      });

  final String image, title, subtitle;

  final Color? imageColor;
  final double? imageHeight;
  final double? heightBetween;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          height: (size.height * imageHeight!),
          width: size.width,
          fit: BoxFit.fitWidth,
          color: imageColor,
        ),
        SizedBox(height: heightBetween,),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: textAlign,
        ),
      ],
    );
  }
}
