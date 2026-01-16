import 'package:music_parser/data/entity/playlist_entity.dart';

abstract class PlaylistState {}

class PlaylistInitial extends PlaylistState {}

class PlaylistLoading extends PlaylistState {}

class PlaylistResult extends PlaylistState {
  final PlaylistEntity playlist;

  PlaylistResult(this.playlist);
}

class PlaylistError extends PlaylistState {
  final String message;

  PlaylistError(this.message);
}
