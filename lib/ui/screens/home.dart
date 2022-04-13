// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:colibris_mobile/ui/screens/profile/profile.dart';
import 'package:colibris_mobile/settings/config.dart';
import 'package:colibris_mobile/settings/const.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _screens = [
    Center(
      child: Text("first"),
    ),
    Profile(),
    Center(
      child: Text("last"),
    )
  ];
  int _currentIndex = 1;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SafeArea(
          bottom: false,
          child: Stack(children: [
            Container(
              height: context.height,
              width: context.width,
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      colors: [Const.kToDark, Colors.white10],
                      center: Alignment.topRight,
                      radius: 1.2)),
              child: Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Colors.blue.shade100, Colors.white10],
                        center: Alignment.bottomLeft,
                        radius: 1.7)),
              ),
            ),
            _screens[_currentIndex],
          ])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Const.kToDark.shade500,
        onPressed: () {
          setState(() {
            _currentIndex = 1;
          });
        },
        tooltip: 'js',
        child: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                height: context.height * 0.07,
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                child: Text(
                  "Pending reuquests",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                child: Text(
                  "Request pickup",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
