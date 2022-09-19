class CommentsModel {
  final String image;
  final String name;
  final String time;
  final String comment;
  final int numberOfReplies;
  CommentsModel({
    required this.image,
    required this.name,
    required this.time,
    required this.comment,
    required this.numberOfReplies,
  });
}
