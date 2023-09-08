import 'package:flutter/material.dart';
import '../../model/course.dart';
import '../cards/continueWatching_card.dart';

class ContinueWatchinglist extends StatefulWidget {
  @override
  State<ContinueWatchinglist> createState() => _ContinueWatchinglistState();
}

class _ContinueWatchinglistState extends State<ContinueWatchinglist> {
  List<Container> indicators = [];
  int current = 0;

  Widget UpdateIndicators() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: continueWatchingCourses.map((course) {
          var index = continueWatchingCourses.indexOf(course);
          return Container(
            height: 7.0,
            width: 7.0,
            margin: EdgeInsets.symmetric(horizontal: 4.0),
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
          height: 180.0,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: ((context, index) {
              return Opacity(
                opacity: (current == index) ? 1.0 : 0.5,
                child: ContinueWatchingcard(
                    course: continueWatchingCourses[index]),
              );
            }),
            itemCount: continueWatchingCourses.length,
            controller: PageController(initialPage: 0, viewportFraction: 0.74),
            onPageChanged: (index) {
              setState(() {
                current = index;
              });
            },
          ),
        ),
        SizedBox(
          height: 22.0,
        ),
        UpdateIndicators(),
      ],
    );
  }
}
