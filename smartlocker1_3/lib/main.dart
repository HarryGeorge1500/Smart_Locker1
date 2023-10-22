//this file is the starting point of execution for this app.

//A Flutter plugin to use the Firebase Core API, which enables connecting to  Firebase app.
import 'package:firebase_core/firebase_core.dart';
//Flutter plugin to implement Material Design.
import 'package:flutter/material.dart';
//importing firebase_options.dart file. This file is used to connect this app to firebase
import 'firebase_options.dart';
//importing smartlocker1_3/widget_tree.dart file. This file redirects user to login page
//or to home page depending on the login status of the user.
import 'widget_tree.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  //This code initializes Firebase within a Flutter app,
  // ensuring that the Flutter framework is properly set up.
  // It uses default Firebase options for the current platform to configure
  // Firebase services for tasks such as authentication, database, and storage.
  runApp(const MyApp());
  //Calling MyApp class, which stats the execution of the app.
}

class MyApp extends StatelessWidget {
  const MyApp({Key ? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialising MaterialApp widget with a primary color scheme of red
      //calling WidgetTree function from widget_tree.dart file
      debugShowCheckedModeBanner: false,//flutter runs android app in debug mode by default
      //this code is used to remove the debug banner
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const WidgetTree(),
    );
  }
}
