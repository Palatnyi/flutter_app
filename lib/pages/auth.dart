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
  final _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
      fit: BoxFit.cover,
      image: AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'Email', filled: true, fillColor: Colors.white),
        onSaved: (String value) {
          email = value;
        },
        validator: (String value) {
          if (!RegExp(
                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'not valid email address';
          }
        });
  }

  Widget _buildPasswordTetField() {
    return TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'password', filled: true, fillColor: Colors.white),
        onSaved: (String value) {
          password = value;
        },
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return 'Pasword must be more then 5 characters';
          }
        });
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
        value: _value,
        title: Text('Accept terms'),
        onChanged: (bool value) {
          setState(() {
            _value = value;
          });
        });
  }

  void onPressed() {
    print('on pressed');
    //if (_formKey.currentState.validate() && _value) {
      //_formKey.currentState.save();
      Navigator.pushReplacementNamed(context, '/products');
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Container(
          child: Align(
            child: Text('Login'),
            // alignment: Alignment.centerLeft,
          ),
        )),
        body: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
              image: _buildBackgroundImage(),
            ),
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(height: 4.5),
                  _buildPasswordTetField(),
                  _buildAcceptSwitch(),
                  Center(
                    child: RaisedButton(
                      child: Text('login'),
                      onPressed: onPressed,
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}
