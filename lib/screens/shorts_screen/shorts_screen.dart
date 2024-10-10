import 'package:flutter/material.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
