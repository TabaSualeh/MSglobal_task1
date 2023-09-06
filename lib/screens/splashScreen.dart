import 'dart:async';

import 'package:flutter/material.dart';
import 'package:module1_msglobal/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const Login()),
        ModalRoute.withName(''),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                height: screenheight * 0.23,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Lorem",
                      style: Theme.of(context).textTheme.displayLarge,
                      children: [
                        TextSpan(
                            text: "\nI P S U M",
                            style: Theme.of(context).textTheme.displaySmall)
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
