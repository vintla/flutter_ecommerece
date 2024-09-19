import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_creation_model.dart';
import '../models/user_signin_model.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationModel userCreationModel);
  Future<Either> signin(UserSigninModel userSigninModel);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationModel user) async {
    try {
      var returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(returnedData.user!.uid)
          .set({
        "firstName": user.firstName,
        "lastName": user.lastName,
        "email": user.email,
        "gender": user.gender,
        "age": user.age,
        "profilePhoto": returnedData.user!.photoURL,
        "userId": returnedData.user!.uid,
      });
      return const Right("Signup success!");
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signin(UserSigninModel user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);
      return const Right("Signin success!");
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        message = 'No user found for this email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for this user.';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection("Ages").get();
      return Right(returnedData.docs);
    } catch (e) {
      return const Left("Please try again");
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var userData = await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUser?.uid)
          .get()
          .then(
            (value) => value.data(),
          );
      return Right(userData);
    } catch (e) {
      return const Left("Please try again");
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right("Password reset email sent");
    } catch (e) {
      return const Left("Please try again");
    }
  }
}
