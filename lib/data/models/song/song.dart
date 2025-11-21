import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone_november_2025/domain/entities/song/song.dart';

class SongModel {
  String ? title;
  String ? artist;
  num ? duration;
  Timestamp ? releaseDate;
  bool ? isFavorite;
  String ? songId;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.isFavorite,
    required this.songId
  });

  SongModel.fromJson(Map<String,dynamic> data) {
    title = data['title'] ?? 'Unknown Title';
    artist = data['artist'] ?? 'Unknown Artist';
    duration = data['duration'] ?? 0.0;
    releaseDate = data['releaseDate'] ?? Timestamp.now();
    isFavorite = false; // قيمة افتراضية
    songId = ''; // قيمة افتراضية
  }}


extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title ?? 'Unknown Title',
      artist: artist ?? 'Unknown Artist',
      duration: duration ?? 0.0,
      releaseDate: releaseDate ?? Timestamp.now(),
      isFavorite: isFavorite ?? false,
      songId: songId ?? '',
    );
  }
}
