import 'package:flutter/material.dart';
import 'package:video_over_airplay/video_over_airplay_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: VideoOverAirplayWidget(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.launch),
                Text("Touch me!"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
