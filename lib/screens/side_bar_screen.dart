import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:course_app/model/sidebar.dart';
import 'package:course_app/components/sideBar_row.dart';

class SideBarscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSidebarBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34.0),
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: EdgeInsets.symmetric(
        vertical: 34.0,
        horizontal: 20.0,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("asset/images/profile.jpg"),
                  radius: 21.0,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Navya Preetham Reddy", style: kHeadlineLabelStyle),
                    SizedBox(height: 5.0),
                    Text(
                      "license ends on jan 21, 2023",
                      style: kSearchPlaceholderStyle,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            SideBarRow(
              item: sideBaritem[0],
            ),
            SizedBox(
              height: 32.0,
            ),
            SideBarRow(
              item: sideBaritem[1],
            ),
            SizedBox(
              height: 32.0,
            ),
            SideBarRow(
              item: sideBaritem[2],
            ),
            SizedBox(
              height: 32.0,
            ),
            SideBarRow(
              item: sideBaritem[3],
            ),
            SizedBox(
              height: 32.0,
            ),
            Spacer(), //we will use spacer so that eveything below it will be pushed down to the bottom.
            Row(
              children: [
                Image.asset(
                  "asset/icons/icon-logout.png",
                  width: 17.0,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  "log out",
                  style: kSecondaryCalloutLabelStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
