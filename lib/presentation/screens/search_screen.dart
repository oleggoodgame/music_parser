import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:music_parser/core/playlist_cubit/cubit/playlist_cubit.dart';
import 'package:music_parser/core/playlist_cubit/state/playlist_state.dart';
import 'package:music_parser/presentation/widgets/text_control_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _urlController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController();
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<PlaylistCubit, PlaylistState>(
        listener: (context, state) {
          if (state is PlaylistResult) {
            context.push('/playlist_screen', extra: state.playlist);
          }
        },
        child: BlocBuilder<PlaylistCubit, PlaylistState>(
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    TextControllerWidget(
                      controller: _urlController,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Please enter a URL';
                        }
                        if (!v.contains("http") ||
                            !v.contains("suamusica.com.br")) {
                          return 'Please enter a valid URL from suamusica.com.br';
                        }

                        try {
                          final nextUrl = buildNextDataUrl(v);
                          print("NextDataUrl: $nextUrl");
                        } catch (e) {
                          return 'Invalid Suamusica URL structure';
                        }

                        return null;
                      },
                      label: 'Enter Suamusica Playlist URL',
                      hint:
                          'Like thishttps://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt',
                    ),

                    const SizedBox(height: 12),

                    ElevatedButton(
                      onPressed: state is PlaylistLoading
                          ? null
                          : () {
                              if (!_formKey.currentState!.validate()) return;
                              final nextUrl = buildNextDataUrl(
                                _urlController.text,
                              );
                              context.read<PlaylistCubit>().fetchPlaylist(
                                nextUrl,
                              );
                            },
                      child: state is PlaylistLoading
                          ? const CircularProgressIndicator()
                          : const Text('Fetch Playlist'),
                    ),

                    const SizedBox(height: 12),

                    if (state is PlaylistError)
                      Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String buildNextDataUrl(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;

    if (segments.length < 2) {
      throw Exception('Invalid Suamusica URL');
    }

    final artist = segments[segments.length - 2];
    final slug = segments.last;

    return 'https://suamusica.com.br/_next/data/webid-1111/pt-BR/$artist/$slug.json';
  }
}
