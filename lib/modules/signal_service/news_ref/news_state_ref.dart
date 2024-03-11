import 'package:onyx_ui/model/news_card_model.dart';

class NewsStateRef {
  final List<NewsCardModel>? news;

  NewsStateRef({this.news});

  NewsStateRef copyWith({
    List<NewsCardModel>? news,
  }) {
    return NewsStateRef(
      news: news ?? this.news,
    );
  }
}
