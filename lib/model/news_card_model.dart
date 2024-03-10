import 'dart:convert';

class NewsCardModel {
  final String? img;
  final String? title;
  final String? desc;
  final int? likesCount;
  final int? commentsCount;
  final DateTime? newsDate;
  final bool? isLiked;

  NewsCardModel({
    this.img,
    this.title,
    this.desc,
    this.likesCount,
    this.commentsCount,
    this.newsDate,
    this.isLiked,
  });

  NewsCardModel copyWith({
    String? img,
    String? title,
    String? desc,
    int? likesCount,
    int? commentsCount,
    DateTime? newsDate,
    bool? isLiked,
  }) =>
      NewsCardModel(
        img: img ?? this.img,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        likesCount: likesCount ?? this.likesCount,
        commentsCount: commentsCount ?? this.commentsCount,
        newsDate: newsDate ?? this.newsDate,
        isLiked: isLiked ?? this.isLiked,
      );

  factory NewsCardModel.fromJson(String str) =>
      NewsCardModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsCardModel.fromMap(Map<String, dynamic> json) => NewsCardModel(
        img: json["img"],
        title: json["title"],
        desc: json["desc"],
        likesCount: json["likesCount"],
        commentsCount: json["commentsCount"],
        newsDate: json["news_date"] == null
            ? null
            : DateTime.parse(json["news_date"]),
        isLiked: json['is_liked'],
      );

  Map<String, dynamic> toMap() => {
        "img": img,
        "title": title,
        "desc": desc,
        "likesCount": likesCount,
        "commentsCount": commentsCount,
        "news_date": newsDate?.toIso8601String(),
        "is_liked": isLiked,
      };
}
