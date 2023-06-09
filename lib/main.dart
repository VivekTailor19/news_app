import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:news_app/provider/newsprovider.dart';
import 'package:news_app/screens/firstScreen.dart';
import 'package:news_app/screens/home_tab/homeScreen.dart';
import 'package:news_app/screens/news_details.dart';
import 'package:news_app/screens/starting_screens/introScreen.dart';
import 'package:news_app/screens/starting_screens/intro_country.dart';

import 'package:news_app/screens/starting_screens/splashScreen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


void main() {
  runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) =>

        Sizer(
          builder: (context, orientation, deviceType) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create:  (context) => NewsProvider(),),
            ],
            child: MaterialApp(
              theme: ThemeData(fontFamily: "Popping"),
              debugShowCheckedModeBanner: false,
              //initialRoute: "intro2",
              routes: {
                "/": (context) => SplashScreen(),
                "intro":(context) => Intro_Screen(),
                "intro2":(context) => Intro_Country(),
                "first":(context) => First_Screen(),
                "home": (context) => HomeScreen(),
                "read":(context) => NewsReader(),
              },
            ),
          ),
        ),
      // ),
  );
}



//business
// entertainment
// general
// health
// science
// sports
// technology