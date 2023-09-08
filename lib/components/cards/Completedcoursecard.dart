import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../model/course.dart';

class CompletedCoursecard extends StatelessWidget {
  CompletedCoursecard({required this.course});
  late final Course course;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: 140.0,
            width: 310.0,
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(41.0),
              gradient: course.background,
              boxShadow: [
                BoxShadow(
                  color: course.background.colors[0].withOpacity(0.5),
                  offset: Offset(0, 7),
                  blurRadius: 12.0,
                ),
                BoxShadow(
                  color: course.background.colors[1].withOpacity(0.5),
                  offset: Offset(0, 7),
                  blurRadius: 12.0,
                ),
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
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 13.0),
            alignment: Alignment.center,
            height: 58.0,
            width: 58.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Image.asset("asset/icons/icon-play.png"),
          ),
        ],
      ),
    );
  }
}
