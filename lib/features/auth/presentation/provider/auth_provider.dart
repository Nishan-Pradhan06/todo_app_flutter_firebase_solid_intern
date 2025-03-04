// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthProvider extends ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   User? _user;
//   User? get user => _user;

//   // Add a loading state
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   // Add an error message field
//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;

//   AuthProvider() {
//     _user = _auth.currentUser;
//     _auth.authStateChanges().listen((user) {
//       _user = user;
//       notifyListeners();
//     });
//   }

//   Future<bool> signInWithGoogle() async {
//     _isLoading = true;
//     _errorMessage = null;
//     notifyListeners();

//     try {
//       // Properly catch errors from GoogleSignIn
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         // User cancelled sign-in
//         _isLoading = false;
//         notifyListeners();
//         return false;
//       }

//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       await _auth.signInWithCredential(credential);
//       _isLoading = false;
//       notifyListeners();
//       return true;
//     } catch (e) {
//       log('Google Sign-In Error: ${e.toString()}');
//       _errorMessage = 'Google Sign-In failed. Please try again later.';
//       _isLoading = false;
//       notifyListeners();
//       return false;
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//       await _googleSignIn.signOut();
//     } catch (e) {
//       log('Sign Out Error: ${e.toString()}');
//     }
//   }
// }
