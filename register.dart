import 'package:firstfirebase/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firstfirebase/shared/constants.dart';
import 'package:firstfirebase/shared/loading.dart';

class Register extends StatefulWidget {

final Function toggleView;
Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _key=GlobalKey<FormState>();
  bool loading=false;
  String email ='';
  String pw='';
  String error ='';
  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        elevation:0.0,
        title:Text("Sign up to Inventory"),
        actions: <Widget>[
          FlatButton.icon(icon: Icon(Icons.person), label: Text('Sign in'),
          onPressed: (){
            widget.toggleView();
          },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0,horizontal:50.0),
        child: Form(
          key:_key,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val)=> val.isEmpty? 'Enter an Email': null,
                onChanged: (val){
                  setState(()=> email=val);
                },
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val)=> val.length<6 ? 'Enter a Password 6+ chars long': null,//null means valid
                obscureText:true,
                onChanged:(val){
                  setState(()=> pw=val);
                }
              ),
              SizedBox(height:20.0),
              RaisedButton(
                color:Colors.red[400],
                child:Text('register',
                style:TextStyle(color:Colors.white)
                ),
                onPressed: () async{
                  if(_key.currentState.validate()){
                    setState(()=>loading=true);
                    dynamic result =await _auth.registerWithEmailAndPassword(email,pw);
                    if(result==null){
                      setState((){error='please enter a valid email'; loading=false;});
                    }

                  }
                }
              ),
              SizedBox(height:12.0),
                Text(
                  error,
                style:TextStyle(color:Colors.red,fontSize:14.0)
                ),
              
            ]
          ),
        )
      ),
    );
  }
}