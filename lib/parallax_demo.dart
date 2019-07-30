import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ParallaxDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    List<String> _screens = ["A", "B", "C", "D"];
    // TODO: implement build
    return Scaffold(
      body: MaterialApp(

        title: "Parallax Demo",
        theme: ThemeData(primarySwatch: Colors.brown),
        home: AppComponent(screens: _screens),

      ),
    );
  }

  Future<void> main() async{
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

}

class AppComponent extends StatelessWidget{

  final List<String> screens;
  AppComponent({Key key, @required this.screens}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: Scaffold(
          body: Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              
            ],
          ),
        ),
        onWillPop: null);
  }
}