import 'package:flutter/material.dart';


class ChatModel{
  String name;
  String message;
  String time;
  String avatarImage;


  ChatModel(this.name, this.message, this.time, this.avatarImage);
}
  List<ChatModel> dumpyChat = [
    new ChatModel(
        "Abalo",
        "First message",
        "21:15",
        "avatar1.png"),

    new ChatModel( "Abalo", "First message","21:15",  ""),
    new ChatModel( "Abalo", "First message","21:15",  ""),
    new ChatModel( "Abalo", "First message","21:15",  ""),
    new ChatModel( "Abalo", "First message","21:15",  ""),
    new ChatModel( "Abalo", "First message","21:15",  ""),
    new ChatModel( "Abalo", "First message","21:15",  ""),

  ];
