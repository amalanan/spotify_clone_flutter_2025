import 'package:dartz/dartz.dart';
import 'package:spotify_clone_november_2025/core/usecase/usecase.dart';
import 'package:spotify_clone_november_2025/domain/repository/song/song.dart';
import 'package:spotify_clone_november_2025/service_locator.dart';

class GetFavoriteSongsUseCase implements UseCase<Either,dynamic> {

  @override
  Future<Either> call({params}) async{
    return await sl<SongsRepository>().getUserFavoriteSongs();
  }
}