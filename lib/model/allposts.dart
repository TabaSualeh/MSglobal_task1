import 'dart:convert';

List<PostsAll> postsAllFromJson(String str) =>
    List<PostsAll>.from(json.decode(str).map((x) => PostsAll.fromJson(x)));

String postsAllToJson(List<PostsAll> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsAll {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostsAll({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostsAll.fromJson(Map<String, dynamic> json) => PostsAll(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
