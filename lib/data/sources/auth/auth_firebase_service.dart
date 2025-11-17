import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone_november_2025/data/models/auth/create_user_req.dart';
import 'package:spotify_clone_november_2025/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SignInUserReq signInUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SignInUserReq signInUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signInUserReq.email,
        password: signInUserReq.password,
      );
      return Right('Sign In Was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'Invalid Email') {
        message = 'No User Found for that Email';
      } else if (e.code == 'invalid-credentials') {
        message = 'Wrong Password Provided';
      }

      return left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return Right('Sign Up Was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }

      return left(message);
    }
  }
}
