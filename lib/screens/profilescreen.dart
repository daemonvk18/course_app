import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/lists/Completedcourse_list.dart';
import '../constants.dart';
import 'package:course_app/components/certificate_viewer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class Profilescreen extends StatefulWidget {
  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  var badges = [];

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;

  var name = 'loading..';
  var bio = 'oading...';
  var photoURL = FirebaseAuth.instance.currentUser?.photoURL;

  void LoadUserdata() {
    _firestore
        .collection("users")
        .doc(_auth.currentUser?.uid)
        .get()
        .then((snapshot) {
      setState(() {
        name = snapshot.data()?['name'];
        bio = snapshot.data()?['bio'];
      });
    });
  }

  void UpdateUserdata() {
    _firestore
        .collection("users")
        .doc(_auth.currentUser?.uid)
        .update({'name': name, 'bio': bio}).then((value) {
      showDialog(
          context: context,
          builder: (contex) {
            return AlertDialog(
              content: Text("your profile has been updated"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("ok")),
              ],
            );
          });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (contex) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("${err}"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Try Again")),
              ],
            );
          });
    }); //it will remove the eror if something is bugging around.
  }

  void loadBadges() {
    _firestore
        .collection("users")
        .doc(_auth.currentUser?.uid)
        .get()
        .then((snapshot) {
      for (var badge in snapshot.data()?['badges']) {
        _storage.ref("badges/${badge}").getDownloadURL().then((Url) {
          setState(() {
            badges.add(Url);
          });
        });
      }
    });
  }

  Future getImage() async {
    final pickedfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedfile != null) {
      File _image = File(pickedfile.path);
      _storage
          .ref("profilepictures/${_auth.currentUser?.uid}.jpg")
          .putFile(_image)
          .then((snapshot) {
        snapshot.ref.getDownloadURL().then((url) {
          _firestore.collection("users").doc(_auth.currentUser?.uid).update({
            'profilepic': url,
          }).then((snapshot) {
            _auth.currentUser?.updateProfile(photoURL: url);
          });
        });
      });
    } else {
      print('image is not picked');
    }
  }

  @override
  void initState() {
    super.initState();
    LoadUserdata();
    loadBadges();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
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
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 24.0, bottom: 28.0, left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RawMaterialButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            constraints: BoxConstraints(
                              maxHeight: 24.0,
                              minWidth: 40.0,
                              maxWidth: 40.0,
                            ),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: kSecondaryLabelColor,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Profile",
                                style: kCalloutLabelStyle,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Center(
                                          child: Text(
                                        "Edit Profile",
                                      )),
                                      content: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Name'),
                                          TextField(
                                            onChanged: (newvalue) {
                                              setState(() {
                                                name = newvalue;
                                              });
                                            },
                                            controller: TextEditingController(
                                                text: name),
                                          ),
                                          SizedBox(),
                                          Text("Bio"),
                                          TextField(
                                            onChanged: (newvalue) {
                                              bio = newvalue;
                                            },
                                            controller: TextEditingController(
                                                text: bio),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                Navigator.of(context).pop();
                                                UpdateUserdata();
                                              });
                                            },
                                            child: Text("Update")),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: kShadowColor,
                                    offset: Offset(0, 10),
                                    blurRadius: 12.0,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.edit,
                                color: kSecondaryLabelColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              getImage();
                            },
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xFFE7EEFB),
                                      child: (photoURL != null)
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              child: Image.network(
                                                photoURL!,
                                                width: 60.0,
                                                height: 60.0,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : Icon(Icons.person),
                                      radius: 30.0,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: kBackgroundColor,
                                      borderRadius:
                                          BorderRadius.circular(42.0)),
                                ),
                              ),
                              height: 84.0,
                              width: 84.0,
                              decoration: BoxDecoration(
                                gradient: RadialGradient(
                                  colors: [
                                    Color(0xFF00AEFF),
                                    Color(0xFF0076FF),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(42.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${name}",
                                style: kTitle2Style,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text("${bio}",
                                  style: kSecondaryCalloutLabelStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0, bottom: 16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 23.0, vertical: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Badges",
                                  style: kTitle2Style,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "See all",
                                      style: kSecondaryCalloutLabelStyle,
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      size: 21.0,
                                      color: kSecondaryLabelColor,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 112.0,
                            width: double.infinity,
                            child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 28.0),
                                scrollDirection: Axis.horizontal,
                                itemCount: badges.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.only(
                                        left: 20.0,
                                        right: index != 3 ? 0.0 : 20.0),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: kShadowColor.withOpacity(0.1),
                                          offset: Offset(0, 12),
                                          blurRadius: 18.0,
                                        ),
                                      ],
                                    ),
                                    child: Image.network("${badges[index]}"),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Certificates",
                    style: kTitle2Style,
                  ),
                  Row(
                    children: [
                      Text(
                        "See all",
                        style: kSecondaryCalloutLabelStyle,
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 21.0,
                        color: kSecondaryLabelColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
            CertificateViewer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Completed Courses",
                    style: kTitle2Style,
                  ),
                  Row(
                    children: [
                      Text(
                        "See all",
                        style: kSecondaryCalloutLabelStyle,
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 21.0,
                        color: kSecondaryLabelColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            CompletedcourseList(),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
