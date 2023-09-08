import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../cards/Completedcoursecard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompletedcourseList extends StatefulWidget {
  @override
  State<CompletedcourseList> createState() => _CompletedcourseListState();
}

class _CompletedcourseListState extends State<CompletedcourseList> {
  var completedCourses = [];
  // ignore: unused_field
  final _auth = FirebaseAuth.instance;
  // ignore: unused_field
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 140.0,
          width: double.infinity,
          child: PageView.builder(
            itemCount: completedCourses.length,
            itemBuilder: (context, index) {
              return CompletedCoursecard(course: completedCourses[index]);
            },
          ),
        ),
      ],
    );
  }
}
