// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:colibris_mobile/settings/config.dart';
import 'package:colibris_mobile/settings/const.dart';

class ButtonWidget extends StatefulWidget {
  bool _update;
  String label;
  void Function(bool) getUpdate;

  ButtonWidget(this._update, this.label, this.getUpdate);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget._update = !widget._update;
          widget.getUpdate(widget._update);
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Const.kToDark.shade600),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        minimumSize: MaterialStateProperty.all(
            Size(context.width * 0.4, context.height * 0.055)),
        maximumSize: MaterialStateProperty.all(
            Size(context.width * 0.45, context.height * 0.07)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Icon(
            widget._update ? Icons.check : Icons.settings,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
