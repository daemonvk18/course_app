import 'package:course_app/screens/side_bar_screen.dart';
import 'package:flutter/material.dart';
import '../components/homescreen_navbar.dart';
import '../components/lists/explore_course_list.dart';
import '../components/lists/recent_course_list.dart';
import '../constants.dart';
import 'continue_watching_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<Offset> sideBarAnimation;
  late AnimationController sideBarAnimationController;
  late Animation<double> fadetransition;
  var sidebarhidden = true;

  @override
  void initState() {
    super.initState();
    sideBarAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    sideBarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
          parent: sideBarAnimationController, curve: Curves.easeInOut),
    );
    fadetransition = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
          parent: sideBarAnimationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    super.dispose();
    sideBarAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeScreennavbar(
                      triggerAnimation: () {
                        setState(() {
                          sidebarhidden = !sidebarhidden;
                        });
                        sideBarAnimationController.forward();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Recents",
                            style: kLargeTitleStyle,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "23 courses,more coming",
                            style: kSubtitleStyle,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RecentCourselist(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Explore",
                            style: kLargeTitleStyle,
                          ),
                          SizedBox(
                            height: 19.0,
                          ),
                          ExploreCourselist(),
                          SizedBox(
                            height: 40.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ContinueWatchindscreen(),
            IgnorePointer(
              ignoring: sidebarhidden,
              child: Stack(
                children: [
                  FadeTransition(
                    opacity: fadetransition,
                    child: GestureDetector(
                      child: Container(
                        color: Color.fromRGBO(36, 38, 41, 0.4),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                      onTap: () {
                        sideBarAnimationController.reverse();
                        setState(() {
                          sidebarhidden = !sidebarhidden;
                        });
                      },
                    ),
                  ),
                  SlideTransition(
                    position: sideBarAnimation,
                    child: SafeArea(
                      child: SideBarscreen(),
                      bottom: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
