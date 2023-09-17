import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/layout_widgets/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/backend/authentications.dart';
import 'package:instagram_clone/utils/show_snackbar.dart';

// import 'package:instagram_clone/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _getMail = TextEditingController();
  final TextEditingController _getPass = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _getMail.dispose();
    _getPass.dispose();
  }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          // color: primaryColor,
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      minimumSize:
                          MaterialStatePropertyAll(Size.fromHeight(45)),
                    ),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      String s = await Authentication().loginUser(
                          email: _getMail.text, password: _getPass.text);
                          setState(() {
                          _isLoading=false;
                          });
                      showSnackbar(s, context);
                    },
                    child:  SizedBox(
                      child: _isLoading?const  CircularProgressIndicator() : const Text(
                        "Log in",
                        style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.blue,
                            fontSize: 25),
                      ),
                    )),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have An Account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                    },
                    child: const Text(
                      "SignUp",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
