class SubscriptionPlanDto {
  final int id;
  final String title;
  final String subtitle;
  final String price;
  final String? badge;

  SubscriptionPlanDto({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    this.badge,
  });

  factory SubscriptionPlanDto.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanDto(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      price: json['price'],
      badge: json['badge'],
    );
  }
}
