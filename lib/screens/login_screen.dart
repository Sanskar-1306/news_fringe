import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_fringe/constants.dart';
import 'package:news_fringe/screens/Registration_Screen.dart';
import 'package:news_fringe/screens/home_screen.dart';
import 'package:news_fringe/screens/loading_screen.dart';
class LoginScreen extends StatefulWidget {
  static String id='login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey=GlobalKey<FormState>();
 final _auth=FirebaseAuth.instance;
  bool obscureText=true;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
      title: Text('NewsFringe'),
        centerTitle: true,
      ),
      body: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              Text('LOGIN',style: kHeadingTextStyle.copyWith(fontSize: 40),),
              SizedBox(height: 20,),
              Icon(Icons.account_circle,size: 80,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(style: kTextStyle,
                  keyboardType:TextInputType.emailAddress,
                  validator: (value){
                    return  (value.contains('@'))?null:'Email is badly formatted';
                  },
                  onSaved: (value)=>email=value,
                  decoration: InputDecoration(

                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                  ),

                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: kTextStyle,
                  obscureText: obscureText,
                  validator: (value){
                    return  (value.length>6)?null:'Password should be greater than 6 words';
                  },
                  onSaved: (value)=>password=value,
                  decoration: InputDecoration(

                      icon: Icon(Icons.lock),
                      suffixIcon:(obscureText==true) ?GestureDetector(
                          onTap: (){
                            setState(() {
                              obscureText=!obscureText;
                            });
                          },
                          child: Icon(Icons.visibility)):GestureDetector(
                          onTap: (){
                            setState(() {
                              obscureText=!obscureText;
                            });
                          },
                          child: Icon(Icons.visibility_off)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                  ),),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: (){
                      formVerify();

                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Register',
                      style: kTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              GestureDetector(
                child: Text('Not Registered ? Click Here',style: kTextStyle,),
onTap: (){

                  Navigator.pushNamed(context, RegistrationScreen.id);
},
              )
            ],


          )),

    );

  }
  void formVerify()
  async{
    if (_formkey.currentState.validate())
      {
        _formkey.currentState.save();
        try{
       final user=await   _auth.signInWithEmailAndPassword(email: email, password: password);
       if (user!=null)
         {
           Navigator.pushNamed(context,LoadingScreen.id);
         }

        }
        catch(e){

          print(e);
        }
      }

  }

}
