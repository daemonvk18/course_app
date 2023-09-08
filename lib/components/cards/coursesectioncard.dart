import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../model/course.dart';

// ignore: must_be_immutable
class CoursescreenCard extends StatelessWidget {
  CoursescreenCard({required this.course});

  late Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 18.0),
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
          gradient: course.background,
          boxShadow: [
            BoxShadow(
              color: course.background.colors[0].withOpacity(0.3),
              offset: Offset(0, 7),
              blurRadius: 32.0,
            ),
            BoxShadow(
                color: course.background.colors[1].withOpacity(0.3),
                offset: Offset(0, 7),
                blurRadius: 32.0),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(41.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      "asset/illustrations/${course.illustration}",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.courseSubtitle,
                              style: kCardSubtitleStyle,
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              course.courseTitle,
                              style: kCardTitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
