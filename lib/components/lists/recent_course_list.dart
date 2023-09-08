import 'package:flutter/material.dart';
import '../../model/course.dart';
import '../../screens/coursescreen.dart';
import '../cards/recent_course_card.dart';

class RecentCourselist extends StatefulWidget {
  const RecentCourselist({super.key});

  @override
  State<RecentCourselist> createState() => _RecentCourselistState();
}

class _RecentCourselistState extends State<RecentCourselist> {
  List<Container> indicators = [];
  int current = 0;

  Widget UpdateIndicators() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: recentCourses.map((course) {
          var index = recentCourses.indexOf(course);
          return Container(
            height: 7.0,
            width: 7.0,
            margin: EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (current == index)
                  ? Color(0xFF0971FE)
                  : Color(0xFFA6AEBD), //using the ternary operator.
            ),
          );
        }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320.0,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Coursescreen(
                          course: recentCourses[index],
                        ),
                        fullscreenDialog: true,
                      ));
                },
                child: Opacity(
                    opacity: (current == index) ? 1.0 : 0.5,
                    child: RecentCoursecard(course: recentCourses[index])),
              );
            },
            itemCount: recentCourses.length,
            controller: PageController(initialPage: 0, viewportFraction: 0.63),
            onPageChanged: (index) {
              setState(() {
                current = index;
              });
            },
          ),
        ),
        UpdateIndicators(),
      ],
    );
  }
}
