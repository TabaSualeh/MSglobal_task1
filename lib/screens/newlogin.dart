// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:module1_msglobal/widgets/button.dart';
// import 'package:module1_msglobal/widgets/textfield.dart';

// import '../constants/colors.dart';

// class Loginpage extends StatefulWidget {
//   const Loginpage({super.key});

//   @override
//   State<Loginpage> createState() => _LoginpageState();
// }

// class _LoginpageState extends State<Loginpage> {
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();
//   final _emailFormKey = GlobalKey<FormState>();
//   final _passwordFormKey = GlobalKey<FormState>();
//   bool shouldAutoValidateEmail = false;
//   bool shouldAutoValidatePassword = false;
//   @override
//   Widget build(BuildContext context) {
//     double screenheight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             //
//             Image.asset(
//               "assets/logo.png",
//               height: screenheight * 0.14,
//             ),
//             RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                     text: "Lorem",
//                     style: Theme.of(context)
//                         .textTheme
//                         .displayLarge!
//                         .copyWith(fontSize: 34),
//                     children: [
//                       TextSpan(
//                           text: "\nI P S U M",
//                           style: Theme.of(context)
//                               .textTheme
//                               .displaySmall!
//                               .copyWith(fontSize: 15))
//                     ])),
//             //
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 children: [
//                   Form(
//                     key: _emailFormKey,
//                     autovalidateMode: shouldAutoValidateEmail
//                         ? AutovalidateMode.onUserInteraction
//                         : AutovalidateMode.disabled,
//                     child: ShowTextField(
//                       textHint: 'Email',
//                       controller: emailcontroller,
//                       onFieldSubmitted: (p0) {
//                         setState(() {
//                           shouldAutoValidateEmail = true;
//                         });
//                       },
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return "This field is required";
//                         } else if (!value.contains('@gmail.com')) {
//                           return "Not a valid email address. Should be your@email.com";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                   ),
//                   Form(
//                     key: _passwordFormKey,
//                     autovalidateMode: shouldAutoValidatePassword
//                         ? AutovalidateMode.onUserInteraction
//                         : AutovalidateMode.disabled,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 8, bottom: 16),
//                       child: ShowTextField(
//                           textHint: 'Password',
//                           moveToNextTextField: TextInputAction.done,
//                           hiddenData: true,
//                           controller: passwordcontroller,
//                           onFieldSubmitted: (p0) {
//                             setState(() {
//                               shouldAutoValidatePassword = true;
//                             });
//                           },
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return "This field is required";
//                             } else if (value.length < 6) {
//                               return "Password must requires a minimum of 6 characters";
//                             } else {
//                               return null;
//                             }
//                           }),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15, bottom: 26),
//                     child: InkWell(
//                       onTap: () {},
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             "Forgot your password?",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodySmall!
//                                 .copyWith(color: white6),
//                           ),
//                           Icon(
//                             size: 24,
//                             Icons.arrow_forward_rounded,
//                             color: redIconwithButton,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   CustomButton(
//                     btnName: "LOGIN",
//                     callback: () {
//                       bool test1 = _emailFormKey.currentState!.validate();
//                       bool test2 = _passwordFormKey.currentState!.validate();
//                       print("${test1} ${test2} ");
//                       if (test1 && test2) {}
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 80, bottom: 12),
//               child: Center(
//                 child: Text("Or login with social account",
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodySmall!
//                         .copyWith(color: white6)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void login(String email, password) async {
//     UserData? userdata;
//     showDialog(
//         context: context,
//         builder: (context) {
//           return Center(
//               child: CircularProgressIndicator(
//             color: redIconwithButton,
//           ));
//         });

//     http.Response response = await http.put(
//         Uri.parse("https://ecommerce.salmanbediya.com/users/login"),
//         body: {'email': email, 'password': password});
//     Navigator.of(context).pop();
//     var data = jsonDecode(response.body);
//     userdata = userDataFromJson(response.body);
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       _showToast(data['message']);
//       setState(() {
//         if (userdata != null) {
//           userName = userdata.data!.name!;
//           useremail = userdata.data!.useremail!;
//           userId = userdata.data!.id!;
//           toVisualSearch(context);
//         }
//       });
//     } else {
//       print("${emailcontroller.text} ${passwordcontroller.text}");
//       _showToast(data['error']);
//     }
//   }

//   void toForgotPassword(BuildContext context) {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
//   }

//   void toVisualSearch(BuildContext context) {
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//           builder: (BuildContext context) => const VisualSearch()),
//       ModalRoute.withName(''),
//     );
//   }

//   _showToast(String msg) {
//     return Fluttertoast.showToast(
//         msg: msg,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: greyScaffoldbf.withOpacity(0.8),
//         textColor: whiteonly,
//         fontSize: 16.0);
//   }
// }
