import 'package:flutter/material.dart';

class User{

  String  username;
  String  numero;
  int     identifiant;
  String sexe;
  String dateNaissance;
  String profession;
  String region;

  User({this.identifiant, this.username,this.numero, this.sexe,
    this.dateNaissance, this.profession, this.region});


  factory User.fromJson (Map<String, dynamic> json){
    return User(
        identifiant: json["identifiant"],
        username:json["username"],
        numero: json["numero"],
        sexe: json["sexe"],
        dateNaissance: json["dateNaissance"],
        profession: json["profession"],
        region: json["region"]
    );
  }


}