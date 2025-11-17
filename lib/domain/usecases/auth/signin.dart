import 'package:dartz/dartz.dart';
import 'package:spotify_clone_november_2025/core/usecase/usecase.dart';
import 'package:spotify_clone_november_2025/data/models/auth/signin_user_req.dart';
import 'package:spotify_clone_november_2025/domain/repository/auth/auth.dart';
import 'package:spotify_clone_november_2025/service_locator.dart';

class SignInUseCase implements UseCase<Either, SignInUserReq> {
  @override
  Future<Either> call({SignInUserReq? params}) {
    return s1<AuthRepository>().signin(params!);
  }
}
