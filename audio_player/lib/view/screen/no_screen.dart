import 'package:flutter/material.dart';

class NoScreen extends StatelessWidget {
  const NoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Screen'),
      ),
      body: const Center(
        child: Text('No Screen'),
      ),
    );
  }
}
