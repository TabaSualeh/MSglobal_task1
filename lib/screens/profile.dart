import 'package:flutter/material.dart';
import 'package:module1_msglobal/constants/colors.dart';
import 'package:module1_msglobal/main.dart';
import 'package:module1_msglobal/screens/login.dart';
import 'package:module1_msglobal/widgets/profiledata.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ProfileTile(title: "Name", value: "${loginUser!.name}"),
        Divider(color: greyDivider),
        ProfileTile(title: "Username", value: "${loginUser!.username}"),
        Divider(color: greyDivider),
        ProfileTile(
            title: "Address",
            value:
                "${loginUser!.address!.street}, ${loginUser!.address!.suite}, ${loginUser!.address!.city}"),
        Divider(color: greyDivider),
        ProfileTile(title: "Zipcode", value: "${loginUser!.address!.zipcode}"),
        Divider(color: greyDivider),
        ProfileTile(
          title: "LogOut",
          value: "",
          callback: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const Login()),
              ModalRoute.withName(''),
            );
          },
        ),
        Divider(color: greyDivider),
      ],
    ));
  }
}
