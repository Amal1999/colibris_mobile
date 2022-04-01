// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:colibris_mobile/ui/screens/profile/widgets/information_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:colibris_mobile/settings/config.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: context.width *0.07,
          right: context.width *0.07,
          top: context.height *0.05,
      ),
        height: context.height * 0.8,
        width: context.width ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white30,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: context.width * 0.03,
                    bottom: context.width * 0.06),
                child: Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: context.width * 0.15,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: context.width * 0.06,
                    bottom: context.width * 0.12),
                child: Text(
                  "Flen Fouleni",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.width * 0.06,
                      color: Colors.grey.shade800),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(vertical: context.height * 0.02),
                height: context.height * 0.38,
                width: context.width * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InformationWidget("Email", 'sammari_a@outlook.fr'),
                      InformationWidget("Phone 1", '53265896'),
                      InformationWidget("Phone 2", '53265896'),
                      InformationWidget("Postal adress", '11758'),
                      InformationWidget("Residence name", 'iqamat lyassamine'),
                      InformationWidget("Location", ''),
                    ],
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  overlayColor: MaterialStateProperty.all(Colors.green.shade400),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all(Size(context.width*0.4, context.height*0.055)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Configurer",
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    )
                  ],
                ),)
            ],
          ),
        ),

    );
  }
}
