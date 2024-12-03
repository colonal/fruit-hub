import 'dart:io';

import 'package:e_commerce_app/core/entities/product_entities.dart';

import '../entities/review_entity.dart';

ProductEntities getDummyProduct() {
  return ProductEntities(
    name: 'Organic Apple',
    description: 'Fresh and organic apples from local farms.',
    price: 1.99,
    code: 'ORG-APPLE-001',
    isFeatured: true,
    image: File('path/to/image.jpg'),
    expirationMonths: 6,
    numberOfCalories: 52,
    unitAmount: 1,
    reviews: getDummyReviews(),
    isOrganic: true,
    avgRating: 4.75,
    ratingCount: 2,
    imageUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/016/940/260/small_2x/apple-fruit-isolated-on-white-background-photo.jpg',
  );
}

List<ReviewEntity> getDummyReviews() {
  List<ReviewEntity> reviews = [
    ReviewEntity(
      name: 'John Doe',
      image: 'path/to/image1.jpg',
      ratting: '4.5',
      date: '2024-12-01',
      reviewDescription: 4.5,
    ),
    ReviewEntity(
      name: 'Jane Smith',
      image: 'path/to/image2.jpg',
      ratting: '5.0',
      date: '2024-12-02',
      reviewDescription: 5.0,
    ),
  ];
  return reviews;
}

List<ProductEntities> getDummyProducts() {
  return List.generate(10, (_) => getDummyProduct());
}
