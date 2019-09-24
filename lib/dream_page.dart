import 'package:flutter/material.dart';
import 'home_page.dart';

class DreamPage extends StatefulWidget {
  @override
  _DreamPageState createState() => _DreamPageState();
}

class _DreamPageState extends State<DreamPage> {

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Who do you want to dream with?'),
        leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () { 
              Navigator.pop(context);
            },
          ),
        ),
      body: Center(
        child: ListView(children: <Widget>[
            Image.asset('assets/images/lucy_for_app.jpg'),
            Image.asset('assets/images/chris_for_app.jpeg'),
            Image.asset('assets/images/jessica_for_app.jpg'),
            Image.asset('assets/images/brad_for_app.jpg'),
          ],
        ),
      ),
    );
  }
}