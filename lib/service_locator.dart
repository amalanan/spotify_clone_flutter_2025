import 'package:get_it/get_it.dart';
import 'package:spotify_clone_november_2025/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clone_november_2025/data/repository/song/song_repository_impl.dart';
import 'package:spotify_clone_november_2025/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone_november_2025/data/sources/songs/song_firebase_service.dart';
import 'package:spotify_clone_november_2025/domain/repository/auth/auth.dart';
import 'package:spotify_clone_november_2025/domain/repository/song/song.dart';
import 'package:spotify_clone_november_2025/domain/usecases/auth/signin.dart';
import 'package:spotify_clone_november_2025/domain/usecases/auth/signup.dart';
import 'package:spotify_clone_november_2025/domain/usecases/song/get_news_songs.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  s1.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  s1.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());

  s1.registerSingleton<SongsRepository>(SongRepositoryImpl());

  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  s1.registerSingleton<SignUpUseCase>(SignUpUseCase());
  s1.registerSingleton<SignInUseCase>(SignInUseCase());

  s1.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
}
