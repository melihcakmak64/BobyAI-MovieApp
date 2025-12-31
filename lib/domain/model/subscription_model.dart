class SubscriptionPlan {
  final int id;
  final String title;
  final String subtitle;
  final String price;
  final String? badge;
  final List<int> featureIds;

  SubscriptionPlan({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    this.badge,
    required this.featureIds,
  });
}

class AppFeature {
  final int id;
  final String name;
  final bool isAvailableInFree;

  AppFeature({
    required this.id,
    required this.name,
    this.isAvailableInFree = false,
  });
}
