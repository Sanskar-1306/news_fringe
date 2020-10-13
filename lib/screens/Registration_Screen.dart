
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_fringe/constants.dart';
import 'package:news_fringe/screens/home_screen.dart';
import 'package:news_fringe/screens/loading_screen.dart';
import 'login_screen.dart';
final _auth=FirebaseAuth.instance;
FirebaseUser firebaseUser;
void getStatus()async

{
  firebaseUser=await _auth.currentUser();

}
class RegistrationScreen extends StatefulWidget {
  static String id='register';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formkey=GlobalKey<FormState>();
String email;
String password;
  bool obscureText=true;
void formVerify()async
{if (_formkey.currentState.validate())
{_formkey.currentState.save();
try {
  final user =await _auth.createUserWithEmailAndPassword(
      email: email, password: password);
  if (user != null) {
    Navigator.pushNamed(context,LoadingScreen.id);
  }
}
catch(e){
print(e);


}

}

}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
getStatus() ;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.black,
        title: Text('NewsFringe'),
        centerTitle: true,
      ),
      body:Form(
          key: _formkey,
          child: Column(
children: <Widget>[
SizedBox(height: 30,),
  Text('REGISTER',style: kHeadingTextStyle.copyWith(fontSize: 40),),
SizedBox(height: 30,),
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
  Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Material(
      elevation: 5.0,
      color: Colors.black,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: (){
          Navigator.pushNamed(context, LoadingScreen.id);

        },
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          'Continue without Sign up',
          style: kTextStyle.copyWith(color: Colors.white),
        ),
      ),
    ),
  ),


SizedBox(height: 10,),

        GestureDetector(
          child: Text('Already Registered ? Click Here',style: kTextStyle,),
onTap: (){
            String loggedin=(firebaseUser==null)?LoginScreen.id:LoadingScreen.id;
            Navigator.pushNamed(context,loggedin );

},

      )
],


      )),


    );
  }
}
