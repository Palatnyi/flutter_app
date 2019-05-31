import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main_model.dart';

enum FormStateEnum { login, signup }

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String email;
  String password;
  var _formState = FormStateEnum.login;
  bool _value = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();

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
        controller: _passwordController,
        decoration: InputDecoration(
            labelText: 'password', filled: true, fillColor: Colors.white),
        onSaved: (String value) {
          password = value;
        },
        validator: (String value) {
          if (value.isEmpty || value.length < 6) {
            return 'Pasword must be more then 6 characters';
          }
        });
  }

  Widget _buildPasswordConfirmTetField() {
    if (_formState == FormStateEnum.signup) {
      return TextFormField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'confirm password',
              filled: true,
              fillColor: Colors.white),
          validator: (String value) {
            if (_passwordController.text != value) {
              return 'Pasword must be more then 6 characters. Passwords must be equal';
            }
          });
    }
    return Container();
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

  void _onPressed(MainModel model, BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_formState == FormStateEnum.signup) {
        bool isSucceded = await model.signUp(email, password);
        if (isSucceded) {
          Navigator.pushReplacementNamed(context, '/products');
        } else {
          _showErrorAlertDialog(context);
        }
        print('signup');
      } else {
        model.login(email, password);
        print('login');
      }
      // login(email: email, password: password);
    }
  }

  void _showErrorAlertDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Error"),
            content: new Text("Something weird has happened"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget _buildLoginButton(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Center(
        child: RaisedButton(
          child: _formState == FormStateEnum.signup
              ? Text('Sign Up')
              : Text('Log In'),
          onPressed: () => _onPressed(model, context),
        ),
      );
    });
  }

  Widget _buildSwitchFormButton() {
    return FlatButton(
        child: _formState == FormStateEnum.signup
            ? Text('Go to Log In form')
            : Text('Go to Sign Up form'),
        onPressed: () {
          if (_formState == FormStateEnum.signup) {
            setState(() {
              _formState = FormStateEnum.login;
            });
          } else {
            setState(() {
              _formState = FormStateEnum.signup;
            });
          }
        });
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
                  SizedBox(height: 4.5),
                  _buildPasswordConfirmTetField(),
                  _buildAcceptSwitch(),
                  _buildLoginButton(context),
                  _buildSwitchFormButton()
                ]),
              ),
            ),
          ),
        ));
  }
}
