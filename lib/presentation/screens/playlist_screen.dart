import 'package:flutter/material.dart';
import 'package:music_parser/data/entity/playlist_entity.dart';
import 'package:music_parser/presentation/widgets/song_widget.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({required this.playlist, super.key});

  final PlaylistEntity playlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(playlist.name)),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 16 / 12, 
                child: Image.network(
                  playlist.avatar,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.4),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      playlist.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Likes: ${playlist.likes}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: playlist.songs.length,
              itemBuilder: (context, index) {
                final song = playlist.songs[index];
                return SongWidget(song, index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
