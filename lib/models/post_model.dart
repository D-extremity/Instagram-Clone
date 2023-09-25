// import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String uid;
  final String photoUrl;
  final String description;
  final String username;
  final DateTime dateTime;
  final String profileImage;
  final likes;
  final String postId;
  // final List followers;
  // final List following;

  Post({
    required this.profileImage,
    required this.username,
    required this.description,
    required this.dateTime,
    required this.likes,
    required this.photoUrl,
    required this.uid,
    required this.postId,
  });

  Map<String, dynamic> getDetailsInMap() {
    return {
      'username': username,
      'uid': uid,
      'likes': likes,
      'profileImage': profileImage,
      'dateTime': dateTime,
      'photoUrl': photoUrl,
      'description': description,
      'postId': postId,
    };
  }

//fetching data from firestore
  static Post fromSnap(DocumentSnapshot snap) {
    /// snap contains details of that person
    /// snap.data() returned details in type of object
    var snapshot = snap.data() as Map<String, dynamic>;

    /// we are returning Authorized user details and it needs constructor values , that we returned from snapshot(map of details)
    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      photoUrl: snapshot['photoUrl'],
      dateTime: snapshot['dateTime'],
      likes: snapshot['likes'],
      profileImage: snapshot['profileImage'],
      postId: snapshot['postId'],
    );
  }
}
