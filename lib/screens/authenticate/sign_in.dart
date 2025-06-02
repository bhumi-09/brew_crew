import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/widgets/elevatedButton.dart';
import 'package:brew_crew/widgets/loader.dart';
import 'package:brew_crew/widgets/snackBar.dart';
import 'package:brew_crew/widgets/textFormField.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  //text field state
  String email = '';
  String password = '';

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
        body:loading ? Loading() : Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            //   child: ElevatedButton(
            //       onPressed: () async {
            //         dynamic result = await _auth.signInAnon();

            //         if (result == null) {
            //           print(' Error while sign in');
            //            ScaffoldMessenger.of(context).showSnackBar(
            //             SnackBar(
            //               content: Text(' Geeting error while signed in'),
            //               backgroundColor: Colors.red,
            //               behavior: SnackBarBehavior.floating,
            //               duration: Duration(seconds: 5),
            //             ),
            //           );
            //         } else {
            //           print(' Signed in successfully ${result}');
            //           print('uId ::  ${result.uId}');
            //           ScaffoldMessenger.of(context).showSnackBar(
            //             SnackBar(
            //               content: Text('Signed in successfully'),
            //               backgroundColor: Colors.green,
            //               behavior: SnackBarBehavior.floating,
            //               duration: Duration(seconds: 3),
            //             ),
            //           );
            //         }
            //       },
            //       child: Text('Sign In as Guest ')),
            // ),

            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  CustomTextFormField(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: Icons.email,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter your email';
                      } else if (!val.contains('@')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    obscureText: true,
                    prefixIcon: Icons.lock,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter your password';
                      } else if (val.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(height: 40),
                  CustomElevatedButton(
                    text: 'Sign in',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);

                        if (result == null) {
                          setState(() => loading = false);
                          AppSnackBar.showError(
                              context, 'Please provide valid credentials');
                        } else {
                          AppSnackBar.showSuccess(
                              context, 'Signed in successfully');
                        }
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            widget.toggleView();
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.brown.shade800, fontSize: 16),
                          ))
                    ],
                  )
                ],
              ),
            )));
  }
}
