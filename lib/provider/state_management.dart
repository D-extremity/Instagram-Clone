// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_clone/backend/authentications.dart';
import 'package:instagram_clone/models/user_model.dart';


/// Logged in user data will be available all over the app
class UserProvider extends ChangeNotifier {
  UserAuthDetails? _user;

  final Authentication _authentication = Authentication();

  UserAuthDetails get getUser => _user!;

  Future<void> refreshUser() async {
    //it will check that data of our global variable has been changed therefore update your value
    UserAuthDetails user = await _authentication.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
