import 'package:http/http.dart' as http;
import 'dart:convert';
import './connected_model.dart';
import '../models/user.dart';

mixin UserModel on ConnectedModel {

  Future<dynamic> signUp(String email, String password) async {
    Map<String, dynamic> signUpInfo = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    http.Response resp = await http.post('https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyD9oH-z4eEshhK8SRjRyNepnl8uMJACMCk', body: json.encode(signUpInfo));
    Map<String, dynamic> respData = json.decode(resp.body);
    if(json.decode(resp.body).containsKey('idToken')){

      authenticatedUser = User(id: respData['localId'], email: email, password: password, idToken: json.decode(resp.body)['idToken']);
      return Future.value(true);
    }
    return Future.value(false);
  }

  login(email, password) {

  }
}
