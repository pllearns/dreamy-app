import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dream_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Dreamy App"),
      ),
      body: Center(
        child: Column(children: <Widget>[
            Image.asset('assets/images/lucy_for_app.jpg'),
            SizedBox(height: 100.0),
            Text('Dream with your crush'),
            RaisedButton(
              child: Text('logout'),
              onPressed: _logout,
            ),
          ],
        ),
      ),
    );
  }
}