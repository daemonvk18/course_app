import 'package:flutter/material.dart';
import '../constants.dart';

class SideBarbutton extends StatelessWidget {
  SideBarbutton({required this.triggerAnimation});

  final Function()? triggerAnimation;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: triggerAnimation,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints(maxHeight: 40.0, maxWidth: 40.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0, 12),
              blurRadius: 15.0,
            ),
          ],
        ),
        child: Expanded(
          child: Image.asset(
            "asset/icons/icon-sidebar.png",
            color: kPrimaryLabelColor,
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 14.0,
          horizontal: 12.0,
        ),
      ),
    );
  }
}
