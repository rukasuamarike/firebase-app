import 'package:firstfirebase/models/user.dart';
import 'package:firstfirebase/screens/wrapper.dart';
import 'package:firstfirebase/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()=>runApp(Main());


class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,//our value we are streaming is the authservice listening for users 
          child: MaterialApp(//now we can provide user data to wrapper and anything below wrapper.
        home:Wrapper(),
        
      ),
    );
  }
}