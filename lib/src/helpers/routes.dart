import 'package:flutter/material.dart';
import 'package:uuu/src/pages/category/categoryPage.dart';
import 'package:uuu/src/pages/homePage/homePage.dart';
import 'package:uuu/src/pages/login/loginPage.dart';
import 'package:uuu/src/pages/newsApp.dart';
import 'package:uuu/src/pages/newsDetail/newsDetailPage.dart';
import 'package:uuu/src/pages/profile/profilePage.dart';
import 'package:uuu/src/pages/signup/signupPage.dart';
import 'package:uuu/src/pages/splash/splashPage.dart';

class Routes{
  static Map<String,WidgetBuilder> getRoute(){
    return  <String, WidgetBuilder>{
          '/': (_) => SplashScreen(),
          '/login': (_) => LoginPage(),
          '/signup': (_) => SignupPage(),
          '/home': (_) => NewsApp(),
          '/detail': (_) => const NewsDetailPage(),
          '/category': (_) => CategoryPage(controller: null,),
          '/profile': (_) => const ProfilePage(),
        };
  }
}