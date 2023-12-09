import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth_firebasecubit/Screens/authScreens/Home.dart';
import 'package:auth_firebasecubit/Screens/authScreens/signin.dart';
import 'package:auth_firebasecubit/Screens/authScreens/signup.dart';
class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _nameState();
}

class _nameState extends State<splash> {
  @override
  void initState() {
   

    Future.delayed(const Duration(seconds: 3), () {

      FirebaseAuth.instance.currentUser == null
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignupPage()),
            )
          : FirebaseAuth.instance.currentUser!.emailVerified == true
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                )
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Signin()) ,
                );
    });
        super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Shiha",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 44,
              fontFamily: "Pacifico"),
        ),
      ),
    );
  }
}
