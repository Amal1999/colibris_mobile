import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    googleAccount.value = await _googleSignin.signIn();
  }

  logout() async {
    googleAccount.value = await _googleSignin.signOut();
  }

  Column buildProfileView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(this.googleAccount.value?.photoUrl ?? '').image,
          radius: 100,
        ),
        Text(
          this.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.headline1,
        ),
        Text(
          this.googleAccount.value?.email ?? '',
          style: Get.textTheme.bodyText1,
        ),
        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text("Logout"),
            onPressed: () {
              this.logout();
            })
      ],
    );
  }

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        this.login();
      },
      label: const Text(
        'Sign in with Google',
      ),
      backgroundColor: Colors.blue,
    );
  }
}
