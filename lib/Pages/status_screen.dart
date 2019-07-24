import 'package:flutter/material.dart';


class StatusScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StatusScreenState();
  }
}


class StatusScreenState extends State<StatusScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Text(
        "Status",
        style: new TextStyle(fontSize:  20),
      ),
    );
  }
}