import 'dart:math';
import 'package:flutter/material.dart';

class CertificateViewer extends StatefulWidget {
  @override
  State<CertificateViewer> createState() => _CertificateViewerState();
}

class _CertificateViewerState extends State<CertificateViewer> {
  final List<String> certificatespath = [
    "asset/certificates/certificate-01.png",
    "asset/certificates/certificate-02.png",
    "asset/certificates/certificate-03.png"
  ];

  late Widget certificateviewer;

  @override
  void initState() {
    super.initState();
    List<Widget> imageChildren =
        []; //we will adding all the images to the imagechildren(variable
    // type of widget which is going to be a list)
    certificatespath.reversed.toList().asMap().forEach((index, certificates) {
      int angleDegree;

      if (index == certificatespath.length - 1) {
        angleDegree = 0;
      } else {
        angleDegree = Random().nextInt(15) - 5;
      }
      imageChildren.add(Transform.rotate(
        angle: angleDegree * (pi / 180),
        child: Image.asset(
          certificates,
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
      ));
    });

    certificateviewer = Stack(
      children: imageChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: certificateviewer,
    );
  }
}
