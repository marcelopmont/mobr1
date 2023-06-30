import 'package:flutter/material.dart';
import 'components/movies_list_cell.dart';

import '../../domain/entities/movie_entity.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({
    super.key,
    required this.onRefreshPressed,
    required this.onBackPressed,
    required this.moviesList,
  });

  final VoidCallback onRefreshPressed;
  final VoidCallback onBackPressed;
  final List<MovieEntity> moviesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: onBackPressed,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          ElevatedButton(
            onPressed: onRefreshPressed,
            child: const Text('refresh'),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: moviesList.length,
              padding: const EdgeInsets.all(16),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final movie = moviesList[index];
                return MoviesListCell(
                  movie: movie,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
