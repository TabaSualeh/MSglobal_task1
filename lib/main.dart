import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module1_msglobal/constants/colors.dart';
import 'package:module1_msglobal/model/allposts.dart';
import 'package:module1_msglobal/model/detailLogin.dart';
import 'package:module1_msglobal/screens/homepage.dart';
import 'package:module1_msglobal/screens/login.dart';
import 'package:module1_msglobal/screens/posts.dart';
import 'package:module1_msglobal/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

DetailLogin? loginUser;
List<PostsAll> allPost = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prayer Time',
      theme: ThemeData(
        primaryColor: redPrimary,

        colorScheme: ColorScheme.fromSeed(
            seedColor: redPrimary,
            primary: redPrimary,
            secondary: redSecondary),
        useMaterial3: true,
        //Floating Action Button Theme
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: redPrimary,
            shape: CircleBorder(),
            foregroundColor: white6),

        // Text Theme
        textTheme: TextTheme(
            displayLarge: GoogleFonts.metrophobic(
                color: greyHeadText, fontSize: 48, fontWeight: FontWeight.w900),
            displaySmall: GoogleFonts.metrophobic(
                color: greyHeadText, fontSize: 20, fontWeight: FontWeight.w100),
            bodyMedium: GoogleFonts.metrophobic(
                color: white6, fontSize: 16, fontWeight: FontWeight.w500),
            bodyLarge: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
            bodySmall: GoogleFonts.metrophobic(
              color: Colors.black87,
              fontSize: 16,
            )),
        buttonColor: redPrimary,
        // TabBarTheme
        tabBarTheme: TabBarTheme(
          labelColor: white6,
          labelStyle: GoogleFonts.metrophobic(
              color: white6, fontSize: 16, fontWeight: FontWeight.w700),
          unselectedLabelColor: white5.withOpacity(0.6),
          unselectedLabelStyle: GoogleFonts.metrophobic(
              color: white6, fontSize: 16, fontWeight: FontWeight.w500),
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: white6, width: 1.9)),
        ),
        // App Bar Theme
        appBarTheme: AppBarTheme(
            shadowColor: Colors.grey[900],
            elevation: 4,
            scrolledUnderElevation: 5,
            color: redPrimary,
            titleTextStyle: GoogleFonts.metrophobic(
                fontSize: 20, fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: white6, size: 10),
        // Input Decoration Theme
        inputDecorationTheme: InputDecorationTheme(
            suffixIconColor: greyHintText,
            fillColor: whiteTextField,
            filled: true,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            labelStyle:
                GoogleFonts.metrophobic(fontSize: 13, color: greyLabelText),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: white6, width: 0.5)),
            enabledBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: white6.withOpacity(0.50))),
            errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: errorColor)),
            focusedErrorBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: errorColor,
                ))),
        //
      ),
      home: const SplashScreen(),
    );
  }
}
