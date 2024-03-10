import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/pages/news_page/data.dart';
import 'package:onyx_ui/ui/pages/news_page/widgets/news_card.dart';
import 'package:onyx_ui/ui/widgets/custom_app_bar.dart';
import 'package:onyx_ui/ui/widgets/drawer_menu.dart';
import 'package:onyx_ui/ui/widgets/splash_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key, this.routeState});
  final GoRouterState? routeState;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ValueNotifier position = ValueNotifier(0);
  final globalKey = GlobalKey<ScaffoldState>();

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
                  child: CustomScrollView(
                slivers: [
                  SliverList.builder(
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          model: news[index],
                        );
                      }),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
