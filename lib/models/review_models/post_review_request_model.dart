class PostReviewRequestModel {
  final String content;
  final String forId;
  final bool isAnonymous;
  final int rating;

  PostReviewRequestModel({
    required this.content,
    required this.forId,
    required this.isAnonymous,
    required this.rating,
  });
}
