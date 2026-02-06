import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_parser/core/playlist_cubit/cubit/playlist_cubit.dart';
import 'package:music_parser/core/playlist_cubit/service/playlist_service.dart';
import 'package:music_parser/feature.dart';
import 'package:music_parser/go_route/go_route.dart';
import 'package:music_parser/presentation/screens/scroll_screen.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
  final arrays = [-5, 10, 12, -10, 0, 1, 20, 20];//10
  print(thirdLargest(arrays));
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
      child: MaterialApp(home: ScrollScreen(),),
    );
  }
}
