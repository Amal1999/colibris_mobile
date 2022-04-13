// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, use_key_in_widget_constructors, prefer_final_fields

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:colibris_mobile/settings/config.dart';
import 'package:place_picker/entities/localization_item.dart';
import 'package:place_picker/place_picker.dart';
import 'package:colibris_mobile/settings/const.dart';

class InformationWidget extends StatefulWidget {
  String _label;
  String type;
  String content = "";
  int? maxDigits;
  bool update;
  String errorText;
  void Function(String)? getContent;
  void Function(LatLng)? getLatLng;

  InformationWidget(this._label, this.content,
      {this.type = "text",
      this.getContent,
      this.maxDigits,
      this.update = false,
      this.errorText = "",
      this.getLatLng});

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  FocusNode _focusNode = FocusNode();

  Widget getWidget(bool value) {
    if (value) {
      if (widget._label.toUpperCase() != "LOCATION")
        return TextFormField(
          focusNode: _focusNode,
          initialValue: widget.content,
          textInputAction: TextInputAction.next,
          keyboardType: widget.type == "email"
              ? TextInputType.emailAddress
              : widget.type == "number"
                  ? TextInputType.number
                  : TextInputType.text,
          maxLength: widget.maxDigits,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(48.0)),
              ),
              errorText: widget.errorText,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              )),
          onChanged: (value) {
            setState(() {
              widget.content = value;
              widget.getContent!(widget.content);
            });
          },
          onEditingComplete: () {
            setState(() {
              _focusNode.unfocus();
            });
          },
        );

      return ElevatedButton.icon(
        onPressed: () async {
          LocationResult result =
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Scaffold(
                        body: SafeArea(
                          child: PlacePicker(
                            "AIzaSyDoDpVoO9zkkAwUIDI3DUot_MbXb8juqhA",
                            localizationItem: LocalizationItem(
                                languageCode: "fr",
                                nearBy: "Lieux à proximité",
                                tapToSelectLocation:
                                    "Appuyez pour sélectionner cet emplacement"),
                          ),
                        ),
                      )));
          setState(() {
            widget.content = (result.name! + ", " + result.locality!);
            widget.getContent!(widget.content);
            widget.getLatLng!(result.latLng!);
          });
        },
        icon: Icon(Icons.location_pin, color: Colors.grey.shade100),
        label: Text(
          widget.content,
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
                Size(context.width, context.height * 0.05)),
            maximumSize: MaterialStateProperty.all(
                Size(context.width, context.height * 0.07)),
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade500),
            //Const.kToDark.shade200),
            overlayColor: MaterialStateProperty.all(Const.kToDark.shade50),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))))),
      );
    }
    return Text(
      widget.content,
      style:
          TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: context.width * 0.05,
              left: context.width * 0.04,
              right: context.width * 0.04),
          child: Text(
            widget._label + " :",
            style: TextStyle(
                color: Const.kToDark.shade600, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                bottom: context.width * 0.08,
                left: context.width * 0.04,
                right: context.width * 0.04),
            child: getWidget(widget.update)),
      ],
    );
  }
}
