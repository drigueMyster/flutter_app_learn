import 'package:flutter/material.dart';
import 'Pages/camera_screen.dart';
import 'Pages/chat_screen.dart';
import 'Pages/status_screen.dart';
import 'Pages/call_screen.dart';


class WhatsAppHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WhatsAppHomeState();
  }
}

class WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(initialIndex: 1,length: 4, vsync: this);
  }
  
  @override
  Widget build(BuildContext context){
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Whatsapp"),
        elevation: 0.7,
        bottom: new TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(icon : new Icon(Icons.camera_alt)),
              new Tab(text: "CHATS"),
              new Tab(
                text: "STATUS",
              ),
              new Tab(
                text: "CALLS",
              )
            ]
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0)),
          new Icon(Icons.more_vert),
        ],
      ),
      body: new TabBarView(
          controller : _tabController,
          children: <Widget>[
            new CameraScreen(),
            new ChatScreen(),
            new StatusScreen(),
            new CallScreen()
          ]),
      floatingActionButton:  new FloatingActionButton(
          child: new Icon(Icons.message),
          backgroundColor: new Color(0xff25D366),
          onPressed: () => print("Open the chat")
      ),
    );
  }

}