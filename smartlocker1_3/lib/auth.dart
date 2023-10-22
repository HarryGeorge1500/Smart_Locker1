//This file initializes sign-in, register and sign-out functions.
//email-id and password is send to firebase server.

//A Flutter plugin to use the Firebase Authentication API.
import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
  //creating firebase instance
  User? get currentUser => _firebaseAuth.currentUser;
  //to get the user state
  Stream<User?> get authStateChanges=> _firebaseAuth.authStateChanges();
  //to check the authentication status of the user

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password

})async{
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password);
  }//signing into firebase server

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password
  })async{
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }//registering into firebase server

  Future<void> signOut() async{await _firebaseAuth.signOut();}
  //to sign out user
}