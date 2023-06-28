class Movie {
  const Movie({
    required this.title,
    required this.overview,
    required this.image,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    title: json['title'],
    overview: json['overview'],
    image: json['poster_path'],
  );

  final String title;
  final String overview;
  final String? image;
}