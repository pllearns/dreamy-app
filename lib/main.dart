import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dreamy_app/auth_service.dart';
import 'home_page.dart';

void main() => runApp(
  ChangeNotifierProvider<AuthService>(
    child: MyApp(),
    builder: (BuildContext context) {
      return AuthService();
    }
  )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dreamy App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: Provider.of<AuthService>(context).getUser(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.hasData ? HomePage() : LoginPage();
          } else {
            return Container(color: Colors.white);
          }
        },
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  void _login() {
    setState(() {
      final form = _formKey.currentState;
      form.save();

      print(form);

      if (form.validate()) {
        FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        padding: EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Text('Dreamy App Login')
                ],
              ),
              SizedBox(height: 120.0),
                TextFormField(
                  onSaved: (value) => _email = value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'email'
                    ),
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  onSaved: (value) => _password = value,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'password'
                ),
              ),
                ButtonBar(children: <Widget>[
                  RaisedButton(
                    child: Text('next'),
                    onPressed: _login,
                  ),
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
