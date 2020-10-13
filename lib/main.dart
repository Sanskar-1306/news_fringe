
import 'package:flutter/material.dart';
import 'package:news_fringe/news_data.dart';
import 'screens/login_screen.dart';
import 'package:news_fringe/screens/Registration_Screen.dart';
import 'package:news_fringe/screens/categoryNews.dart';
import 'package:news_fringe/screens/home_screen.dart';
import 'package:news_fringe/screens/loading_screen.dart';
import 'package:news_fringe/screens/news_screen.dart';
import 'package:provider/provider.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsData>(
      create: (context)=>NewsData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.black
        ),

        home: RegistrationScreen(),
        routes: {
          HomePage.id:(context)=>HomePage(),
          LoadingScreen.id:(context)=>LoadingScreen(),
          NewsScreen.id:(context)=>NewsScreen(),
          CategoryNews.id:(context)=>CategoryNews(),
          RegistrationScreen.id:(context)=>RegistrationScreen(),
          LoginScreen.id:(context)=>LoginScreen()
        },
      ),
    );
  }
}



