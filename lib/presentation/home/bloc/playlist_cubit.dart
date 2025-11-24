import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_november_2025/domain/usecases/song/get_playlist.dart';
import 'package:spotify_clone_november_2025/presentation/home/bloc/playlist_state.dart';
import 'package:spotify_clone_november_2025/service_locator.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistLoading());

  Future<void> getPlaylist() async {
    var returnedSongs = await sl<GetPlayListUseCase>().call();
    returnedSongs.fold(
      (l) {
        emit(PlaylistFailure());
      },
      (data) {
        emit(PlaylistLoaded(songs: data));
      },
    );
  }
}
