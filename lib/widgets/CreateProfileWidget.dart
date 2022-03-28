// ignore_for_file: unnecessary_null_comparison

import 'dart:io'as io;
import 'package:flutter/material.dart';
import 'package:colibris_mobile/screens/CreateProfile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:colibris_mobile/models/user.dart';


 Widget imageProfile(BuildContext context ) {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0, 
          backgroundImage: AssetImage("assets/userprofile.jpg"),
          // imageFile == null ?
             // : FileImage(File(imageFile.path)),
          //   : Image(image: FileImage(File(path)))
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
              context: context,
                builder: ((builder) => bottomSheet(context)),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choisir votre photo de profil",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
                
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
              takePhoto(ImageSource.gallery);
              },
              label: Text("Galerie"),
            ),
          ])
        ],
      ),
    );
  }
     
 
  

   void takePhoto(ImageSource source) async {
      final ImagePicker _picker = ImagePicker();

    final pickedFile = await _picker.getImage(
      source: source,
    ),
     imageFile = pickedFile;
       }