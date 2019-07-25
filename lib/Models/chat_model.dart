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
        "https://images.pexels.com/photos/1082962/pexels-photo-1082962.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),

    new ChatModel( "James Matys", "aah daccord, on le fait vendredi vers 16h comme ça je serai dispo","14:10",  "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    new ChatModel( "CELLULE DE PRIÈRE EXAUCÉE", "Tu te préoccuperas plus de ton corps en décomposition, car les gens prendront soin de ce qui est nécessaire.","12:20",  "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    new ChatModel( "Godfried", "Bonjour Boss","12:05",  "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    new ChatModel( "Steven", "Ok merci beaucoup, donc l'argent sera positionné d'ici au moin 3 jrs ou bien??","Hier 21:15",  "https://images.pexels.com/photos/555790/pexels-photo-555790.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    new ChatModel( "Ellissa", "Superman s'envole, on l'appelle héros mais quand la grand-mère du village s'envole on l'appelle sorcière.","Hier 20:00",  "https://images.pexels.com/photos/556666/pexels-photo-556666.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    new ChatModel( "McArthy", "Apres il faut essayé la nouvelle version de flutter","Hier 15:05",  "https://images.pexels.com/photos/941693/pexels-photo-941693.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),

  ];
