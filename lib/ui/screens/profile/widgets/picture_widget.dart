// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors, prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:colibris_mobile/settings/config.dart';
import 'package:colibris_mobile/settings/const.dart';
import 'package:image_picker/image_picker.dart';

class PictureWidget extends StatefulWidget {
  bool _update;

  PictureWidget(this._update);

  @override
  _PictureWidgetState createState() => _PictureWidgetState();
}

class _PictureWidgetState extends State<PictureWidget> {
  final ImagePicker _picker = ImagePicker();
  PickedFile? imageFile;

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      imageFile = pickedFile;
    });
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            title: Text(
              "Choisir une option",
              style: TextStyle(color: Const.kToDark.shade300),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Const.kToDark.shade300,
                  ),
                  ListTile(
                    onTap: () {
                      takePhoto(ImageSource.gallery);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Const.kToDark.shade300,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Const.kToDark.shade300,
                  ),
                  ListTile(
                    onTap: () {
                      takePhoto(ImageSource.camera);
                    },
                    title: Text("Camera"),
                    leading: Icon(Icons.camera, color: Const.kToDark.shade300),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      backgroundImage:
          imageFile != null ? FileImage(File(imageFile!.path)) : null,
      radius: context.width * 0.15,
      child: widget._update
          ? InkWell(
              onTap: () {
                _showChoiceDialog(context);
              },
              child: Icon(
                Icons.camera_alt_outlined,
                size: context.width * 0.1,
                color: Colors.white,
              ))
          : null,
    );
  }
}
