import 'package:flutter/material.dart';
import 'package:ucp1/navigation/loginpage.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  @override
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController nomerTelpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                    'assets/images/logos.png',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'DAFTAR AKUN BARU',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
              Text(''),
              // Text('Nama Lengkap'),
              TextFormField(
                controller: namaLengkapController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Nama Lengkap'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              Text(''),
              // Text("Email"),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              Text(''),
              // Text("Nomer Telephone"),
              TextFormField(
                controller: nomerTelpController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_call),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'No Hp'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              Text(''),
              // Text("Password"),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Password';
                  }
                  return null;
                },
              ),
              Text(''),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Loginpage()),
                  );
                },
                child: Text('Daftar'),
              ),
              Text(''),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Sudah memiliki akun ? Silahkan Login disini'),
                // Text('Login disini!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green)) ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
