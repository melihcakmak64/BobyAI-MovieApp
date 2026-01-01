class MovieDto {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final double rating;

  MovieDto({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.rating,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      id: json['movie_id'],
      title: json['movie_title'],
      overview: json['movie_description'],
      posterPath: json['poster_url'],
      rating: (json['rating_score'] as num).toDouble(),
    );
  }
}
