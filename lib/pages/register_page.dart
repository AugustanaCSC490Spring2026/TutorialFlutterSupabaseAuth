import 'package:flutter/material.dart';
import 'package:my_auth_tuto/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // get the auth service
  final authService = AuthService();

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  //sign up button pressed
  void signUp() async {
    //prepare data
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    //check if the passwords match
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords don't match")),
      );
      return;
    }

    //attempt signing up
    try {
      await authService.SignUpWithEmailPassword(email, password);

      //pop this page
      Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up")),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        children: [
          //email
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ), //TextField

          //password
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: "Password"),
          ),

          //confirmPassword
          TextField(
            controller: _confirmPasswordController, // fixed: was _passwordController
            decoration: const InputDecoration(labelText: "Confirm Password"),
          ),

          const SizedBox(height: 12),
          // button
          ElevatedButton(
            onPressed: signUp,
            child: const Text("Sign Up"),
          ),

          const SizedBox(height: 12),
        ], // fixed: added missing closing bracket
      ),
    );
  }
}