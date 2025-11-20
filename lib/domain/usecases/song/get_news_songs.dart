import 'package:dartz/dartz.dart';
import 'package:spotify_clone_november_2025/core/usecase/usecase.dart';
import 'package:spotify_clone_november_2025/data/repository/song/song_repository_impl.dart';
import 'package:spotify_clone_november_2025/service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await s1<SongRepositoryImpl>().getNewsSongs();
  }
}
