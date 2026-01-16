import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_parser/core/playlist_cubit/service/playlist_service.dart';
import 'package:music_parser/core/playlist_cubit/state/playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  final PlaylistScraperService service;

  PlaylistCubit(this.service) : super(PlaylistInitial());

  Future<void> fetchPlaylist(String url) async {
    if (url.isEmpty) {
      emit(PlaylistError('URL cannot be empty'));
      return;
    }

    emit(PlaylistLoading());

    try {
      final playlist = await service.fetchPlaylist(url);
      emit(PlaylistResult(playlist));
    } catch (e) {
      print(e.toString());
      emit(PlaylistError(e.toString()));
    }
  }
}
