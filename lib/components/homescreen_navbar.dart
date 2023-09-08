import 'package:course_app/components/search_field.dart';
import 'package:course_app/components/sidebar_button.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/profilescreen.dart';

class HomeScreennavbar extends StatelessWidget {
  HomeScreennavbar({required this.triggerAnimation});

  late final Function()? triggerAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SideBarbutton(
            triggerAnimation: triggerAnimation,
          ),
          SearchField(),
          Icon(
            Icons.notifications,
            color: kPrimaryLabelColor,
          ),
          SizedBox(
            width: 15.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Profilescreen()));
            },
            child: CircleAvatar(
              backgroundImage: AssetImage("asset/images/profile.jpg"),
              radius: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
