import 'package:get_it/get_it.dart';
import 'package:spotify_clone_november_2025/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clone_november_2025/data/repository/song/song_repository_impl.dart';
import 'package:spotify_clone_november_2025/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone_november_2025/data/sources/songs/song_firebase_service.dart';
import 'package:spotify_clone_november_2025/domain/repository/auth/auth.dart';
import 'package:spotify_clone_november_2025/domain/repository/song/song.dart';
import 'package:spotify_clone_november_2025/domain/usecases/auth/get_user.dart';
import 'package:spotify_clone_november_2025/domain/usecases/auth/signin.dart';
import 'package:spotify_clone_november_2025/domain/usecases/auth/signup.dart';
import 'package:spotify_clone_november_2025/domain/usecases/song/add_or_remove_favorite_song.dart';
import 'package:spotify_clone_november_2025/domain/usecases/song/get_favorite_song.dart';
import 'package:spotify_clone_november_2025/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_clone_november_2025/domain/usecases/song/get_playlist.dart';
import 'package:spotify_clone_november_2025/domain/usecases/song/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  sl.registerSingleton<SongsRepository>(SongRepositoryImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());
  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(AddOrRemoveFavoriteSongUseCase());
  sl.registerSingleton<IsFavoriteSongUseCase>(IsFavoriteSongUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<GetFavoriteSongsUseCase>(GetFavoriteSongsUseCase());

}
