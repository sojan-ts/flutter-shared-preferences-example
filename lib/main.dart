import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share4d Preference Example'),
      ),
      body: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextButton(
              child: Text('Read'),
              onPressed: () {
                _read();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: Text('Save'),
              onPressed: () {
                _save();
              },
            ),
          ),
        ],
      ),
    );
  }

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_test_key';
    final value = prefs.getInt(key) ?? 0;
    print('read: $value');
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_test_key';
    final value = 42;
    prefs.setInt(key, value);
    print('saved $value');
  }
}
