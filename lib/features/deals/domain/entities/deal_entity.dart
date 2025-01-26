class Deal {
  final String id;
  final String title;
  final double price;

  final String? thumbnail;
  final double? rating;
  final DateTime? releaseDate;
  final String? metacriticLink;

  final bool isLiked;

  const Deal({
    required this.id,
    required this.title,
    required this.price,
    this.thumbnail,
    this.rating,
    this.releaseDate,
    this.metacriticLink,
    this.isLiked = false,
  });

  Deal copyWith({
    String? id,
    String? title,
    double? price,
    String? thumbnail,
    double? rating,
    DateTime? releaseDate,
    String? metacriticLink,
    bool? isLiked,
  }) {
    return Deal(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      thumbnail: thumbnail ?? this.thumbnail,
      rating: rating ?? this.rating,
      releaseDate: releaseDate ?? this.releaseDate,
      metacriticLink: metacriticLink ?? this.metacriticLink,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
