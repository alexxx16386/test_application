import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  List<Color> _colors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.pink,
    Colors.cyan,
    Colors.purple,
    Colors.indigo,
    Colors.lime,
    Colors.teal,
  ];

  void changeBackgrounColor() {
    setState(() {
      _index = Random().nextInt(_colors.length);
    });
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      key: _drawerKey,
      backgroundColor: _colors[_index],
      body: Stack(
        children: [
          FlatButton(
            onPressed: changeBackgrounColor,
            child: Container(
              child: Align(
                child: Card(
                  margin: EdgeInsets.all(16),
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Hey there 👋🏻',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                foregroundColor: theme.accentColor,
                child: Icon(Icons.menu),
                onPressed: () => _drawerKey.currentState.openDrawer(),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'My Contacts',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/telegram.png',
                scale: 0.55,
              ),
              title: Text('My Telegram'),
              subtitle: Text('evgenii_alexiuk'),
            ),
            ListTile(
              leading: Image.asset(
                'assets/instagram.png',
                scale: 0.55,
              ),
              title: Text('My Instagram'),
              subtitle: Text('evgenii_alexiuk'),
            ),
            ListTile(
              leading: Image.asset(
                'assets/phone.png',
                scale: 0.55,
              ),
              title: Text('My Number'),
              subtitle: Text('+380989696197'),
            ),
          ],
        ),
      ),
    );
  }
}
