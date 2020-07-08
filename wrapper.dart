import 'package:firstfirebase/models/user.dart';
import 'package:firstfirebase/screens/authenticate/authenticate.dart';
import 'package:firstfirebase/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);//we need user from stream from provider

    //return either home or authenticate widget
    if(user == null)return Authenticate();
    else return Home();
  }
}