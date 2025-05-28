import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
        title: Text(
          'Sign in to Brew Crew',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: ElevatedButton(
            onPressed: () async {
              dynamic result = await _auth.signInAnon();

              if (result == null) {
                print(' Error while sign in');
                 ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(' Geeting error while signed in'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 5),
                  ),
                );
              } else {
                print(' Signed in successfully ${result}');
                print('uId ::  ${result.uId}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Signed in successfully'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
            child: Text('Sign In as Guest ')),
      ),
    );
  }
}
