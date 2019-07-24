import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CameraScreenState();
  }
}


class CameraScreenState extends State<CameraScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Center(
      child: new Text(
        "Camera",
        style: new TextStyle(fontSize:  20),
      ),
    );
  }
}