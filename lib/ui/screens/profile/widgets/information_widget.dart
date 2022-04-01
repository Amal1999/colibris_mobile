// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:colibris_mobile/settings/config.dart';


class InformationWidget extends StatelessWidget {
  String label ;
  String content ="";
  InformationWidget(this.label,this.content);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom:context.width*0.05,left:context.width*0.08 ),
          child: Text(label+" :", style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom:context.width*0.08,left:context.width*0.08),
          child: Text(content, style: TextStyle(
            color: Colors.grey.shade800,
              fontWeight: FontWeight.bold

          ),
          ),
        ),

      ],
    );
  }
}
