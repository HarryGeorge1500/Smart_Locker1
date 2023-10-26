//This file is used for sign-in existing user or registering new user.
//user mail id should end with @gcek.ac.in to sign-in or register.

// Flutter plugin to implement Material Design.
import 'package:flutter/material.dart';
//Flutter plugin to use the Firebase Authentication API.
import 'package:firebase_auth/firebase_auth.dart';
//importing file to verify email and password
import 'package:smartlocker1_3/auth.dart';

//creating class for setting up login page
class LoginPage extends StatefulWidget {
  //creating a constant constructor
  const LoginPage({Key ? key}):super(key:key);

  @override
  //creating an instance for login page
  State<LoginPage> createState() => _LoginPageState();
}
//for login using email and password
class _LoginPageState extends State<LoginPage> {
  String? errorMessage ='';
  bool isLogin =true;
  final TextEditingController _controllerEmail =TextEditingController();
  final TextEditingController _controllerPassword =TextEditingController();
//function to sign in existing user
  Future<void> signInWithEmailAndPassword() async{
    try{
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text);}
    //sending data to firebase
  on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message;//to print error message if any
      });
    }
  }
//for registering new user
  Future<void> createUserWithEmailAndPassword() async{
    try{
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text,);}
    on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message;
      });
    }
  }
//creating a title widget
  Widget _title(){
    return const Text(('Smart Lock'),);
  }
//creating entry field for entering email and password
  Widget _entryField(
      String title,
      TextEditingController controller,
      ){//text field for entering login credentials
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
//for displaying error message
  Widget _errorMessage(){
    return Text(errorMessage == '' ? '': 'Try Again $errorMessage');
  }
//creating submit button
  Widget _submitButton(){
    return ElevatedButton(
        onPressed: () async {
          if (!_controllerEmail.text.endsWith('@gcek.ac.in')) {
            //checking mail entered have gcek handle
            showDialog(
              context: context,
              builder: (BuildContext context) {
                //showing error popup
                return AlertDialog(
                  title: const Text('Invalid email'),
                  content: const Text('Please enter a valid email address ending with @gcek.ac.in.'),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
            return;
          }
          //sending email id and password to firebase cloud
          try {
            await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _controllerEmail.text,
              password: _controllerPassword.text,
            );//displaying error for invalid credential
          } catch (e) {
            Text('Error: $e');
          }
        },
        child: Text(isLogin ? 'Login': 'Register'),
    );
  }
//display button for login/register
  Widget _loginOrRegisterButton(){
    return TextButton(
        onPressed: () {
          setState(() {
        isLogin =!isLogin;
      });
    },
      child: Text(isLogin ? 'Register instead': 'Login instead'),
    );
  }

  @override
  //arranging pre-initialized widget in a new window
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Entering the corresponding email
            _entryField('Email', _controllerEmail),
            //Entering the corresponding password
            _entryField('Password', _controllerPassword),
            //widget to print error message
            _errorMessage(),
            //submit button
            _submitButton(),
            //login button or register button
            _loginOrRegisterButton(),
          ],
        ),
      ),
    );
  }
}
