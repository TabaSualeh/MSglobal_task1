import 'package:flutter/material.dart';
import 'package:module1_msglobal/main.dart';
import 'package:module1_msglobal/model/allposts.dart';
import 'package:module1_msglobal/widgets/posttile.dart';
import 'package:http/http.dart' as http;

import '../constants/colors.dart';
import '../controller/controller.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      getPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          PostsAll item = allPost[index];
          return PostTile(postData: item);
        }),
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 0.8,
            endIndent: 15,
            indent: 15,
            color: greyDivider,
          );
        },
        itemCount: allPost.length,
      ),
    );
  }

  Future<void> getPost() async {
    if (allPost.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
                child: CircularProgressIndicator(
              color: redPrimary,
            ));
          });
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );
      setState(() {
        allPost = postsAllFromJson(response.body);
      });
      Navigator.of(context).pop();
    } else {
      return;
    }
  }
}
