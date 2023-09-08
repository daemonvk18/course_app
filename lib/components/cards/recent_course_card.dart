import 'package:course_app/constants.dart';
import 'package:course_app/model/course.dart';
import 'package:flutter/material.dart';

class RecentCoursecard extends StatelessWidget {
  RecentCoursecard({required this.course});

  Course course;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            height: 240.0,
            width: 240.0,
            decoration: BoxDecoration(
              gradient: course.background,
              borderRadius: BorderRadius.circular(41.0),
              boxShadow: [
                BoxShadow(
                  color: course.background.colors[0].withOpacity(0.3),
                  offset: Offset(0, 20),
                  blurRadius: 30.0,
                ),
                BoxShadow(
                  color: course.background.colors[1].withOpacity(0.3),
                  offset: Offset(0, 20),
                  blurRadius: 30.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 32.0,
                    left: 32.0,
                    right: 32.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.courseSubtitle,
                        style: kSubtitleStyle,
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
                Expanded(
                  child: Image.asset(
                    "asset/illustrations/${course.illustration}",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 0.0, left: 0.0, right: 42.0, bottom: 0.0),
          child: Container(
            child: Expanded(
              child: Image.asset(
                "asset/logos/${course.logo}",
                fit: BoxFit.cover,
              ),
            ),
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 4),
                  blurRadius: 16.0,
                ),
              ],
            ),
            padding: EdgeInsets.all(12.0),
          ),
        ),
      ],
    );
  }
}
