import 'package:dartz/dartz.dart';
import 'package:spotify_clone_november_2025/data/models/auth/create_user_req.dart';
import 'package:spotify_clone_november_2025/data/models/auth/signin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SignInUserReq signInUserReq);
  Future<Either> getUser();

}
