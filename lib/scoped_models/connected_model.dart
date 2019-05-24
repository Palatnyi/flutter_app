import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';

mixin ConnectedModel on Model {
    User authenticatedUser;
}