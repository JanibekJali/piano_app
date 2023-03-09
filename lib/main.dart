import 'package:flutter/material.dart';
import 'package:piano_app/views/home_view.dart';

void main() {
  runApp(PianoApp());
}

class PianoApp extends StatelessWidget {
  const PianoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
