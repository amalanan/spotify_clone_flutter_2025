import 'package:dartz/dartz.dart';
import 'package:spotify_clone_november_2025/data/sources/songs/song_firebase_service.dart';
import 'package:spotify_clone_november_2025/domain/repository/song/song.dart';
import 'package:spotify_clone_november_2025/service_locator.dart';

class SongRepositoryImpl extends SongsRepository{
  @override
  Future<Either> getNewsSongs() async{
   return await sl<SongFirebaseService>().getNewsSongs();

  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async {
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSong(songId);
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().isFavoriteSong(songId);
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    return await sl<SongFirebaseService>().getUserFavoriteSongs();
  }
}