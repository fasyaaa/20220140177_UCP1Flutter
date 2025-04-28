import 'package:flutter/material.dart';
import 'package:ucp1/navigation/homepage.dart';

class Datapiketpage extends StatelessWidget {
  final String email;
  const Datapiketpage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 65, 187, 69),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Homepage(email: email),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Piket Gudang',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  child: Padding(padding: const EdgeInsets.all(16.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
