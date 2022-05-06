import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'showDialog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _resultString = 'result';

  void _setResultString(Object? result) =>
      _resultString = (result ?? 'null') as String;

  void _showDialog() async {
    var result = await showDialog(
      context: context,
      builder: (_) {
        return FittedBox(
          fit: BoxFit.none,
          child: ElevatedButton(
            child: const Text('close'),
            onPressed: () => Navigator.pop(context, 'close'),
          ),
        );
      },
    );
    setState(() => _setResultString(result));
  }

  void _showSimpleDialog() async {
    var result = await showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          title: const Text('タイトル'),
          children: <Widget>[
            SimpleDialogOption(
              child: const Text('Item 1'),
              onPressed: () => Navigator.pop(context, 'Item 1'),
            ),
            SimpleDialogOption(
              child: const Text('Item 2'),
              onPressed: () => Navigator.pop(context, 'Item 2'),
            ),
          ],
        );
      },
    );
    setState(() => _setResultString(result));
  }

  void _showAlertDialog() async {
    var result = await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('タイトル'),
          content: const Text('アラートの本文'),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context, 'OK'),
            ),
          ],
        );
      },
    );
    setState(() => _setResultString(result));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_resultString),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showDialog,
              child: const Text('showDialog'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showSimpleDialog,
              child: const Text('SimpleDialog'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showAlertDialog,
              child: const Text('AlertDialog'),
            ),
          ],
        ),
      ),
    );
  }
}
