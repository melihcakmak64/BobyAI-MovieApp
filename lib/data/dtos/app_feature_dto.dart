class AppFeatureDto {
  final int id;
  final String name;
  final bool isAvailableInFree;

  AppFeatureDto({
    required this.id,
    required this.name,
    required this.isAvailableInFree,
  });

  factory AppFeatureDto.fromJson(Map<String, dynamic> json) {
    return AppFeatureDto(
      id: json['id'] as int,
      name: json['name'] as String,
      isAvailableInFree: json['isAvailableInFree'] as bool? ?? false,
    );
  }
}