import 'package:flutter/material.dart';
import 'package:ucp1/navigation/homepage.dart';

class Datapiketpage extends StatelessWidget {
  final String email;
  const Datapiketpage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final TextEditingController tugasPiketController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

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
            SizedBox(height: 12),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Anggota',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            initialValue: email,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            readOnly: true,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Pilih Tanggal',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          
                          SizedBox(height: 10),
                          Text(
                            'Tugas Piket',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: TextFormField(
                                  controller: tugasPiketController,
                                  decoration: InputDecoration(
                                    hintText: 'Tugas Piket',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your job';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 5,
                                child: SizedBox(
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        65,
                                        187,
                                        69,
                                      ),
                                      foregroundColor: Colors.black,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                      ),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                                    ),
                                    child: Text('Tambah'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
