
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_november_2025/domain/usecases/auth/get_user.dart';
import 'package:spotify_clone_november_2025/presentation/profile/bloc/profile_info_state.dart';
import 'package:spotify_clone_november_2025/service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {

  ProfileInfoCubit() : super (ProfileInfoLoading());

  Future<void> getUser() async {

    var user = await sl<GetUserUseCase>().call();

    user.fold(
            (l){
          emit(
              ProfileInfoFailure()
          );
        },
            (userEntity) {
          emit(
              ProfileInfoLoaded(userEntity: userEntity)
          );
        }
    );
  }
}