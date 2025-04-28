import 'package:flutter/material.dart';
import 'package:ucp1/navigation/datapiketpage.dart';

class Detailpage extends StatelessWidget {
  final String tugasPiket;
  final String tanggal;
  final String email;
  const Detailpage({
    super.key,
    required this.tugasPiket,
    required this.tanggal,
    required this.email,
  });

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
                            builder: (context) => Datapiketpage(email: email),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Detail $tugasPiket',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Form(
                                child: Text(
                                  '$tanggal',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 65, 187, 69),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 65, 187, 69),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Text(
                                '$email',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 65, 187, 69),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            '$tugasPiket',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
