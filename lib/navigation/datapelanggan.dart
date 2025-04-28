import 'package:flutter/material.dart';

class Datapelanggan extends StatefulWidget {
  const Datapelanggan({super.key});

  @override
  State<Datapelanggan> createState() => _DatapelangganState();
}

class _DatapelangganState extends State<Datapelanggan> {
  @override
  final TextEditingController cusController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"), actions: const []),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: []),
      ),
    );
  }
}
