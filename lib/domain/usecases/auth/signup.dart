import 'package:dartz/dartz.dart';
import 'package:spotify_clone_november_2025/core/usecase/usecase.dart';
import 'package:spotify_clone_november_2025/data/models/auth/create_user_req.dart';
import 'package:spotify_clone_november_2025/domain/repository/auth/auth.dart';
import 'package:spotify_clone_november_2025/service_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
