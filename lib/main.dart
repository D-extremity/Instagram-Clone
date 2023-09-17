import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/layout_widgets/login_screen.dart';
import 'package:instagram_clone/provider/state_management.dart';
import 'package:instagram_clone/responsive/responsive_layout.dart';
import 'package:instagram_clone/screens/mobile_layout.dart';
import 'package:instagram_clone/screens/web_layout.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBP2slc2srMeMybps1NVmfyEz8g4pPco3E",
          appId: "1:68666145980:web:c029da49e680f1f67e64b9",
          messagingSenderId: "68666145980",
          projectId: "68666145980",
          storageBucket: "instagram-9753e.appspot.com"),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>UserProvider(),),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Instagram',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: mobileBackgroundColor,
            splashColor: const Color.fromARGB(64, 220, 160, 180),
          ),
          // home: const ResponsiveLayout(
          //   mobileLayout: MobileLayout(),
          //   webLayout: WebLayout(),
          // ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return  const ResponsiveLayout(
                      mobileLayout: MobileLayout(), webLayout: WebLayout());
                } else if (snapshot.hasError) {
                  return const SafeArea(
                      child: Text("Some Internal Error Occurred"));
                }
                
              }
              else if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return const LoginScreen(); 
            },
            
          )),
    );
  }
}
