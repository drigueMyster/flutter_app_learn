import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'whatsapp_page.dart';
import 'form.dart';
import 'Pages/chat_screen.dart';
import 'awesome_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    num number = 10;
    return MaterialApp(
      //title: 'First Flutter app',
      initialRoute: "/",
      theme: new ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff25D366)
      ),
     // home: new MyCustomForm(),
      routes: {
        //"/" : (context) => WhatsAppHome(),
        "/" : (context) => AwesomeLogin(),
        "/loginForm" : (context) => MyCustomForm(),
        DetailScreenState.routeName : (context) => DetailScreen(),
        ChatDetail.routeName : (context) => ChatDetail(),
      },
    );
  }
}


class RandomWordsState extends State<RandomWords>{
 // final _suggestion =
  final List<WordPair> _suggestion = <WordPair>[];
  final Set<WordPair> _saveWord = Set<WordPair>();
  final TextStyle _biggestFont = const TextStyle(fontSize:  18);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    final wordPair = WordPair.random();
//    return Text(wordPair.asPascalCase);

  return Scaffold(
    appBar: AppBar(
      title: Text("Flutter app test"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.sort), onPressed: _pushedSaved)
      ],
    ),
    body: _buildSuggestions(),
    );
  }
  
  Widget _buildSuggestions(){
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        //Valeur prise par i à partir de 0
        print("****Value from i ==> $i");
        //Vérifie si i est impair
        if(i.isOdd){
          print("****I is odd ==> $i");
          //Si i impair alors afficher un séparateur
          return Divider();
        }
          // Obtenir le resultat de partie entière de la division de i
          // par 2
          final index = i ~/ 2;

          print("****Value from index ==> $index");
          print("****Suggestion lenght ==> ${_suggestion.length}");
          if(index >= _suggestion.length){
            _suggestion.addAll(generateWordPairs().take(10));
          }
          //Construction de la vue qui
          //affiche les text
        return _buildRow(_suggestion[index]);
      },
    );
  }

  //Retourne le widget (TextView) affichant les text
  Widget _buildRow(WordPair pair){
    bool _alreadySet = _saveWord.contains(pair);
    return ListTile(
      subtitle: Text("Hope is good"),
      title: Text(
        pair.asPascalCase,
        style: _biggestFont,
      ),
      trailing: Icon(
        _alreadySet ? Icons.favorite : Icons.favorite_border,
        color: _alreadySet ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if(_alreadySet)
            _saveWord.remove(pair);
          else
            _saveWord.add(pair);
        });
      },
    );
  }

  void _pushedSaved(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
          builder: (BuildContext build){
            final Iterable<ListTile> tiles = _saveWord.map(
                (WordPair pair) {
                  return ListTile(
                    title: Text(
                      pair.asPascalCase,
                      style: _biggestFont,
                    ),
                  );
                },
            ); //Iterable map

            final List<Widget> divided = ListTile
                .divideTiles(
            context: context,
            tiles: tiles,
            ).toList();

            return Scaffold(
              appBar: AppBar(
                title: Text('Saved Suggestions'),
              ),
              body: ListView(children: divided),
            );
          },
      ),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();
}
