import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/posts.dart';

class HomeTimeline extends StatelessWidget {
  const HomeTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mobileBackgroundColor,
        foregroundColor: mobileBackgroundColor,
        title: SvgPicture.asset(
          "assets/ic_instagram.svg",
          color: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
                size: 35,
              ))
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: PostsWidget(),
      ),
    );
  }
}
