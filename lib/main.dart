import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Produtos',
      home: ProdutosLista(),
    );
  }
}

class ProdutosListaState extends State<ProdutosLista> {
  final _suggestions = <String>["Cerveja", "Cachaça", "Vinho", "Vodka",
    "Vinho Branco", "Champanhe", "Tequila", "Whisky", "Conhaque", "Gim", "Rum",
  ];
  final Set<String> _saved = Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      body: buildSuggestions(),
    );
  }
  Widget buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            return null;
            // _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }
  Widget _buildRow(String palavra) {
    final bool alreadySaved = _saved.contains(palavra);
    return ListTile(
        title: Text(palavra, style: _biggerFont),
        trailing: Icon(
          alreadySaved ? Icons.check_box : Icons.check_box_outline_blank,
          color: alreadySaved ? Colors.green : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(palavra);
            } else {
              _saved.add(palavra);
            }
          });
        });
  }
}
class ProdutosLista extends StatefulWidget {
  @override
  ProdutosListaState createState() => ProdutosListaState();
}