  import 'package:flutter/material.dart';
import 'package:gobble/screens/onboarding_screen.dart';
import 'package:gobble/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(fontFamily: 'Gilroy',fontWeight: FontWeight.w600,fontSize:16),
    )
      ),
      
      home: SignupForm()
    );
  }
}