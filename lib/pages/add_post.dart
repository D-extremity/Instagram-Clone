import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/provider/state_management.dart';
// import 'package:flutter/widgets.dart';
// import 'package:instagram_clone/screens/mobile_layout.dart';
// import 'package:instagram_clone/pages/home_timeline.dart';
import 'package:instagram_clone/utils/get_image.dart';
import 'package:provider/provider.dart';

import 'upload_post_page.dart';
// import 'package:instagram_clone/screens/mobile_layout.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

TextEditingController getCaption = TextEditingController();

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    UserAuthDetails user = Provider.of<UserProvider>(context).getUser;
    Uint8List? _image;

    void setCameraImage() async {
      final imagee = await getImageCamera(ImageSource.camera);
      setState(() {
        _image = imagee;
        if (_image != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => UploadPostPage(
                user: user,
                image: _image!,
              ),
            ),
          );
        }
      });
    }

    void selectImage() async {
      Uint8List imagee = await getImageGallary(ImageSource.gallery);
      setState(() {
        _image = imagee;
        if (_image != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => UploadPostPage(
                user: user,
                image: _image!,
              ),
            ),
          );
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Picture"),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 50, left: 80, right: 80, top: 30),
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                child: Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Icon(
                      Icons.photo,
                      size: MediaQuery.of(context).size.height * 0.3,
                    )),
                onTap: () {
                  selectImage();
                  // print(_image);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Icon(
                    Icons.camera,
                    size: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),
                onTap: () {
                  setCameraImage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
