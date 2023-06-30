import 'package:equatable/equatable.dart';

import '../../domain/entities/movie_entity.dart';

enum MoviesCubitStateStatus { loading, loaded, error }

class MoviesCubitState extends Equatable {
  const MoviesCubitState({
    required this.status,
    this.moviesList = const [],
    this.onRefetchPressed = false,
    this.error,
  });

  final MoviesCubitStateStatus status;
  final List<MovieEntity> moviesList;
  final bool onRefetchPressed;
  final String? error;

  MoviesCubitState copyWith({
    MoviesCubitStateStatus? status,
    List<MovieEntity>? moviesList,
    bool? onRefetchPressed,
    String? error,
  }) {
    return MoviesCubitState(
      status: status ?? this.status,
      moviesList: moviesList ?? this.moviesList,
      onRefetchPressed: onRefetchPressed ?? this.onRefetchPressed,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        DateTime.now(),
      ];
}
