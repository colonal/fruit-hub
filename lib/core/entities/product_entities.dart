import 'dart:io';

import 'review_entity.dart';

class ProductEntities {
  final String name;
  final String description;
  final num price;
  final String code;
  final bool isFeatured;
  final File image;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingCount;
  final List<ReviewEntity> reviews;

  ProductEntities({
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.isFeatured,
    required this.image,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    this.isOrganic = false,
    this.avgRating = 0,
    this.ratingCount = 0,
    this.imageUrl,
  });
}
