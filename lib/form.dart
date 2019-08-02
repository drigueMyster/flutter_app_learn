import 'package:flutter/material.dart';
import 'dart:math';
import 'Preferences/session_manager.dart';
import 'package:toast/toast.dart';
import 'dashboard.dart';

class MyCustomFormState extends State<MyCustomForm> {
  final _keyGlobal = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldSate = new GlobalKey<ScaffoldState>();
  FocusNode _focusNode;
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  String username, password;

  SessionManager sessionManager = new SessionManager();
  MyCustomFormState();
  MyCustomFormState.withArgs(this.username, this.password);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
    _controller.addListener(_printInputValue);
    _controllerPassword.addListener(_printPswValue);
    print("*****Hope it passed here");
    // FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode.dispose();
    super.dispose();
  }

  _printInputValue() {
    this.username = _controller.text;
  }

  _printPswValue() {
    this.password = _controllerPassword.text;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
          actions: <Widget>[
            // IconButton(icon: Icon(Icons.list), onPressed: _p)
          ],
        ),
        body: Builder(builder: (BuildContext context) {
          return Center(
            // child: Text(wordPair.asPascalCase),
            child: SingleChildScrollView(
              child: Form(
                key: _keyGlobal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "App Authentication",
                        style: TextStyle(fontSize: 20),
                      ),
                      margin: EdgeInsets.all(30),
                    ),
//               Container(
//                 margin: EdgeInsets.only(left: 10, right: 10, top: 10),
//                 child: GestureDetector(
//                     onTap: () {
////                Navigator.push(context, MaterialPageRoute(builder: (_){
////                  return DetailScreen();
////                }));
//                       Navigator.pushNamed(context, "/detail");
//                     },
//                     child: Hero(
//                       tag: "showImg",
//                       child: Image.network("https://picsum.photos/250?image=9"),
//                     )),
//               ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: TextFormField(
                        //  focusNode: _focusNode,
                        controller: _controller,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuiller remplir le champ";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          // contentPadding: EdgeInsets.all(10),
                          hintText: "Saisir votre numéro de tél",
                          //labelText: "Numéro télephone"
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextFormField(
                        controller: _controllerPassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuiller remplir le champ";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          // contentPadding: EdgeInsets.all(10),
                          hintText: "Saisir votre mot de passe",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      //  padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton.icon(
                          onPressed: () {
                            if (_keyGlobal.currentState.validate()) {
//                         Scaffold.of(context).showSnackBar(
//                             SnackBar(content: Text("Data processing")));
                              _navigateToNextScreenWithResult(context);
                            }
//                       return
//                         showDialog<void>(
//                         context: context,
//                         barrierDismissible:
//                         true, // false = user must tap button, true = tap outside dialog
//                         builder: (BuildContext dialogContext) {
//                           return AlertDialog(
//                             title: Text('title'),
//                             content: Text(_controller.text),
//                             actions: <Widget>[
//                               FlatButton(
//                                 child: Text('Fermer'),
//                                 onPressed: () {
//                                   Navigator.of(dialogContext)
//                                       .pop(); // Dismiss alert dialog
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
                          },
                          label: Text("Soumettre"),
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    Container()
                  ],
                ),
              ),
            ),
          );
        }));
  }

  _navigateToNextScreenWithResult(BuildContext context) async {
    final result = await Navigator.pushNamed(context, "/detail",
        arguments: ScreenArguments(this.username, this.password));

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result"), key: _scaffoldSate));
  }
}

class ScreenArguments {
  final String username;
  final String password;

  ScreenArguments(this.username, this.password);
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    // TODO: implement createState
    return MyCustomFormState();
  }
}

class DetailScreen extends StatefulWidget {
  @override
  DetailScreenState createState() {
    // TODO: implement createState
    return DetailScreenState();
  }
}

class DetailScreenState extends State<DetailScreen> {
  static const routeName = "/detail";

  double _width = 150;
  double _height = 150;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  SessionManager sessionManager = new SessionManager();

  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //final MyCustomFormState args = ModalRoute.of(context).settings.arguments;
    //final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    //print(${args.toString()});
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 80.0,
                          width: 80.0,
                          margin: EdgeInsets.fromLTRB(0, 20.0, 0.0, 10.0),
                          child: Hero(
                              tag: "showImg",
                              child: CircleAvatar(
                                foregroundColor: Theme.of(context).primaryColor,
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(
                                    "https://picsum.photos/250?image=9"),
                              )
                          ),
                        ),
                        Text("Username and Info",
                            style: TextStyle(
                                fontFamily: "UnbuntuLight",
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(color: Colors.green)),
            ListTile(
              title: Text("Dashboard",
                  style: TextStyle(fontFamily: 'UnbuntuLight')),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Menu principale",
                style: TextStyle(fontFamily: 'UnbuntuLight'),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Déconnexion",
                style: TextStyle(fontFamily: 'UnbuntuLight'),
              ),
              onTap: () {
                print("Hope it work");
                sessionManager.logOut();
                if (Navigator.canPop(context)) {
                  Navigator.pop(context, "Retour au bercaille");
                  Toast.show("Déconnexion", context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                }
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(10.0),
                child: GestureDetector(
                  child: Text(
                    "Hope  it work",
                  ),
                  onTap: () {
                    Navigator.pop(context, "Retour au bercaille");
                  },
                )),
            showCard(context),
            accessDashBoard(context),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.play_arrow, color: Colors.white),
        tooltip: "Animate",
        onPressed: () {
          setState(() {
            //Set the container visibility

            _visible = !_visible;
            // Create a random number generator.
            final random = Random();
            // Generate a random width and height.
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            // Generate a random color.
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );

            // Generate a random border radius.
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
            print("***Press on button ==> $_width");
          });
        },
      ),
    );
  }

  Widget showCard(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('BUY TICKETS'),
                    onPressed: () {/* ... */},
                  ),
                  FlatButton(
                    child: const Text('LISTEN'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget accessDashBoard(BuildContext context) {
    return Center(
        child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          const SizedBox(height: 20),
          RaisedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, DashBoardAppState.routeName);
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child:
                  const Text('Access Dashboard', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    ));
  }
}
