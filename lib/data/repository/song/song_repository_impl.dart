import 'package:dartz/dartz.dart';
import 'package:spotify_clone_november_2025/data/sources/songs/song_firebase_service.dart';
import 'package:spotify_clone_november_2025/domain/repository/song/song.dart';
import 'package:spotify_clone_november_2025/service_locator.dart';

class SongRepositoryImpl extends SongsRepository{
  @override
  Future<Either> getNewsSongs() async{
   return await s1<SongFirebaseService>().getNewsSongs();

  }

}