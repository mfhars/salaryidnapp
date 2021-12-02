import 'package:flutter/material.dart';
import 'package:flutter_app_3/pages/auth/signin_page.dart';
import 'package:flutter_app_3/pages/home/home_page.dart';
import 'package:flutter_app_3/pages/main_page.dart';
import 'package:flutter_app_3/pages/news/detail_news.dart';
import 'package:flutter_app_3/pages/news/news_page.dart';
import 'package:flutter_app_3/pages/providers/auth_providers.dart';
import 'package:flutter_app_3/pages/salary/detail_salary_page.dart';
import 'package:flutter_app_3/pages/salary/salary_page.dart';
import 'package:flutter_app_3/pages/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'pages/profile/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: MaterialApp(
        title: 'Salary',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/home-page': (context) => HomePage(),
          '/sign-in': (context) => SignInPage(),
          '/main-page': (context) => MainPage(),
          '/salary-page': (context) => SalaryPage(),
          '/news-page': (context) => NewsPage(),
          '/profile-page': (context) => ProfilePage(),
          // '/detail-news' : (context) => DetailNews(),
          '/detail-salary': (context) => DetailSalary(),
        },
      ),
    );
  }
}
