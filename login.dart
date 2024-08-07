import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 138, 60, 55),
        title: Text(
          'Login',
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Section
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'lib/images/joey.jpg'), // Replace with your asset
              ),
              const SizedBox(height: 16),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Please login to your account',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
              // Username TextField
              const TextField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Password TextField
              const TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Login Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to the MenuPage
                  Navigator.pushReplacementNamed(context, '/menupage');
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
