import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        title: Text('Brew Crew', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.brown,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async{
                await _auth.signOut(); 
                print('Signed out successfully');
              }, icon: Icon(Icons.logout, color: Colors.white))
        ],
      ),
    );
  }
}
