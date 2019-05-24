import './connected_model.dart';
import '../models/user.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = new Uuid();
mixin UserModel on ConnectedModel {
  login({email, password}) {
    authenticatedUser = User(id: uuid.v1(), email: email, password: password);
  }
}
