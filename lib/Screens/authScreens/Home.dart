import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth_firebasecubit/Screens/splash.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
                  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const splash()),
          );
            },
            icon: Icon(
              Icons.logout,
            )),
      ),
    );
  }
}
