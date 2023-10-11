//calling auth.dart file
import 'package:smartlocker1_3/auth.dart';
//calling home_page.dart file
import 'package:smartlocker1_3/home_page.dart';
//calling Login_Register_page.dart file
import 'package:smartlocker1_3/Login_Register_page.dart';
//Flutter plugin to implement Material Design.
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key ? key}):super(key:key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}
//this class is implemented using firebase documentation
class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context,snapshot){
          // the if loop below is implemented specifically for this project
          if (snapshot.hasData){
            //checking if the user is already logged in
            //return to home page if logged in
            return const HomePage();
          }else{
            //return to login page if the user is not logged in
            return const LoginPage();}
          },
        );
  }
}
