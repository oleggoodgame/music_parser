import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_parser/core/playlist_cubit/cubit/playlist_cubit.dart';
import 'package:music_parser/core/playlist_cubit/service/playlist_service.dart';
import 'package:music_parser/go_route/go_route.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PlaylistCubit(PlaylistScraperService())),
        // BlocProvider(create: (_) => SongCubit(SongService())),
      ],
      child: MaterialApp.router(routerConfig: router),
    );
  }
}
