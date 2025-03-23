import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'signup.dart';
import 'profile.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {

              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              });
              return Container();
            } else {

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Image.asset(
                   'assets/logo.png',
                     width: 150,
                     height: 150,
                     ),
                  SizedBox(height: 20),
                  Text(
                    'Welcome to Our App',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text('Sign Up'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}