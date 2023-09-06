import 'package:flutter/material.dart';
import 'package:module1_msglobal/constants/colors.dart';
import 'package:module1_msglobal/controller/controller.dart';
import 'package:module1_msglobal/main.dart';
import 'package:module1_msglobal/model/allposts.dart';
import 'package:module1_msglobal/screens/posts.dart';
import 'package:module1_msglobal/screens/profile.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () {
    //   getPost();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lorem Ipsum"),
          bottom: const TabBar(tabs: [
            Tab(text: "ALL POSTS"),
            Tab(text: "PROFILE"),
          ]),
        ),
        body: const TabBarView(children: [Posts(), Profile()]),
      ),
    );
  }

  // Future<void> getPost() async {
  //   Controller toastController = Controller();

  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const Center(
  //             child: CircularProgressIndicator(
  //                 // color: redPrimary,
  //                 ));
  //       });

  //   http.Response response = await http.get(
  //     Uri.parse("https://jsonplaceholder.typicode.com/users"),
  //   );
  //   allPost = postsAllFromJson(response.body);
  //   Navigator.of(context).pop();
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     setState(() {});
  //   } else {
  //     toastController.showToast("Please check your internet connection");
  //   }
  // }
}
