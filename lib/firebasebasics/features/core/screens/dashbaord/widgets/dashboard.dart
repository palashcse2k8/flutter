import 'package:flutter/material.dart';
import 'package:flutterbascis/firebasebasics/constants/colors.dart';
import 'package:flutterbascis/firebasebasics/constants/image_strings.dart';
import 'package:flutterbascis/firebasebasics/constants/sizes.dart';
import 'package:flutterbascis/firebasebasics/constants/text_strings.dart';
import 'package:flutterbascis/firebasebasics/features/core/screens/dashbaord/widgets/top_courses.dart';

import 'categories.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          appName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10, top : 10),
            // padding: const EdgeInsets.only(right: 10, top : 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: appCardBgColor,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(appDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(appDashBoardTitle, style: textTheme.titleMedium,),
              Text(appDashBoardHeading, style: textTheme.displaySmall?.apply(fontSizeFactor: .6),),
              const SizedBox(height: appDashBoardPadding,),
              // dash board search box
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide()
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(appDashBoardSearch, style: textTheme.displayMedium!.apply(color: Colors.white.withOpacity(.8), fontSizeFactor: .5 ),),
                    const Icon(Icons.mic)
                  ],
                ),
              ),
              const SizedBox(height: appDashBoardPadding,),

              // dash board categories
              Categories(textTheme: textTheme),
              const SizedBox(height: appDashBoardPadding,),

              // Banners
              SizedBox(
                height: 250,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        // height: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appCardBgColor
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Flexible(child: Icon(Icons.bookmark)),
                                Flexible(child: Image(image: AssetImage(appDashBoardImage1)))
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Text(appDashBoardBannerTitle1, style: textTheme.titleMedium, maxLines: 2, overflow: TextOverflow.ellipsis,),
                            Text(appDashBoardBannerSubTitle1, style: textTheme.bodyMedium, maxLines: 1, overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: appDashBoardCardPadding,),

                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appCardBgColor
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Flexible(child: Icon(Icons.bookmark)),
                                    Flexible(child: Image(image: AssetImage(appDashBoardImage2)))
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Text(appDashBoardBannerTitle2, style: textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis,),
                                Text(appDashBoardBannerSubTitle2, style: textTheme.bodyMedium, maxLines: 1, overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                          ),

                          const SizedBox(height: 5,),

                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                                onPressed: () {}, child: Text(
                              appDashBoardTopCoursesTxt, style: textTheme.titleLarge,
                            )),
                          )
                        ],
                      ),

                    ),
                  ],
                ),
              ),
              const SizedBox(height: appDashBoardPadding,),

              //Top Courses
              Text(appDashBoardTopCoursesTxt, style: textTheme.titleLarge,),
              const SizedBox(height: 10,),
              TopCourses(textTheme: textTheme)
            ],
          ),
        ),
      )),
    );
  }
}


