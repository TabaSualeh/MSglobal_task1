import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:module1_msglobal/constants/colors.dart';
import 'package:module1_msglobal/controller/controller.dart';
import 'package:module1_msglobal/main.dart';
import 'package:module1_msglobal/model/detailLogin.dart';
import 'package:module1_msglobal/screens/homepage.dart';
import 'package:module1_msglobal/screens/login.dart';
import 'package:module1_msglobal/widgets/button.dart';
import 'package:module1_msglobal/widgets/textfield.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  bool shouldAutoValidateEmail = false;
  bool shouldAutoValidatePassword = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: screenheight * 0.14,
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "Lorem",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 34),
                          children: [
                            TextSpan(
                                text: "\nI P S U M",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(fontSize: 15))
                          ])),
                  //
                  const SizedBox(height: 12),
                  Form(
                    key: emailFormKey,
                    autovalidateMode: shouldAutoValidateEmail
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    child: ShowTextField(
                      textHint: 'Email',
                      controller: emailcontroller,
                      onFieldSubmitted: (p0) {
                        setState(() {
                          shouldAutoValidateEmail = true;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This field is required";
                        } else if (!value.contains('@')) {
                          return "Not a valid email address";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  //
                  //
                  Form(
                    key: passwordFormKey,
                    autovalidateMode: shouldAutoValidatePassword
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      child: ShowTextField(
                          textHint: 'Password',
                          moveToNextTextField: TextInputAction.done,
                          hiddenData: true,
                          controller: passwordcontroller,
                          onFieldSubmitted: (p0) {
                            setState(() {
                              shouldAutoValidatePassword = true;
                            });
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "This field is required";
                            } else {
                              return null;
                            }
                          }),
                    ),
                  ),
                  CustomButton(
                    width: double.infinity,
                    btnName: "LOGIN",
                    callback: () {
                      bool test1 = emailFormKey.currentState!.validate();
                      bool test2 = passwordFormKey.currentState!.validate();
                      if (test1 && test2) {
                        login(emailcontroller.text, passwordcontroller.text);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login(String email, password) async {
    Controller toastController = Controller();
    List<DetailLogin> loginDetails;
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: CircularProgressIndicator(
            color: redIconwithButton,
          ));
        });

    http.Response response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
    );
    loginDetails = detailLoginFromJson(response.body);
    Navigator.of(context).pop();
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        for (var i = 0; i < loginDetails.length; i++) {
          if (loginDetails[i].email == email &&
              loginDetails[i].username == password) {
            loginUser = loginDetails[i];
            toastController.showToast("User Login Successfully");

            totheHomePage();
            break;
          } else {
            toastController.showToast("Invalid Email and Password");
          }
        }
      });
    } else {
      toastController.showToast("Please check your internet connection");
    }
  }

  void totheHomePage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
      ModalRoute.withName(''),
    );
  }
}
