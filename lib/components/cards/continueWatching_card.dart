import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../model/course.dart';

class ContinueWatchingcard extends StatelessWidget {
  ContinueWatchingcard({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: course.background,
                borderRadius: BorderRadius.circular(41.0),
                boxShadow: [
                  BoxShadow(
                    color: course.background.colors[0].withOpacity(0.3),
                    offset: Offset(0, 10),
                    blurRadius: 7.0,
                  ),
                  BoxShadow(
                    color: course.background.colors[1].withOpacity(0.3),
                    offset: Offset(0, 10),
                    blurRadius: 7.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Container(
                  height: 140.0,
                  width: 260.0,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                "asset/illustrations/${course.illustration}",
                                fit: BoxFit.cover,
                                height: 110,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(28.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.courseSubtitle,
                              style: kSubtitleStyle,
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 9.0),
                              child: Text(
                                course.courseTitle,
                                style: kCardTitleStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 0.0, left: 28.0, right: 0.0, bottom: 0.0),
            child: Container(
              child: Expanded(
                child: Image.asset(
                  "asset/icons/icon-play.png",
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
              padding: EdgeInsets.all(15.0),
            ),
          ),
        ],
      ),
    );
  }
}
