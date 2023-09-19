import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/backend/file_storage.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final postId = const Uuid().v1();
  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String profileImage,
    String username,
  ) async {
    String res = "Some Error Occurred";
    try {
      ///below line has uploaded our file to firebase storage
      String postUrl = await StorageMethods().uploadImage('posts', file, true);
      Post post = Post(
        profileImage: profileImage,
        username: username,
        description: description,
        dateTime: DateTime.now(),
        likes: [],
        photoUrl: postUrl,
        uid: uid,
        postId: postId,
      );

      ///now uploading to firestore
      _firestore.collection('posts').doc(postId).set(post.getDetailsInMap());
      res = "success";
      return res;
    } catch (e) {
      String res = e.toString();
      return res;
    }
  }
}
