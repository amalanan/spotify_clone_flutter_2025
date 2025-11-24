
import 'package:spotify_clone_november_2025/domain/entities/auth/user.dart';

abstract class ProfileInfoState{}

class ProfileInfoLoading extends ProfileInfoState {}

class ProfileInfoLoaded extends ProfileInfoState {
  final UserEntity userEntity;
  ProfileInfoLoaded({required this.userEntity});
}

class ProfileInfoFailure extends ProfileInfoState {}