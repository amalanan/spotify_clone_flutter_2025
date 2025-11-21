import 'package:dartz/dartz.dart';
import 'package:spotify_clone_november_2025/core/usecase/usecase.dart';
import 'package:spotify_clone_november_2025/domain/repository/song/song.dart';
import 'package:spotify_clone_november_2025/service_locator.dart';

class AddOrRemoveFavoriteSongUseCase implements UseCase<Either,String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<SongsRepository>().addOrRemoveFavoriteSongs(params!);
  }

}