import 'package:flutter/material.dart';


class CallScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CallScreenState();
  }
}


class CallScreenState extends State<CallScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Text(
        "Call",
        style: new TextStyle(fontSize:  20),
      ),
    );
  }
}