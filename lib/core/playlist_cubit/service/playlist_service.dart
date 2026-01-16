import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:music_parser/data/entity/playlist_entity.dart';
import 'package:music_parser/data/entity/song_entity.dart';

class PlaylistScraperService {
  Future<PlaylistEntity> fetchPlaylist(String url) async {
    final response = await http.get(
      Uri.parse(url),
      // headers: {
      //   'User-Agent': 'Mozilla/5.0',
      //   'Referer': 'https://suamusica.com.br/',
      // },
    );
    if (response.statusCode != 200) {
      throw Exception('JSON ${response.statusCode}');
    }

    final jsonData = json.decode(response.body);
    final album = jsonData['pageProps']['album'];
    final List songsJson = album['files'];
    final title = album['title'];
    final name = album['name'];
    //🔴 ВАРІАНТ 3 — Через Content-Length (НЕ РЕКОМЕНДУЮ)

    // Теоретично:

    // duration ≈ file_size / bitrate

    final songs = await Future.wait(
      //
      songsJson.map((song) async {
        // final player = AudioPlayer();

        // await player.setUrl(song['path'] ?? '');

        // final duration = player.duration;

        // await player.dispose();
        final path = song['path']?.toString() ?? '';

        final duration = path.isNotEmpty ? await _fetchDuration(path) : '0:00';
        return SongEntity(
          name: song['file'] ?? '',
          artist: name ?? '',
          album: title ?? '',
          duration: "0", // а це погано
          //https://web.suamusica.com.br/36466514/4908524/Sua+Vez+de+Terminar.mp3// якось з цього треба получити duration
        );
      }),
    );

    print(title);
    return PlaylistEntity(
      name: album['title'] ?? '',
      avatar: album['cover'] ?? '',
      likes: album['likes'] ?? '',
      songs: songs,
    );
  }

  Future<String> _fetchDuration(String url) async {
    // also didn't work show error 403, i find https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt?musicid=6392458 but i get like this:
    //  {
    //         "@type": "MusicRecording",
    //         "position": 3,
    //         "name": "03 - Não Me Perdoei - Natanzinho Lima",
    //         "url": "https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt?musicid=63924591",
    //         "duration": ""
    //     }, where is also duration nothing
    final player = AudioPlayer();

    try {
      await player.setUrl(url);
      final duration = player.duration;

      if (duration == null) return '0:00';

      final minutes = duration.inMinutes;
      final seconds = duration.inSeconds % 60;

      return '$minutes:${seconds.toString().padLeft(2, '0')}';
    } catch (e) {
      return '0:00';
    } finally {
      await player.dispose();
    }
  }
}
