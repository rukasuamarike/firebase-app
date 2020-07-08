import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstfirebase/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object
  User _userObject(FirebaseUser user){
    
    return user != null? User(uid: user.uid):null;
  }

//auth change user stream: get user from firebase user from authchangestream
  Stream<User> get user {
    return _auth.onAuthStateChanged
     // .map((FirebaseUser user) => _userObject(user));
      .map(_userObject);//same as above
  }

  //sign annonymous
  Future signInAnon() async{
    try{
      AuthResult resp = await _auth.signInAnonymously();
      FirebaseUser user =resp.user;
      return _userObject(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign email
  Future signInWithEmailAndPassword(String email, String pw) async{
    try{
      AuthResult resp= await _auth.signInWithEmailAndPassword(email: email, password: pw);
      FirebaseUser user =resp.user;
      return _userObject(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  //register email 
  Future registerWithEmailAndPassword(String email, String pw) async{
    try{
      AuthResult resp= await _auth.createUserWithEmailAndPassword(email: email, password: pw);
      FirebaseUser user =resp.user;
      return _userObject(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  //signout
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  }
