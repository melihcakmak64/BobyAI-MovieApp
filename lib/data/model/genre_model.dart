class GenreModel {
  final int id;
  final String name;

  GenreModel({required this.id, required this.name});

  static List<GenreModel> mockGenres = [
    GenreModel(id: 1, name: "Action"),
    GenreModel(id: 2, name: "Drama"),
    GenreModel(id: 3, name: "Comedy"),
    GenreModel(id: 4, name: "Sci-Fi"),
    GenreModel(id: 5, name: "Horror"),
    GenreModel(id: 6, name: "Romance"),
    GenreModel(id: 7, name: "Romance"),
    GenreModel(id: 8, name: "Romance"),
    GenreModel(id: 9, name: "Romance"),
    GenreModel(id: 10, name: "Romance"),
  ];
}
