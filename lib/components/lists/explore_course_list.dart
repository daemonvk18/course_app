import 'package:flutter/material.dart';
import '../../model/course.dart';
import '../cards/explore_course_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExploreCourselist extends StatefulWidget {
  @override
  State<ExploreCourselist> createState() => _ExploreCourselistState();
}

class _ExploreCourselistState extends State<ExploreCourselist> {
  List<Course> exploreCourses = [];

  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getCoursedata();
  }

  void getCoursedata() {
    _firestore.collection("courses").get().then((snapshot) {
      snapshot.docs.forEach((element) {
        setState(() {
          exploreCourses.add(Course(
              courseTitle: element['coursetitle'],
              courseSubtitle: element['coursesubtitle'],
              background: LinearGradient(colors: [
                Color(int.parse(element['colors'][0])),
                Color(int.parse(element['colors'][1]))
              ]),
              illustration: element['illustration'],
              logo: element['logo']));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: exploreCourses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0),
            child: ExploreCoursecard(course: exploreCourses[index]),
          );
        },
      ),
    );
  }
}
