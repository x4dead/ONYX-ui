import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onyx_ui/model/news_card_model.dart';
import 'package:onyx_ui/ui/pages/news_page/data.dart';

import 'news_state_ref.dart';

class NewsNotifer extends StateNotifier<NewsStateRef> {
  NewsNotifer() : super(NewsStateRef());

  Future<List<NewsCardModel>> getNews() async {
    List<NewsCardModel> news = [];
    const offset = 0;
    try {
      await Future.delayed(const Duration(seconds: 3));

      ///TODO: Получение карточек новостей
      news = newsData.getRange(offset, 10).toList();
    } catch (e) {
      throw '$e';
    }

    state = state.copyWith(news: news);
    return news;
  }
}
