import 'package:flutter/material.dart';
import '../constants.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(left: 13.0, right: 35.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: kShadowColor, offset: Offset(0, 12), blurRadius: 15.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            cursorColor: kPrimaryLabelColor,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: kPrimaryLabelColor,
                  size: 20.0,
                ),
                border: InputBorder.none,
                hintText: 'Search for Courses',
                hintStyle: kSearchPlaceholderStyle),
            style: kSearchTextStyle,
            onChanged: (newText) {
              print(newText);
            },
          ),
        ),
      ),
    ));
  }
}
