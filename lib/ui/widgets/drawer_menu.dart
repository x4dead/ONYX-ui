import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/widgets/splash_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/extensions/converting.dart';
import 'package:onyx_ui/utils/extensions/figma_height.dart';
import 'package:onyx_ui/utils/extensions/media_query.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key, this.routeState});
  final GoRouterState? routeState;
  @override
  Widget build(BuildContext context) {
    void goToPage(String pageName) {
      if (routeState?.path == '/$pageName') {
        context.pop();
      } else {
        context.go('/$pageName');
      }
    }

    final localization = context.localization;
    final List<(String, String)> menuButtons = [
      (AppImages.wallet, localization.debt),
      (AppImages.list, localization.paymentSchedule),
      (AppImages.news, localization.news),
      (AppImages.support, localization.support),
      (AppImages.settings, localization.settings),
    ];
    final infoStyle = AppTextStyle.w500s14.copyWith(
        height: 10.0.toFigmaHeight(14),
        letterSpacing: -0.3,
        color: AppColors.colorGray20);
    return Container(
      width: 268,
      height: double.infinity,
      color: AppColors.colorWhite,
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: kPAll20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.colorPrimaryBlue,
                  radius: 30,
                  child: Center(
                    child: Text(
                      Converting.getShortUserName(

                          // firstAndLastName: ('Антон', "Сенкевич"),
                          fullName: 'Антон Сенкевич'),
                      textAlign: TextAlign.center,
                      style: AppTextStyle.w600s24.copyWith(
                        color: AppColors.colorWhite,
                        height: 17.0.toFigmaHeight(24),
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ),
                kSBH15,
                SelectableText('Антон Сенкевич',
                    style: AppTextStyle.w500s18.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.colorBlack,
                        height: 13.0.toFigmaHeight(18))),
                kSBH13,
                SelectableText(
                  Converting.formatPhoneNumber('7773058880'),
                  style: AppTextStyle.w500s14.copyWith(
                      height: 10.0.toFigmaHeight(14),
                      color: AppColors.colorGray20),
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: ListView.custom(
                      childrenDelegate: SliverChildBuilderDelegate(
                        childCount: menuButtons.length,
                        (context, index) => _MenuButton(
                            () => switch (index) {
                                  0 => {goToPage('main')},
                                  1 => {goToPage('payment_schedule')},
                                  2 => {goToPage('news')},
                                  3 => {goToPage('support')},
                                  4 => {goToPage('settings')},
                                  _ => null,
                                },
                            (menuButtons[index].$1, menuButtons[index].$2)),
                      ),
                    ),
                  ),
                ),
                context.height <= 550 ? kSBH15 : kSBH25,
                _MenuButton(() {
                  goToPage('auth');
                }, (AppImages.outLeft, localization.signOut)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: kPH20V12.copyWith(bottom: 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText('Mozz Studio', style: infoStyle),
                  kSBH10,
                  SelectableText('${localization.version} 4.11.7',
                      style: infoStyle),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton(this.onTap, this.buttonInfo);
  final VoidCallback onTap;
  final (String, String) buttonInfo;
  @override
  Widget build(BuildContext context) {
    return SplashButton(
      onTap: onTap,
      child: Container(
        padding: kPH20,
        height: 60,
        child: Row(
          children: [
            SvgPicture.asset(buttonInfo.$1),
            kSBW10,
            Text(
              buttonInfo.$2,
              style: AppTextStyle.w500s18.copyWith(
                  color: AppColors.colorBlack, height: 13.0.toFigmaHeight(18)),
            )
          ],
        ),
      ),
    );
  }
}
