import 'package:music_parser/data/entity/song_entity.dart';

class PlaylistEntity {
  final String name;
  final String avatar;
  final int likes;
  final List<SongEntity> songs;

  const PlaylistEntity({
    required this.name,
    required this.avatar,
    required this.likes,
    required this.songs,
  });
}
