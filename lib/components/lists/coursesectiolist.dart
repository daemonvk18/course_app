import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../model/course.dart';
import '../cards/coursesectioncard.dart';

class CourseSectionList extends StatefulWidget {
  @override
  State<CourseSectionList> createState() => _CourseSectionListState();
}

class _CourseSectionListState extends State<CourseSectionList> {
  List<Widget> verticallistview() {
    List<Widget> cards = [];
    for (var course in courseSections) {
      cards.add(CoursescreenCard(course: course));
    }

    cards.add(
      Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
        child: Text(
          "No more section to view ,\n look for more in courses",
          style: kCaptionLabelStyle.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: verticallistview(),
      ),
    );
  }
}
