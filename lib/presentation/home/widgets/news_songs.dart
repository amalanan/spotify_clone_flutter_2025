import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_november_2025/core/configs/constants/app_urls.dart';
import 'package:spotify_clone_november_2025/domain/entities/song/song.dart';
import 'package:spotify_clone_november_2025/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify_clone_november_2025/presentation/home/bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NewsSongsLoaded) {
              return _songs(state.songs);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '${AppURLs.coverFireStorage}${songs[index].artist} - ${songs[index].title}.jpg?${AppURLs.mediaAlt}',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 14);
      },
      itemCount: songs.length,
    );
  }
}
