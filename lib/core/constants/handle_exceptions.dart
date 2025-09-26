import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:kiosk_app/core/failure.dart';


Failure handleException(Object e) {
  // Firebase Auth errors
  if (e is FirebaseAuthException) {
    switch (e.code) {
      case 'invalid-email':
        return Failure("Invalid email address.", code: e.code);
      case 'user-not-found':
        return Failure("No user found with this email.", code: e.code);
      case 'wrong-password':
        return Failure("Incorrect password.", code: e.code);
      case 'network-request-failed':
        return Failure.network("Check your internet connection.");
      default:
        return Failure.auth(e.message ?? "Authentication failed.", code: e.code);
    }
  }

  // Firestore errors
  if (e is FirebaseException && e.plugin == 'cloud_firestore') {
    return Failure("Database error: ${e.message}", code: e.code);
  }

  // Storage errors
  if (e is FirebaseException && e.plugin == 'firebase_storage') {
    return Failure("File storage error: ${e.message}", code: e.code);
  }

  // General network failure
  if (e.toString().contains("SocketException")) {
    return Failure.network("Check your internet connection.");
  }

  // Fallback for unknown errors
  return Failure.unknown(e.toString());
}

