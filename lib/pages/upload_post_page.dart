import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:instagram_clone/backend/file_storage.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/pages/add_post.dart';
import 'package:instagram_clone/screens/mobile_layout.dart';
import 'package:instagram_clone/utils/colors.dart';

class UploadPostPage extends StatelessWidget {
  final Uint8List image;
  const UploadPostPage({
    super.key,
    required this.user,
    required this.image,
  });

  // Future<String> post(Uint8List image) async {
  //   String url = await StorageMethods().uploadImage(user.username, image, true);
  //   return url;
  // }

  final UserAuthDetails user;

  @override
  Widget build(BuildContext context) {
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
                String url = await StorageMethods()
                    .uploadImage(user.username.toString(), image, true);

                print(url);
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
                backgroundImage: NetworkImage(user.photoUrl),
              ),
              trailing: Image.memory(image),
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
