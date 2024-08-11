import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './pages/login.dart';

void main() async{
  await dotenv.load(fileName: '.env');
  print('Found .env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soccer Predicitons',
      home: Login()
    )
  );
}


