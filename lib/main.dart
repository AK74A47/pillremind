import 'package:flutter/material.dart';
import 'package:pillremind/pages/add_precep.dart';
import 'package:pillremind/pages/login.dart';
import 'package:pillremind/pages/profile.dart';
import 'package:pillremind/pages/register.dart';

import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const MyHomePage(),
        '/profile': (BuildContext context) => const ProfilePage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/register': (BuildContext context) => const RegisterPage(),
        '/add': (BuildContext context) => const AddPrec(),
      },
    );
  }
}
