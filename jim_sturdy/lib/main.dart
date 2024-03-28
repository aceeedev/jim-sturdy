import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:jim_sturdy/app.dart';
import 'package:jim_sturdy/firebase_options.dart';
import 'package:jim_sturdy/providers/main_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: const MaterialApp(
        home: App(),
        debugShowCheckedModeBanner: false,
      )));
}
