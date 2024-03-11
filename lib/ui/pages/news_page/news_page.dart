import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/model/news_card_model.dart';
import 'package:onyx_ui/modules/signal_service/river/river.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/pages/news_page/widgets/news_card.dart';
import 'package:onyx_ui/ui/widgets/custom_app_bar.dart';
import 'package:onyx_ui/ui/widgets/drawer_menu.dart';
import 'package:onyx_ui/ui/widgets/splash_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

final getNews = FutureProvider<List<NewsCardModel>>(
    (ref) async => await ref.read(River.newsPod.notifier).getNews());

class NewsPage extends ConsumerStatefulWidget {
  const NewsPage({super.key, this.routeState});
  final GoRouterState? routeState;

  @override
  ConsumerState<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends ConsumerState<NewsPage> {
  final globalKey = GlobalKey<ScaffoldState>();
  int offset = 0;
  final isLoading = StateProvider<bool>((ref) => false);
  late ScrollController scrollController;
  final int limit = 10;
  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()..addListener(scrollLimit);
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollLimit);
    scrollController.dispose();
    super.dispose();
  }

  Future<void> scrollLimit() async {
    if (scrollController.position.extentAfter < 50 &&
        ref.watch(isLoading) != true) {
      ref.read(isLoading.notifier).state = true;
      offset += limit;
      try {
        await ref.read(River.newsPod.notifier).getNewNews(offset);
      } catch (e) {}

      ref.read(isLoading.notifier).state = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    return Scaffold(
      key: globalKey,
      resizeToAvoidBottomInset: false,
      drawer: DrawerMenu(routeState: widget.routeState),
      backgroundColor: AppColors.colorWhite,
      appBar: CustomAppBar(title: localization.news, leading: (
        SvgPicture.asset(AppImages.menu,
            colorFilter:
                const ColorFilter.mode(AppColors.colorGray0, BlendMode.srcIn)),
        () => globalKey.currentState?.openDrawer(),
      )),
      body: SafeArea(
        child: Padding(
          padding: kPH20,
          child: Column(
            children: [
              SizedBox(
                height: 66,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      borderRadius: allCircularRadius12,
                      color: AppColors.colorSearchCard,
                    ),
                    child: SplashButton(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppImages.search,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.colorGray0, BlendMode.srcIn),
                            ),
                            kSBW6,
                            Text(
                              localization.search,
                              style: AppTextStyle.w500s16
                                  .copyWith(color: AppColors.colorGray20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                  child: ref.watch(getNews).when(
                        skipLoadingOnRefresh: false,
                        // skipLoadingOnReload: false,
                        data: (data) {
                          List<NewsCardModel> _news =
                              ref.watch(River.newsPod).news ?? [];
                          if (_news.isEmpty) {
                            return Center(
                              child: Text(
                                'Пока что для вас у нас нету новостей',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.w600s15,
                              ),
                            );
                          }
                          return CustomScrollView(
                            controller: scrollController,
                            slivers: [
                              SliverList.builder(
                                  itemCount: _news.length,
                                  itemBuilder: (context, index) {
                                    return NewsCard(
                                      model: _news[index],
                                    );
                                  }),
                              if (ref.watch(isLoading) == true)
                                const SliverToBoxAdapter(
                                  child: Padding(
                                    padding: kPAll10,
                                    child: CupertinoActivityIndicator(),
                                  ),
                                )
                            ],
                          );
                        },
                        error: (error, stackTrace) {
                          return Center(
                            child: Text(
                              'Ошибка получения новостей',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.w600s15,
                            ),
                          );
                        },
                        loading: () {
                          return Center(child: CupertinoActivityIndicator());
                        },
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
