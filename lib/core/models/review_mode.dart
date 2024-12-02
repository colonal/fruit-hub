import '../entities/review_entity.dart';

class ReviewMode {
  final String name;
  final String image;
  final String ratting;
  final String date;
  final double reviewDescription;
  ReviewMode({
    required this.name,
    required this.image,
    required this.ratting,
    required this.date,
    required this.reviewDescription,
  });

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      ratting: ratting,
      date: date,
      reviewDescription: reviewDescription,
    );
  }

  factory ReviewMode.fromJson(Map<String, dynamic> json) {
    return ReviewMode(
      name: json['name'],
      image: json['image'],
      ratting: json['ratting'],
      date: json['date'],
      reviewDescription: json['reviewDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['ratting'] = ratting;
    data['date'] = date;
    data['reviewDescription'] = reviewDescription;
    return data;
  }
}
