import 'package:flutter/material.dart';
import 'MainPages/Hotels_page.dart';
import 'MainPages/Home.dart';
import 'MainPages/login_page.dart';
import 'MainPages/profile_page.dart';
import 'MainPages/setting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      //home: ProfilePage(),
      //home: FooterBar(),
      //home:HotelColumn(),
      //home: SettingsPage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),

    );
  }
}
