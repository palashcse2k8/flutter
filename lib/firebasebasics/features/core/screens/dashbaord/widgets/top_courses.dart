
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class TopCourses extends StatelessWidget {
  const TopCourses({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 350,
            height: 200,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: appCardBgColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(child: Text(appDashBoardBannerTitle1, style: textTheme.titleLarge, maxLines: 2,)),
                    const Flexible(child: Image(image: AssetImage(appDashBoardTopCourseImage1), height: 110,))
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(
                            )),
                        onPressed: () {},
                        child: const Icon(Icons.play_arrow)
                    ),
                    const SizedBox(height: appDashBoardCardPadding,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("3 Sections", style: textTheme.titleMedium,),
                        Text("Programming Language", style: textTheme.titleMedium,)
                      ],
                    )
                  ],
                )

              ],
            ),
          ),
          Container(
            width: 350,
            height: 200,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: appCardBgColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(child: Text(appDashBoardBannerTitle1, style: textTheme.titleLarge, maxLines: 2,)),
                    const Flexible(child: Image(image: AssetImage(appDashBoardTopCourseImage1), height: 110,))
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(
                            )),
                        onPressed: () {},
                        child: const Icon(Icons.play_arrow)
                    ),
                    const SizedBox(height: appDashBoardCardPadding,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("3 Sections", style: textTheme.titleMedium,),
                        Text("Programming Language", style: textTheme.titleMedium,)
                      ],
                    )
                  ],
                )

              ],
            ),
          ),
          Container(
            width: 350,
            height: 200,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: appCardBgColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(child: Text(appDashBoardBannerTitle1, style: textTheme.titleLarge, maxLines: 2,)),
                    const Flexible(child: Image(image: AssetImage(appDashBoardTopCourseImage1), height: 110,))
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(
                            )),
                        onPressed: () {},
                        child: const Icon(Icons.play_arrow)
                    ),
                    const SizedBox(height: appDashBoardCardPadding,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("3 Sections", style: textTheme.titleMedium,),
                        Text("Programming Language", style: textTheme.titleMedium,)
                      ],
                    )
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}