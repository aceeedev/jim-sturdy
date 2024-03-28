import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:jim_sturdy/pages/home_page.dart';
import 'package:jim_sturdy/providers/main_provider.dart';
import 'package:jim_sturdy/backend/google_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Sign in dub'),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.login),
                  onPressed: () async {
                    UserCredential? userCredential = await signInWithGoogle();

                    if (userCredential != null) {
                      context
                          .read<MainProvider>()
                          .setUserCredential(userCredential);

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    } else {
                      setState(() =>
                          errorMessage = 'Something went wrong, try again');
                    }
                  },
                ),
              ),
              Text(errorMessage),
            ],
          ),
        ));
  }
}
