import 'package:flutter/material.dart';
import 'posts.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.indigo,
      ),
      home: PostPage(),
    ); 
  }
}

