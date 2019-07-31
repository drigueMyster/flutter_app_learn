import 'package:flutter/material.dart';
import 'package:flutter_app/Models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/Preferences/session_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String _showText = "Hope God will do it";
  SessionManager _sessionManager = new SessionManager();
  SharedPreferences prefs;

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
                                        Future<User> _user = _makeServerAuthRequest(_inputNumberController.text, _inputPswdController.text);

                                        setUsername();

                                        print("****Name User ==> ${prefs.get('username')}");
                                        _sessionManager.setUsername("Boosttrap");
                                        _user.then((user) => (){
                                            _sessionManager.setUsername(user.username);
                                            print("****Name User ==> ${_sessionManager.getUsername()}");
                                        },onError: (e){
                                            print("****Une erreur s'est produite ${e.toString()}");
                                        });

                                        ///print("****Name User ==> ${_sessionManager.getUsername()}");
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
                            child: Text("$_showText", style: TextStyle(fontFamily: "UnbuntuLight")),
                              
                          )
                          
                        ],
                      ),
                    ),
                  ),
            );
          })
        ));
  }

    setUsername() async{
    prefs =  await SharedPreferences.getInstance();
    return prefs.setString("username", _inputNumberController.text) ?? "";
  }

  Future<User> _makeServerAuthRequest(numero, password) async{
    String url = "https://econvivial.org/postWebRequestAuthenticate?numero=228 $numero&password=$password";

    final response = await http.get(url);
    dynamic jsonResponse = json.decode(response.body);

    if(response.statusCode == 200 && jsonResponse["error"] == false){
      setState(() {
        _showText = jsonResponse.toString();
      });

      return User.fromJson(jsonResponse);
    }else{
      setState(() {
        _showText = jsonResponse.toString();
      });
      return null;
    }
  }
}
