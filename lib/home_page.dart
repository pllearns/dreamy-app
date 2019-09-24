import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dream_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _visible = false;

  @override 
  void initState() {
    super.initState();

    setState(() {
      _visible = true;
    });
  }

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
            AnimatedOpacity(
              child: Image.asset('assets/images/lucy_for_app.jpg'),
              opacity: !_visible ? 0.0 : 1.0,
              duration: Duration(milliseconds: 3000),
            ), 
            SizedBox(height: 100.0),
            Text('Dream with your crush'),
            RaisedButton(
              child: Text('Find Your Dream'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DreamPage()),
                );
              },
            ),
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