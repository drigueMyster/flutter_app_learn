import 'package:flutter/material.dart';
import '../Models/chat_model.dart';


class ChatScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new ListView.builder(
          itemCount: dumpyChat.length,
        itemBuilder: (context , i ) => new Column(
          children: <Widget>[
            new Divider(
              height: 10.0,
            ),
            new ListTile(
              leading: new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor ,
                backgroundColor: Colors.grey,
                backgroundImage: new NetworkImage(dumpyChat[i].avatarImage),
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    dumpyChat[i].name ,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    dumpyChat[i].time ,
                    style: new TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0
                    ),
                  )
                ],
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.5),
                child: new Text(
                    dumpyChat[i].message,
                  style: new TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}