
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  static final _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  Future Login() async {
    googleAccount.value =  await GoogleSignIn().signIn();
  }
  Future Logout() async {
    googleAccount.value = await _googleSignin.signOut();
  }
  Column buildProfileView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(googleAccount.value?.photoUrl ?? '').image,
          radius: 100,
        ),
        Text(
          googleAccount.value?.displayName ?? '',
          style: Get.textTheme.headline1,
        ),
        Text(
          googleAccount.value?.email ?? '',
          style: Get.textTheme.bodyText1,
        ),
        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text("Logout"),
            onPressed: () {
              Logout();
            })
      ],
    );
  }

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        Login();
      },
      label: const Text(
        'Sign in with Google',
      ),
      backgroundColor: Colors.blue,
    );
  }
}
