import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    print('In user :  ${user}');

    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    }else{
      return Home();
    }
  }
}
