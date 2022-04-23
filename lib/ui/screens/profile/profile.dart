// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:colibris_mobile/ui/screens/profile/widgets/button_widget.dart';
import 'package:colibris_mobile/ui/screens/profile/widgets/information_widget.dart';
import 'package:colibris_mobile/ui/screens/profile/widgets/picture_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:colibris_mobile/settings/config.dart';
import 'package:colibris_mobile/settings/const.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Profile extends StatefulWidget {
  String email = 'sammari_a@outlook.fr';
  String phone1 = '53265896';
  String phone2 = '53265896';
  String postalAddress = "11752";
  String residenceName = "Iqamat el yassamine";
  String location = "tunisia";
  LatLng? latlng;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _update = false;
  String label = "Configurer";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.8,
      width: context.width,
      margin: EdgeInsets.only(
        left: context.width * 0.07,
        right: context.width * 0.07,
        top: context.height * 0.05,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white30,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: context.width * 0.03, bottom: context.width * 0.05),
              child: Text(
                "Profile",
                style: TextStyle(
                    color: Const.kToDark.shade600, fontWeight: FontWeight.bold),
              ),
            ),
            PictureWidget(_update),
            Padding(
              padding: EdgeInsets.only(
                  top: context.width * 0.06, bottom: context.width * 0.12),
              child: Text(
                "Flen Fouleni",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.width * 0.06,
                    color: Colors.grey.shade800),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: context.height * 0.004),
              height: context.height * 0.39,
              width: context.width * 0.85,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationWidget(
                      "Email",
                      widget.email,
                      update: _update,
                      getContent: (val) {
                        print(val + "email");
                        setState(() {
                          widget.email = val;
                          print(widget.email + "widget email");
                        });
                      },
                    ),
                    InformationWidget(
                      "Phone 1",
                      widget.phone1,
                      update: _update,
                      maxDigits: 8,
                      getContent: (val) {
                        print(val + "phone");
                        setState(() {
                          widget.phone1 = val;
                        });
                      },
                    ),
                    InformationWidget(
                      "Phone 2",
                      widget.phone2,
                      update: _update,
                      maxDigits: 8,
                      getContent: (val) {
                        setState(() {
                          widget.phone2 = val;
                        });
                      },
                    ),
                    InformationWidget(
                      "Postal adress",
                      widget.postalAddress,
                      update: _update,
                      getContent: (val) {
                        setState(() {
                          widget.postalAddress = val;
                        });
                      },
                    ),
                    InformationWidget(
                      "Residence name",
                      widget.residenceName,
                      update: _update,
                      getContent: (val) {
                        setState(() {
                          widget.residenceName = val;
                        });
                      },
                    ),
                    InformationWidget(
                      "Location",
                      widget.location,
                      update: _update,
                      getLatLng: (val) {
                        setState(() {
                          widget.latlng = val;
                          print(widget.latlng.toString());
                        });
                      },
                      getContent: (val) {
                        setState(() {
                          widget.location = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            ButtonWidget(_update, label, (value) {
              setState(() {
                _update = value;
                if (label.toUpperCase() == "CONFIGURER") {
                  label = "Save changes";
                } else {
                  label = "Configurer";
                }
              });
            })
          ],
        ),
      ),
    );
  }
}
