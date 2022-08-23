import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  String _text = '';

  _salvar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nome', _controller.text);
  }

  _carregar() {}

  _remover() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferências de usuário'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(_text),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _controller,
                keyboardType: TextInputType.text,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: _salvar, child: Text('Salvar')),
                ElevatedButton(onPressed: _carregar, child: Text('Carregar')),
                ElevatedButton(onPressed: _remover, child: Text('Remover')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
