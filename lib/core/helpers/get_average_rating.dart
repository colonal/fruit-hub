import '../models/review_mode.dart';

num getAverageRating(List<ReviewMode> reviews) {
  var sum = 0.0;
  for (var review in reviews) {
    sum += review.ratting;
  }

  return sum / reviews.length;
}
