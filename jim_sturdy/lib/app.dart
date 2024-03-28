import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jim_sturdy/pages/home_page.dart';
import 'package:jim_sturdy/pages/login_page.dart';
import 'package:jim_sturdy/backend/google_auth.dart';
import 'package:jim_sturdy/providers/main_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: tryToRememberSignInWithGoogle(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                  child: Text('An error has occurred, ${snapshot.error}'));
            } else if (snapshot.hasData) {
              UserCredential? userCredential = snapshot.data;

              if (userCredential != null) {
                context.read<MainProvider>().setUserCredential(userCredential);

                return const HomePage();
              } else {
                return const LoginPage();
              }
            }
          }

          return const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
