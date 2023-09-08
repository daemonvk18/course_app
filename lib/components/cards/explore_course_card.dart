import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../model/course.dart';

class ExploreCoursecard extends StatefulWidget {
  ExploreCoursecard({required this.course});

  final Course course;

  @override
  State<ExploreCoursecard> createState() => _ExploreCoursecardState();
}

class _ExploreCoursecardState extends State<ExploreCoursecard> {
  String? illustrations;
  final _storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    _storage
        .ref("illustrations/${widget.course.illustration}")
        .getDownloadURL()
        .then((url) {
      setState(() {
        illustrations = url;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41.0),
        child: Container(
          height: 120.0,
          width: 280.0,
          decoration: BoxDecoration(gradient: widget.course.background),
          child: Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.course.courseSubtitle,
                        style: kCardSubtitleStyle,
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        widget.course.courseTitle,
                        style: kCardTitleStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (illustrations == null)
                        ? Container()
                        : Image.network(
                            illustrations!,
                            fit: BoxFit.cover,
                            height: 100.0,
                          ),
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
