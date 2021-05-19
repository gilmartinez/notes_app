import 'package:flutter/material.dart';
import 'package:notes_app/create_note_page.dart';
import 'package:notes_app/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes app",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
        "/create-note": (context) => CreateNotePage()
      },
    );
  }
}
