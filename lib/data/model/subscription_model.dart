class SubscriptionPlan {
  final int id;
  final String title;
  final String subtitle;
  final String price;
  final String? badge;

  SubscriptionPlan({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    this.badge,
  });
}
