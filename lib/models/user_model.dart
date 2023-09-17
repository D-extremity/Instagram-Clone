// import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserAuthDetails {
  final String uid;
  final String photoUrl;
  final String email;
  final String username;
  final String password;
  final String bio;
  final List? posts;
  final List followers;
  final List following;

  UserAuthDetails(
      {required this.email,
      required this.username,
      required this.password,
      required this.bio,
      required this.posts,
      required this.photoUrl,
      required this.uid,
      required this.followers,
      required this.following});

  Map<String, dynamic> getDetails() {
    return {
      'username': username,
      'uid': uid,
      'email': email,
      'password': password,
      'bio': bio,
      'followers': [],
      'following': [],
      'photoUrl': photoUrl,
      'posts': [],
    };
  }

  static UserAuthDetails fromSnap(DocumentSnapshot snap) {
    /// snap contains details of that person
    /// snap.data() returned details in type of object
    var snapshot = snap.data() as Map<String, dynamic>;

    /// we are returning Authorized user details and it needs constructor values , that we returned from snapshot(map of details)
    return UserAuthDetails(
        username: snapshot['username'],
        uid: snapshot['uid'],
        email: snapshot['email'],
        password: snapshot['password'],
        bio: snapshot['bio'],
        followers: snapshot['followers'],
        following: snapshot['following'],
        photoUrl: snapshot['photoUrl'],
        posts: snapshot['posts']);
  }
}
