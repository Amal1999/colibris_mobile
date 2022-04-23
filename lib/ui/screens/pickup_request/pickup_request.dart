// ignore_for_file: prefer_const_constructors

import 'package:colibris_mobile/ui/screens/pickup_request/widgets/step_progress_view.dart';
import 'package:flutter/material.dart';

class PickupRequest extends StatefulWidget {
  const PickupRequest({Key? key}) : super(key: key);

  @override
  _PickupRequestState createState() => _PickupRequestState();
}

class _PickupRequestState extends State<PickupRequest> {
  final List<String> titles = ["Choisir une adresse", "Choisir une date", "Choisir la période","Confirmer"];
  final int _curStep = 1;
  @override
  Widget build(BuildContext context) {
    return StepProgressView(width: MediaQuery.of(context).size.width,
        curStep: _curStep,
        color: Color(0xff50AC02),
        titles: titles);
  }
}
