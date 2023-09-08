import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../components/certificate_viewer.dart';
import '../components/lists/ContinueWatching_list.dart';
import '../constants.dart';

class ContinueWatchindscreen extends StatelessWidget {
  const ContinueWatchindscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35.0),
      ),
      color: kCardPopupBackgroundColor,
      boxShadow: [
        BoxShadow(
          color: kShadowColor,
          offset: Offset(0, -12),
          blurRadius: 30.0,
        )
      ],
      minHeight: 85.0,
      maxHeight: MediaQuery.of(context).size.height *
          0.75, //it will occupy 75% of the screen.
      panel: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Container(
                height: 4.0,
                width: 42.0,
                decoration: BoxDecoration(
                    color: Color(0xFFC5CBD6),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 17.0, horizontal: 28.0),
            child: Text(
              "Continue Watching",
              style: kLargeTitleStyle,
            ),
          ),
          ContinueWatchinglist(),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              "Certificates",
              style: kLargeTitleStyle,
            ),
          ),
          CertificateViewer(),
        ],
      ),
    );
  }
}
