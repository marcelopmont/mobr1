import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobr1/screens/movies/components/movies_list_cell.dart';

import 'model/movie.dart';

class MoviesScreen extends StatefulWidget {
  static const routeName = '/movies_screen';

  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  var moviesList = <Movie>[];
  var error = '';

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _showSnackBar() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          error.toString(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (error.isNotEmpty) {
      _showSnackBar();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.teal,
      body: moviesList.isNotEmpty
          ? ListView.separated(
              itemCount: moviesList.length,
              padding: const EdgeInsets.all(16),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final movie = moviesList[index];
                return MoviesListCell(
                  movie: movie,
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
    );
  }

  Future<void> _fetchMovies() async {
    try {
      final uri = Uri.parse('https://demo7206081.mockable.io/movies');
      final response = await Client().get(uri);

      final responseJson = jsonDecode(response.body);
      final moviesListJson = responseJson['results'];

      moviesList = moviesListJson
          .map<Movie>((movieJson) => Movie.fromJson(movieJson))
          .toList();

      setState(() {});
    } catch (error) {
      this.error = error.toString();
    }
  }
}
