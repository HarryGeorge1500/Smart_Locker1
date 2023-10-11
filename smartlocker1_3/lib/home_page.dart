import 'package:firebase_auth/firebase_auth.dart';
//A Flutter plugin to use the Firebase Authentication API.
import 'package:smartlocker1_3/auth.dart';
//calling auth.dart file
import 'package:flutter/material.dart';
//Flutter package to implement Material Design.
import 'bluetooth.dart';
//to list available bluetooth devices nearby and to connect them

class HomePage extends StatelessWidget {
  const HomePage({Key ? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return const StateControllerFun();
  }
}
//stateless widget Homepage initialised to call stateful widget StateControllerFun

class StateControllerFun extends StatefulWidget {
  const StateControllerFun({super.key});
  @override
  State<StateControllerFun> createState() => _StateControllerFunState();
}

class _StateControllerFunState extends State<StateControllerFun> {
  //login status of current user
  final User? user =Auth().currentUser;

  //function to sign out current user
  Future<void> signOut() async{ await Auth().signOut();}

  Widget _title() {
    //widget to display title
    return const Text('Smart Lock');
  }
  Widget _userid(){
    //widget to display user email id
    return  Text(user?.email ?? 'User email');
  }
  Widget _signOutButton(){
    //sign out button
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('sign out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  _title(),
        actions:  [Padding(
          padding: const EdgeInsets.only(top: 20),
          child: _userid(),) ]
      ),
      body:  Container(
        height: double.infinity,
        width:  double.infinity,
        padding:  const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _signOutButton(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top:250),
                child:
                ElevatedButton(onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      //calling BluetoothDeviceListScreen function to display available
                      //bluetooth devices
                      builder: (context) => const BluetoothDeviceListScreen(),
                ),
              );
              },
                child: const Text('Find Locker'),),),)
          ],
        ),
      ),
    );
  }
}
