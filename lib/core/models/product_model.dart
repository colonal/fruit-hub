import 'dart:io';

import '../entities/product_entities.dart';
import '../helpers/get_average_rating.dart';
import 'review_mode.dart';

class ProductModel {
  final String name;
  final String description;
  final num price;
  final String code;
  final bool isFeatured;

  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingCount;
  final int sellingCount;
  final List<ReviewMode> reviews;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.isFeatured,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    required this.sellingCount,
    this.isOrganic = false,
    this.avgRating = 0,
    this.ratingCount = 0,
    this.imageUrl,
  });
  ProductEntities toEntities() {
    return ProductEntities(
      name: name,
      description: description,
      price: price,
      code: code,
      isFeatured: isFeatured,
      image: File(''),
      imageUrl: imageUrl,
      expirationMonths: expirationMonths,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      avgRating: avgRating,
      ratingCount: ratingCount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as num,
      code: map['code'] as String,
      isFeatured: map['isFeatured'] as bool,
      imageUrl: map['imageUrl'] as String,
      expirationMonths: map['expirationMonths'] as int,
      isOrganic: map['isOrganic'] as bool,
      numberOfCalories: map['numberOfCalories'] as int,
      unitAmount: map['unitAmount'] as int,
      avgRating: getAverageRating(List<ReviewMode>.from(
          map['reviews']?.map((x) => ReviewMode.fromJson(x)))),
      ratingCount: map['ratingCount'] as num,
      sellingCount: map['sellingCount'] as int,
      reviews: List<ReviewMode>.from(
          map['reviews']?.map((x) => ReviewMode.fromJson(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "code": code,
      "isFeatured": isFeatured,
      "imageUrl": imageUrl,
      "expirationMonths": expirationMonths,
      "isOrganic": isOrganic,
      "numberOfCalories": numberOfCalories,
      "unitAmount": unitAmount,
      "avgRating": avgRating,
      "ratingCount": ratingCount,
      "sellingCount": sellingCount,
      "reviews": reviews.map((e) => e.toJson()).toList(),
    };
  }
}
