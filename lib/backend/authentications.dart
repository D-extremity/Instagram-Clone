import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/src/widgets/editable_text.dart';
import 'package:instagram_clone/backend/file_storage.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_clone/models/user_model.dart' as model;

/// gave it name 'model' because to avoid confusion between 'user' methos of firebase and our class
/// model.user will point to the user who has logged in
/// though i didnt need it ! coz i gave it name 'UserAuthDetails'

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<model.UserAuthDetails> getUserDetails() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get();

    ///this snap is instance of object contains all the details of current user --> hence it is passed to model to get map of details of that user
    return model.UserAuthDetails.fromSnap(snap);
  }

  //function for signUp
  Future<String> signUp({
    required String email,
    required String username,
    required String password,
    required String bio,
    required Uint8List file,
  }) async {
    String result = "Some error occured ";
    try {
      if (email.trim().isNotEmpty ||
          username.trim().isNotEmpty ||
          password.trim().isNotEmpty ||
          bio.trim().isNotEmpty ||
          // ignore: unnecessary_null_comparison
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl =
            await StorageMethods().uploadImage('profilePicture', file, false);

        final userDetailMap = model.UserAuthDetails(
            email: email,
            username: username,
            password: password,
            bio: bio,
            photoUrl: photoUrl,
            uid: cred.user!.uid,
            followers: [],
            following: [],
            posts:[],).getDetails();

        await _store.collection('users').doc(cred.user!.uid).set(userDetailMap);

        result = "Success";
      }
    } catch (error) {
      result = error.toString();
    }
    return result;
  }

  //function for login
  Future<String> loginUser(
      {required String email, required String password}) async {
    String s = 'Email not belong to any user';
    try {
      if (email.trim().isEmpty || password.trim().isEmpty) {
        s = "Email or Password is empty";
        return s;
      }
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      s = 'Success';
      return s;
    } on FirebaseAuthException catch (err) {
      if (err.toString() == "wrong-password") {
        s = "wrong-password";
      }
      return s;
    } catch (error) {
      // print(error.toString());
      return s;
    }
  }
}
