import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../components/lists/coursesectiolist.dart';
import '../constants.dart';
import '../model/course.dart';

class Coursescreen extends StatefulWidget {
  Coursescreen({required this.course});

  late final Course course;

  @override
  State<Coursescreen> createState() => _CoursescreenState();
}

class _CoursescreenState extends State<Coursescreen> {
  int current = 0;

  Widget Indicators() {
    List<Widget> indicators = [];
    for (var i = 0; i < 9; i++) {
      indicators.add(
        Container(
          height: 7.0,
          width: 7.0,
          margin: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == 0 ? Color(0xFF0971FE) : Color(0xFFA6AEBD),
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  late PanelController panelController;

  @override
  void initState() {
    super.initState();
    panelController = PanelController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SlidingUpPanel(
          controller: panelController,
          backdropEnabled: true,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34.0),
          ),
          color: kCardPopupBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0, 5.0),
              blurRadius: 15.0,
            ),
          ],
          minHeight: 0.0,
          maxHeight: MediaQuery.of(context).size.height * 0.90,
          panel: Coursesectionscreen(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration:
                            BoxDecoration(gradient: widget.course.background),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(18.0)),
                                      child: Hero(
                                        child: Image.asset(
                                          'asset/logos/${widget.course.logo}',
                                        ),
                                        tag: widget.course.logo,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Hero(
                                            tag: widget.course.courseSubtitle,
                                            child: Text(
                                              widget.course.courseSubtitle,
                                              style: kSecondaryCalloutLabelStyle
                                                  .copyWith(
                                                      color: Colors.white70),
                                            ),
                                          ),
                                          Hero(
                                            tag: widget.course.courseTitle,
                                            child: Text(
                                              widget.course.courseTitle,
                                              style: kLargeTitleStyle.copyWith(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          color: kPrimaryLabelColor
                                              .withOpacity(0.8),
                                        ),
                                        child: Icon(Icons.close,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 28.0,
                              ),
                              Expanded(
                                child: Hero(
                                  tag: widget.course.illustration,
                                  child: Image.asset(
                                    'asset/illustrations/${widget.course.illustration}',
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 200.0, bottom: 0.0, right: 25.0),
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        padding: EdgeInsets.symmetric(
                            vertical: 13.0, horizontal: 13.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13.0),
                          boxShadow: [
                            BoxShadow(
                                color: kShadowColor,
                                offset: Offset(0, 10),
                                blurRadius: 20.0),
                          ],
                        ),
                        child: Image.asset("asset/icons/icon-play.png"),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 28.0, right: 28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: CircleAvatar(
                                    child: Icon(
                                      Platform.isAndroid
                                          ? Icons.people
                                          : CupertinoIcons.group_solid,
                                      color: Colors.white,
                                    ),
                                    radius: 21.0,
                                    backgroundColor: kCourseElementIconColor,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: kBackgroundColor,
                                    borderRadius: BorderRadius.circular(29.0)),
                              ),
                            ),
                            height: 58.0,
                            width: 58.0,
                            decoration: BoxDecoration(
                              gradient: widget.course.background,
                              borderRadius: BorderRadius.circular(29.0),
                            ),
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "28.7K",
                                style:
                                    kTitle2Style.copyWith(color: Colors.black),
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                "Students",
                                style: kSearchPlaceholderStyle.copyWith(
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 92.0,
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                child: Icon(
                                  Platform.isAndroid
                                      ? Icons.format_quote
                                      : CupertinoIcons.memories,
                                  color: Colors.white,
                                ),
                                radius: 21.0,
                                backgroundColor: kCourseElementIconColor,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29.0),
                              color: kBackgroundColor,
                            ),
                          ),
                        ),
                        height: 58.0,
                        width: 58.0,
                        decoration: BoxDecoration(
                          gradient: widget.course.background,
                          borderRadius: BorderRadius.circular(29.0),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "12.4k",
                            style: kTitle2Style.copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            "Comments",
                            style: kSearchPlaceholderStyle.copyWith(
                                color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Indicators(),
                      GestureDetector(
                        onTap: () {
                          panelController.open();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40.0,
                          width: 70.0,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14.0),
                            boxShadow: [
                              BoxShadow(
                                color: kShadowColor,
                                offset: Offset(0, 12),
                                blurRadius: 16.0,
                              )
                            ],
                          ),
                          child: Text("view all", style: kSearchTextStyle),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    children: [
                      Text(
                        "5 years ago i couldn't write a single line of code.I learned it and moved to React,flutter while using increasingly complex design tools.I dont regret learning them because swiftUI takes all of their best concepts.It is hands-down for the best way to for designers to take a first step into code.",
                        style: kBodyLabelStyle,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        "About this course",
                        style: kTitle1Style,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        "This course was written for the people who are passionate about desigining lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum may be a little hard.However once you get everything working,it will become little more friendlier",
                        style: kBodyLabelStyle,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Coursesectionscreen extends StatelessWidget {
  const Coursesectionscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(34.0),
          topLeft: Radius.circular(34.0),
        ),
        color: kBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0, 12),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 110.0,
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 30.0),
            decoration: BoxDecoration(
              color: kCardPopupBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34.0),
                bottomLeft: Radius.circular(34.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 32.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Course Sections",
                      style: kCardTitleStyle.copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "12 Sections",
                      style: kSubtitleStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CourseSectionList(),
        ],
      ),
    );
  }
}
