import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../model/movie.dart';
import 'movies_cubit_state.dart';

class MoviesCubit extends Cubit<MoviesCubitState> {
  MoviesCubit()
      : super(
          const MoviesCubitState(
            status: MoviesCubitStateStatus.loading,
          ),
        );

  void onInit() {
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    try {
      final uri = Uri.parse('https://demo7206081.mockable.io/movies');
      final response = await Client().get(uri);

      final responseJson = jsonDecode(response.body);
      final moviesListJson = responseJson['results'];

      final moviesList = moviesListJson
          .map<Movie>((movieJson) => Movie.fromJson(movieJson))
          .toList();

      emit(state.copyWith(
        status: MoviesCubitStateStatus.loaded,
        moviesList: moviesList,
      ));
    } catch (error) {
      emit(
        state.copyWith(
          status: MoviesCubitStateStatus.error,
          error: error.toString(),
        ),
      );
    }
  }
}

class MoviesCubitProvider extends BlocProvider<MoviesCubit> {
  MoviesCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
          key: key,
          create: (_) => MoviesCubit()..onInit(),
          child: child,
        );

  static MoviesCubit of(BuildContext context) =>
      BlocProvider.of<MoviesCubit>(context);
}
