import 'package:flutter/material.dart';

class MyCustomFormState extends State<MyCustomForm> {
  final _keyGlobal = GlobalKey<FormState>();
  FocusNode _focusNode;
  TextEditingController _controller = TextEditingController();

  String username, password;

  MyCustomFormState();
  MyCustomFormState.withArgs(this.username, this.password);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
    _controller.addListener(_printInputValue);
    print("*****Hope it passed here");
    // FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode.dispose();
    //   _controller.dispose();
    super.dispose();
  }

  _printInputValue() {
    this.username = _controller.text;
    print("Saisi ===> ${_controller.text}");
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
      body: Center(
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
               Container(
                 margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                 child: GestureDetector(
                     onTap: () {
//                Navigator.push(context, MaterialPageRoute(builder: (_){
//                  return DetailScreen();
//                }));

                       Navigator.pushNamed(context, "/detail");
                     },
                     child: Hero(
                       tag: "showImg",
                       child: Image.network("https://picsum.photos/250?image=9"),
                     )),
               ),
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
                         Scaffold.of(context).showSnackBar(
                             SnackBar(content: Text("Data processing")));
                       }
                       return showDialog<void>(
                         context: context,
                         barrierDismissible:
                         true, // false = user must tap button, true = tap outside dialog
                         builder: (BuildContext dialogContext) {
                           return AlertDialog(
                             title: Text('title'),
                             content: Text(_controller.text),
                             actions: <Widget>[
                               FlatButton(
                                 child: Text('Fermer'),
                                 onPressed: () {
                                   Navigator.of(dialogContext)
                                       .pop(); // Dismiss alert dialog
                                 },
                               ),
                               FlatButton(
                                   onPressed: null, child: Text("Suivant"))
                             ],
                           );
                         },
                       );
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
             ],
           ),
         ),
       ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    // TODO: implement createState
    return MyCustomFormState();
  }
}

class DetailScreen extends StatelessWidget {

  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final MyCustomFormState args = ModalRoute.of(context).settings.arguments;
    //print(${args.toString()});
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page  ==>${args.username} "),
      ),
      body: GestureDetector(
        child: Center(
            child: Hero(
                tag: "showImg",
                child: Image.network("https://picsum.photos/250?image=9"))),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
