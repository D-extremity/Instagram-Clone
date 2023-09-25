import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PostsWidget extends StatelessWidget {
  const PostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 410,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              title: Text("username"),
              trailing: Icon(Icons.more_vert_rounded),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://freepngimg.com/download/anime/126073-images-cute-anime-boy-free-png-hq.png"),
              ),
            ),
            Flexible(
              // height: 250,
              // width: double.infinity,
              child: Image.network(
                  fit: BoxFit.contain,
                  height: 250,
                  width: double.infinity,
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5IppZVfAct_qg1auwSi8oo-oAxVa7oHV8ng&usqp=CAU"),
            ),
            const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Ionicons.heart_outline,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Ionicons.chatbox_ellipses_outline,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Ionicons.share_social,
                  size: 40,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Ionicons.bookmark_outline,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                RichText(
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  text: const TextSpan(
                    children: [
                      TextSpan(text: "234", style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                RichText(
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  text: const TextSpan(
                    children: [
                      TextSpan(text: "234", style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                RichText(
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  text: const TextSpan(
                    children: [
                      TextSpan(text: "234", style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      text: const TextSpan(
                        children: [
                          TextSpan(text: "234", style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                RichText(
                  text: const TextSpan(
                    text: "username ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    children: [
                      TextSpan(
                        text: "This is sample post and sample caption",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
