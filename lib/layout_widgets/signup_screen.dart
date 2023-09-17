import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/backend/authentications.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/get_image.dart';
// import 'package:instagram_clone/utils/temp_signup_image.dart';
// import 'package:instagram_clone/widgets/text_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _getMail = TextEditingController();
  final TextEditingController _getPass = TextEditingController();
  final TextEditingController _getUserName = TextEditingController();
  final TextEditingController _getBio = TextEditingController();
  Uint8List? _img;
  @override
  void dispose() {
    super.dispose();
    _getMail.dispose();
    _getPass.dispose();
    _getUserName.dispose();
    _getBio.dispose();
  }

  bool _isLoading = false;
  void selectImage() async {
    Uint8List imagee = await getImageGallary(ImageSource.gallery);
    setState(() {
      _img = imagee;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          // color: primaryColor,
          child: Flexible(
            fit: FlexFit.loose,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SvgPicture.asset(
                  'assets/ic_instagram.svg',
                  // ignore: deprecated_member_use
                  color: primaryColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                Stack(children: [
                  _img != null
                      ? CircleAvatar(
                          backgroundImage: MemoryImage(_img!),
                          radius: 80,
                        )
                      : const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/profilePicture.jpg'),
                          radius: 80,
                        ),
                  Positioned(
                    bottom: 10,
                    right: 6,
                    child: GestureDetector(
                      onTap: () {
                        selectImage();
                      },
                      child: const Icon(
                        Icons.add_a_photo,
                        color: Color.fromARGB(255, 50, 51, 52),
                        size: 40,
                      ),
                    ),
                  )
                ]),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                Expanded(
                  flex: 4,
                  child: ListView(
                    children: [
                      TextField(
                        controller: _getUserName,
                        decoration: InputDecoration(
                          hintText: "Enter User Name",
                          border: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          filled: true,
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      TextField(
                        controller: _getMail,
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          border: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          filled: true,
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      TextField(
                        controller: _getPass,
                        decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          border: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          filled: true,
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      TextField(
                        controller: _getBio,
                        decoration: InputDecoration(
                          hintText: "Bio",
                          border: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          filled: true,
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blue),
                              minimumSize:
                                  MaterialStatePropertyAll(Size.fromHeight(45)),
                            ),
                            onPressed: () async {
                              if (_getMail.text.isEmpty ||
                                  _getUserName.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Fields are empty")));

                                return;
                              }
                              if (_getPass.text.trim().length < 7) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Passowrd cannot be less than 7 characters")));
                                return;
                              }
                               if (_img==null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Provide Image (PFP)")));
                                return;
                              }
                              setState(() {
                                _isLoading = true;
                              });
                              String s = await Authentication().signUp(
                                email: _getMail.text,
                                username: _getUserName.text,
                                password: _getPass.text,
                                bio: _getBio.text,
                                file: _img!,
                              );
                              setState(() {
                                _isLoading = false;
                              });
                              if (s == "Success") {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text(s)));
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Account already present")));
                              }
                            },
                            child:  SizedBox(
                              child: _isLoading ? const CircularProgressIndicator():const Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.blue,
                                    fontSize: 25),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
