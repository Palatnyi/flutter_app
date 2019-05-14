import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String email;
  String password;
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    Function onPressed =
        () => Navigator.pushReplacementNamed(context, '/products');
    if (email == 'a@a.com' && password == '123') {
      onPressed = () => Navigator.pushReplacementNamed(context, '/products');
    }
    return Scaffold(
        appBar: AppBar(
            title: Container(
          child: Align(
            child: Text('Login'),
            // alignment: Alignment.centerLeft,
          ),
        )),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              fit: BoxFit.cover,
              image: AssetImage('assets/background.jpg'),
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white
                    ),
                    onChanged: (String value) {
                      setState(() {
                        email = value;
                      });
                    }),
                SizedBox(height: 4.5),
                TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'password',
                      filled: true,
                      fillColor: Colors.white
                    ),
                    onChanged: (String value) {
                      setState(() {
                        password = value;
                      });
                    }),
                SwitchListTile(
                    value: _value,
                    title: Text('Accept terms'),
                    onChanged: (bool value) {
                      setState(() {
                        _value = value;
                      });
                    }),
                Center(
                  child: RaisedButton(
                    child: Text('login'),
                    onPressed: onPressed,
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
