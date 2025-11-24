import 'package:flutter/material.dart';
import 'package:spotify_clone_november_2025/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone_november_2025/common/widgets/favorite_button/favorite_button.dart';
import 'package:spotify_clone_november_2025/core/configs/constants/app_urls.dart';
import 'package:spotify_clone_november_2025/domain/entities/song/song.dart';

class SongPlayerPage extends StatelessWidget {
  const SongPlayerPage({super.key, required this.songEntity});

  final SongEntity songEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text('Now Playing', style: TextStyle(fontSize: 18)),
        action: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert_rounded),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            _songCover(context),
            const SizedBox(height: 20,),
            _songDetail()
          ],
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            '${AppURLs.coverFireStorage}${songEntity.artist} - ${songEntity.title}.jpg?${AppURLs.mediaAlt}',
          ),
        ),
      ),
    );
  }
  Widget _songDetail(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22
              ),
            ),
            const SizedBox(height: 5, ),
            Text(
              songEntity.artist,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14
              ),
            ),
          ],
        ),
        FavoriteButton(
            songEntity: songEntity
        )
      ],
    );
  }
}
