import 'package:onyx_ui/model/news_card_model.dart';

final now = DateTime.now();
const Duration week = Duration(days: 7);
const Duration day1 = Duration(days: 1);
const Duration hours5 = Duration(hours: 5);
const Duration minutes59 = Duration(minutes: 59);
const Duration minutes60 = Duration(minutes: 60);
const Duration seconds30 = Duration(seconds: 30);
const Duration hours23 = Duration(hours: 23);
List<NewsCardModel> newsData = [
  NewsCardModel(
      commentsCount: 17,
      likesCount: 6,
      desc:
          "Многие из тех, кто до этого взял ипотеку, сейчас задумались о том, чтобы сократить платеж по кредиту. Доходы заемщиков упали, и та нагрузка, которая раньше была вполне посильной, сейчас стала обременительной.",
      newsDate: now.subtract(week),
      title: 'Наконец понизили годовой процент по выплатам',
      img:
          'https://image-uniservice.linternaute.com/image/450/4/1139013199/2546478.jpg',
      isLiked: true),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc:
        "Многие из тех, кто до этого взял ипотеку, сейчас задумались о том, чтобы сократить платеж по кредиту. Доходы заемщиков упали, и та нагрузка, которая раньше была вполне посильной, сейчас стала обременительной.",
    newsDate: now.subtract(day1),
    title: 'Наконец понизили годовой процент по выплатам',
    img:
        "https://th.bing.com/th/id/R.805b3b2cc9d25edde0cf7ccf3e678a8d?rik=J%2bZy%2bcv0GXcLJQ&pid=ImgRaw&r=0",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc:
        "Многие из тех, кто до этого взял ипотеку, сейчас задумались о том, чтобы сократить платеж по кредиту. Доходы заемщиков упали, и та нагрузка, которая раньше была вполне посильной, сейчас стала обременительной.",
    newsDate: now.subtract(minutes60),
    title: 'Наконец понизили годовой процент по выплатам',
    img: 'https://s0.rbk.ru/v6_top_pics/media/img/5/22/756176080290225.jpg',
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc:
        "Многие из тех, кто до этого взял ипотеку, сейчас задумались о том, чтобы сократить платеж по кредиту. Доходы заемщиков упали, и та нагрузка, которая раньше была вполне посильной, сейчас стала обременительной.",
    newsDate: now.subtract(hours5),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(week + week),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(week + week + week),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now,
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(seconds30),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(minutes59),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(week + week + week + week + week + week),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(week * 70),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(week + week + week + week + week + week),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(week * 70),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(week + week + week + week + week + week),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(week * 70),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(week + week + week + week + week + week),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(week * 70),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(week + week + week + week + week + week),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(week * 70),
    title: 'Наконец понизили годовой процент по выплатам',
    img: "https://cool-zero.ru/wp-content/uploads/2021/04/Zas_network.jpg",
    isLiked: false,
  ),
  NewsCardModel(
    commentsCount: 17,
    likesCount: 6,
    desc: "Многие из тех, кто до этого взял ипотеку.",
    newsDate: now.subtract(seconds30 * 3),
    title: 'Наконец понизили годовой процент по выплатам',
    img:
        "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1gmJsi.img?w=1920&h=1080&q=60&m=2&f=jpg",
    isLiked: false,
  ),
];
