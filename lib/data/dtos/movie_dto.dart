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
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      rating: (json['vote_average'] as num).toDouble(),
    );
  }
}
