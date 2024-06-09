import 'package:flutter/material.dart';
import 'package:adventurehub/screens/auth/signupscreen.dart';
import 'package:adventurehub/screens/homescreen.dart';
import 'package:lottie/lottie.dart';
import 'package:adventurehub/screens/auth/auth_service.dart';
import 'dart:developer';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(47, 90, 10, 1),
                ),
              ),
              SizedBox(height: 20),
              Flexible(
                child: Lottie.asset(
                  'animations/car.json',
                  height: 200,
                  width: 200,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(47, 90, 10, 1),
                        onPrimary: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.login, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  goToSignup(context);
                },
                child: Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(47, 90, 10, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  _login() async {
    try {
      final user = await _auth.loginUserWithEmailAndPassword(
          emailController.text, passwordController.text);
      if (user != null) {
        log("User Logged In");
        goToHome(context);
      }
    } catch (e) {
      log("Login failed: $e");
    }
  }
}
