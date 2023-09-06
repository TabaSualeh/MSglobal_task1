import 'package:flutter/material.dart';
import 'package:module1_msglobal/constants/colors.dart';
import 'package:module1_msglobal/main.dart';
import 'package:module1_msglobal/model/allposts.dart';

class PostTile extends StatelessWidget {
  PostsAll postData;
  PostTile({required this.postData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 7),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          postData.title!,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: postData.userId == loginUser!.id
                  ? redPrimary
                  : Colors.black87,
              fontWeight: postData.userId == loginUser!.id
                  ? FontWeight.bold
                  : FontWeight.w300,
              fontSize: 18),
        ),
        const SizedBox(height: 6),
        Text(
          postData.body!,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.black87.withOpacity(0.6), fontSize: 12),
        ),
      ]),
    );
  }
}
