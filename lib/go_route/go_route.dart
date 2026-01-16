import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:music_parser/data/entity/playlist_entity.dart';
import 'package:music_parser/presentation/screens/playlist_screen.dart';
import 'package:music_parser/presentation/screens/search_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/search',
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: '/search',
        builder: (context, state) {
          return SearchScreen();
        },
      ),
      GoRoute(
        path: '/playlist_screen',
        builder: (context, state) {
          final playlist = state.extra as PlaylistEntity;
          return PlaylistScreen(playlist: playlist);
        },
      ),
     
    ],
  );
});
