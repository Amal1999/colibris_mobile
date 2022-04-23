import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {


  int ?userid;
  String ?avatar="assets/userprofile.jpg";
  String ?username;
  String ?email;
  String ?phone1;
    String ?phone2="";
  int ?role;
  User({
    this.userid,
    this.avatar,
    this.username,
    this.email,
    this.phone1,
    this.phone2,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userid: json["userid"],
    avatar: json["avatar"],
    username: json["username"],
    email: json["email"],
    phone1: json["phone1"],
    phone2:json["phone2"],
    role: json["role"],

  );

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "avatar": avatar,
    "username": username,
    "email": email,
    "phone1":phone1,
    "phone2":phone2,
    "role":role,
    
  };}