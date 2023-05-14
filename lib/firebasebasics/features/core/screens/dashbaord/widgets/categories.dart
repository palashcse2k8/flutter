
import 'package:flutter/material.dart';

import '../../../models/categories_model.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {

    final categories = DashBoardCategoriesModel.categoriesList;

    return SizedBox(
      height: 45,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: categories[index].onPress,
            child: SizedBox(
              width: 175,
              height: 45,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black
                      ),
                      child: Center(
                        child: Text(
                          categories[index].title, style: textTheme.bodyMedium!.apply(color: Colors.white), textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(categories[index].heading, style: textTheme.bodyMedium,),
                        Text(categories[index].subHeading, style: textTheme.bodySmall,),
                      ],
                    )
                  ]
              ),
            ),
          );
        },
      ),
    );
  }
}