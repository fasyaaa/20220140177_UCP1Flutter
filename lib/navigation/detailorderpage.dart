import 'package:flutter/material.dart';

class Detailorderpage extends StatefulWidget {
  const Detailorderpage({super.key});

  @override
  State<Detailorderpage> createState() => _DetailorderpageState();
}

class _DetailorderpageState extends State<Detailorderpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            children: [],
        ),
      ),
    );
  }
}