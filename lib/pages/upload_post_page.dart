import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:instagram_clone/backend/file_storage.dart';
import 'package:instagram_clone/backend/firestore_methods.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/pages/add_post.dart';
import 'package:instagram_clone/provider/state_management.dart';
import 'package:instagram_clone/screens/mobile_layout.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/show_snackbar.dart';
import 'package:provider/provider.dart';

class UploadPostPage extends StatefulWidget {
  final Uint8List image;
  UploadPostPage({
    super.key,
    required this.user,
    required this.image,
  });

  final UserAuthDetails user;

  @override
  State<UploadPostPage> createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {
  // Future<String> post(Uint8List image) async {
  TextEditingController getCaption = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    getCaption.dispose();
  }

  void postImage(
      String uid, String username, String profileImage, Uint8List file) async {
    String res;
    try {
      res = await FireStoreMethods()
          .uploadPost(getCaption.text, file, uid, profileImage, username);
      if (res == "success") {
        showSnackbar("Posted", context);
      } else {
        showSnackbar("Error Occurred", context);
      }
    } catch (error) {
      res = error.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    UserAuthDetails _user = Provider.of<UserProvider>(context).getUser;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MobileLayout()));
            },
          ),
          title: const Text("Post"),
          actions: [
            GestureDetector(
              onTap: () async {
                // String s = await post(image);
                // String url = await StorageMethods().uploadImage(
                //     widget.user.username.toString(), widget.image, true);

                // print(url);

                postImage(
                    _user.uid, _user.username, _user.photoUrl, widget.image);
              },
              child: const Icon(
                Icons.file_upload,
                color: Colors.blue,
                size: 30,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              style: ListTileStyle.drawer,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.user.photoUrl),
              ),
              trailing: Image.memory(widget.image),
              subtitle: SizedBox(
                width: MediaQuery.of(context).size.width * 4.3,
                child: TextField(
                  controller: getCaption,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write Caption...",
                  ),
                  maxLength: 100,
                  maxLines: 8,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
