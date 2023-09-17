// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/add_post.dart';
import 'package:instagram_clone/pages/home_timeline.dart';
import 'package:instagram_clone/utils/colors.dart';
// import 'package:instagram_clone/models/user_model.dart';
// import 'package:instagram_clone/provider/state_management.dart';
// import 'package:provider/provider.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int _currentPage = 0;

  ///But this is very bad practice as we will have to copy paste the code to get data for website view

  // String username = '';

  // @override
  // void initState() {
  //   super.initState();
  //   getUsername();
  // }

  // void getUsername() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   String userDetails = ((snap.data() as Map<String, dynamic>)['username']);
  //   setState(() {
  //     username = userDetails;
  //   });
  //   // print(snap.data());
  // }
  List<Widget> pages = [
    HomeTimeline(),
    Text("search"),
    AddPost(),
    Text("notifications"),
    Text("profile"),
  ];

  @override
  Widget build(BuildContext context) {
    // UserAuthDetails user =  Provider.of<UserProvider>(context).getUser;
    return SafeArea(
        child: Scaffold(
      body: IndexedStack(index: _currentPage, children: pages),
      bottomNavigationBar: BottomNavigationBar(
       
        currentIndex: _currentPage,
        onTap: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: _currentPage == 0
                    ? const Color.fromARGB(255, 227, 177, 194)
                    : Colors.white,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: _currentPage == 1
                    ? const Color.fromARGB(255, 227, 177, 194)
                    : Colors.white,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_a_photo,
                color: _currentPage == 2
                    ? const Color.fromARGB(255, 227, 177, 194)
                    : Colors.white,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: _currentPage == 3
                    ? const Color.fromARGB(255, 227, 177, 194)
                    : Colors.white,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_rounded,
                color: _currentPage == 4
                    ? const Color.fromARGB(255, 227, 177, 194)
                    : Colors.white,
                size: 30,
              ),
              label: ""),
        ],
      ),
    ));
  }
}
