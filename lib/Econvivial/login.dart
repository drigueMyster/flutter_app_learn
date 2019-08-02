import 'package:flutter/material.dart';
import 'package:flutter_app/Models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/Preferences/session_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';
import 'package:flutter_app/form.dart';

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
  String _createAccount = "Vous n'avez pas de compte ? Créer un compte";
  String _changePassword = "Changer votre mot de passe";
  SessionManager _sessionManager = new SessionManager();
  SharedPreferences prefs;
  ProgressDialog progressDialog;

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
            child: Builder(builder: (BuildContext context) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(10.0),
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
                        keyboardType: TextInputType.phone,
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
                        keyboardType: TextInputType.text,
                        obscureText: true,
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
                        child: GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: RaisedButton(
                              textColor: Theme.of(context).primaryColor,
                              onPressed: () {
                                if (_globalKey.currentState.validate()) {
                                  progressDialog = new ProgressDialog(
                                      context, ProgressDialogType.Normal);
                                  progressDialog.setMessage(
                                      "Authentification en cours ...");
                                  progressDialog.show();

                                  _makeServerAuthRequest(
                                      _inputNumberController.text,
                                      _inputPswdController.text);
                                }
                              },
                              child: Text(
                                "Se connecter",
                                style: TextStyle(fontFamily: "UnbuntuLight"),
                              ),
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        child: Text(
                          _createAccount,
                          style: TextStyle(
                            fontFamily: "UnbuntuLight",
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onTap: (){
                          print("hope");
                          return showDialog(
                              context: context,
                              builder: (BuildContext buildContext){
                                return AlertDialog(
                                  title: Text("Information"),
                                  content: Text("Fonctionnalité en cours d'implémentation"),
                                  actions: <Widget>[
                                    new FlatButton(
                                        onPressed: (){
                                          Navigator.of(buildContext).pop();
                                        },
                                        child: Text("Fermer")),

                                  ],
                                );
                              }
                          );
                        },
                      )
                    ),
                    Container(
                      margin: EdgeInsets.all(0.0),
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        _changePassword,
                        style: TextStyle(
                          fontFamily: "UnbuntuLight",
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        })));
  }

  Future<User> _makeServerAuthRequest(numero, password) async {
    String url =
        "https://econvivial.org/postWebRequestAuthenticate?numero=228 $numero&password=$password";

    final response = await http.get(url);
    dynamic jsonResponse = json.decode(response.body);

    if (response.statusCode == 200 && jsonResponse["error"] == false) {
      settingPrefValues(jsonResponse);

      String username = await _sessionManager.getUsername();
      print("***Username ==>  ${username}");

      progressDialog.hide();
      Toast.show("Authentification réussi", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      Navigator.pushReplacementNamed(context, DetailScreenState.routeName);
      //Navigator.of(context).pop();
      return User.fromJson(jsonResponse);
    } else {
      Toast.show(
          "Une erreur s'est produite impossible de se connecter", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      progressDialog.hide();
      return null;
    }
  }

  settingPrefValues(dynamic jsonResponse) {
    _sessionManager.setUsername(jsonResponse["username"]);
    _sessionManager.setDateNaissance(jsonResponse["dateNaissance"]);
    _sessionManager.setIdentifiant(jsonResponse["identifiant"]);
    _sessionManager.setNumero(jsonResponse["numero"]);
    _sessionManager.setProfession(jsonResponse["profession"]);
    _sessionManager.setSexe(jsonResponse["sexe"]);
  }
}
