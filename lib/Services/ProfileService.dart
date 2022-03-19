import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:colibris_mobile/screens/CreateProfile.dart';
import 'package:colibris_mobile/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService { 
   Future<bool> AddProfile (Map<String,dynamic> task) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(
      Uri.parse("http://10.0.2.2:3000/user"),
      body: task
    );
    return(response.statusCode==201);
  }
}
  