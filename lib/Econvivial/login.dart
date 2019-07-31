import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController _inputNumberController = new TextEditingController();
  TextEditingController _inputPswdController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Builder(builder: (BuildContext context){
            return Center(
              child: Container(
                  padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: _globalKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(20.0),
                            child: Text(
                              "Connectez-vous à l'application",
                              style: TextStyle(
                                  fontFamily: "UnbuntuLight", fontSize: 20.0),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _inputNumberController,
                              validator: (value) {
                                if (value.length == 0 || value.length != 8) {
                                  return "Veuillez saisir un numéro valide";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: "Votre numéro de téléphone",
                                contentPadding: EdgeInsets.all(20.0),
                              ),
                              style: TextStyle(fontFamily: "UnbuntuLight"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _inputPswdController,
                              validator: (value) {
                                if (value.length == 0) {
                                  return "Veuillez saisir un mot de passe";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: "Votre mot de passe",
                                contentPadding: EdgeInsets.all(20.0),
                              ),
                              style: TextStyle(fontFamily: "UnbuntuLight"),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.all(10.0),
                              child:GestureDetector(
                                onTap: (){

                                },
                                child:  SizedBox(
                                  width: double.infinity,
                                  height: 50.0,
                                  child: RaisedButton(
                                    textColor: Theme.of(context).primaryColor,
                                    onPressed: (){
                                      if(_globalKey.currentState.validate()){
                                        Scaffold
                                            .of(context)
                                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                                      }
                                    },
                                    child: Text("Se connecter", style: TextStyle(fontFamily: "UnbuntuLight"),),
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(color: Theme.of(context).primaryColor),
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.all(20.0),
                            child: Text("Hope is good"),
                              
                          )
                          
                        ],
                      ),
                    ),
                  ),
            );
          })
        ));
  }

  _makeServerRequest(){
    String url = "https://econvivial.org/postWebRequestAuthenticate?numero=92104584&password=drigue";
  }
}
