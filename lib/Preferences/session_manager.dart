import 'package:shared_preferences/shared_preferences.dart';


class SessionManager{

  final String _identifiant = "identifiant";
  final String _username = "username";
  final String _numero = "numero";
  final String _sexe = "sexe";
  final String _dateNaissance = "dateNaissance";
  final String _profession = "profession";
  final String _region = "region";

  SessionManager();

  // Get user ID
  Future<int> getIdentifiant() async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.get(_identifiant) ?? 0;
  }

  // Set user ID
  Future<void> setIdentifiant(int _id) async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.setInt(_identifiant, _id);
  }

  // Get user Name
  Future<String> getUsername() async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    print("***Getting username");
    return prefs.get(_username) ?? "";
  }

  // Set user Name
  Future<void> setUsername(String _uName) async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    print("***Setting username");
    return prefs.setString(_username, _uName);
  }

  // Get user Number
  Future<String> getNumero() async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.get(_numero) ?? "";
  }

  // Set user Number
  Future<void> setNumero(String _uNumber) async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.setString(_numero, _uNumber);
  }

  // Get user Sexe
  Future<String> getSexe() async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.get(_sexe) ?? "";
  }

  // Set user Sexe
  Future<void> setSexe(String _uSexe) async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.setString(_sexe, _uSexe);
  }

  // Get user DateNaissance
  Future<String> getDateNaissance() async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.get(_sexe) ?? "";
  }

  // Set user DateNaissance
  Future<void> setDateNaissance(String _uDateNaiss) async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.setString(_dateNaissance, _uDateNaiss);
  }


  // Get user Profession
  Future<String> getProfession() async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.get(_profession) ?? "";
  }

  // Set user Profession
  Future<void> setProfession(String _uProfession) async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.setString(_profession, _uProfession);
  }

  // Get user Region
  Future<String> getRegion() async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.get(_region) ?? "";
  }

  // Set user Region
  Future<void> setRegion(String _uRegion) async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.setString(_region, _uRegion);
  }

  Future<void> logOut() async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.clear();
  }
}