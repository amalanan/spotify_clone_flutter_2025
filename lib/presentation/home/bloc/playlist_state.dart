import 'package:spotify_clone_november_2025/domain/entities/song/song.dart';

abstract class PlaylistState {}

class PlaylistLoading extends PlaylistState {}

class PlaylistLoaded extends PlaylistState {
  final List<SongEntity> songs;

  PlaylistLoaded({required this.songs});
}

class PlaylistFailure extends PlaylistState {}
