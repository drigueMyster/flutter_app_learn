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
          itemBuilder: (context , i ) => new GestureDetector(
            onTap: () => _showChatDetail(context, dumpyChat[i]),
            child: new Column(
              children: <Widget>[
                new Divider(
                  height: 10.0,
                ),
                new ListTile(
                  leading: new Container(

                    child: GestureDetector(
                      child: new CircleAvatar(
                        foregroundColor: Theme.of(context).primaryColor ,
                        backgroundColor: Colors.grey,
                        backgroundImage: new NetworkImage(dumpyChat[i].avatarImage),
                      ),
                      onTap: (){
                        _showChatDetail(context, dumpyChat[i]);
                      },
                    ),
                    height: 50.0,
                    width: 50.0,
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
                          fontSize: 12.0,
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          )
      )
    );
  }
}

_showChatDetail(BuildContext context, ChatModel model){
  Navigator.pushNamed(context,
    ChatDetail.routeName,
    arguments: ChatArgument(model),
  );
}

class ChatArgument{
  ChatModel chatModel;
  ChatArgument(this.chatModel);
}



class ChatDetail extends StatelessWidget{

  static  const  routeName  = "/chatDetail";

  @override
  Widget build(BuildContext context) {

   final ChatArgument args = ModalRoute.of(context).settings.arguments;

    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("${args.chatModel.name}"),
      ),

      body: SingleChildScrollView(
        child:  new Column(
          children: <Widget>[
            Hero(
              child: Image.network("${args.chatModel.avatarImage}"),
              tag: "img${args.chatModel.avatarImage}",
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Hope"),
              ),
            )
          ],
        ),
      )
    );
  }
}