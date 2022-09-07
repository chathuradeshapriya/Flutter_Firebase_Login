import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:login_with_firebase/signup.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  void signup() async {
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: 'test3@gmail.com', password: '123456');
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
    );


  }
}
