class Deal {
  final String id;
  final String title;
  final double price;
  
  final String? thumbnail;
  final double? rating;
  final DateTime? releaseDate;
  final String? metacriticLink;

  const Deal({
    required this.id,
    required this.title,
    required this.price,
    this.thumbnail,
    this.rating,
    this.releaseDate,
    this.metacriticLink,
  });
}
