class SubscriptionPlanDto {
  final int id;
  final String title;
  final String subtitle;
  final String price;
  final String? badge;
  final List<int> featureIds; 

  SubscriptionPlanDto({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    this.badge,
    required this.featureIds,
  });

  factory SubscriptionPlanDto.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanDto(
      id: json['id'] as int,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      price: json['price'] as String,
      badge: json['badge'] as String?,
      featureIds: List<int>.from(json['featureIds'] ?? []),
    );
  }
}