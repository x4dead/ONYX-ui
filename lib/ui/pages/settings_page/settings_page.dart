import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/l10n/l10n.dart';
import 'package:onyx_ui/modules/signal_service/river/river.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/pages/settings_page/widgets/settings_switcher.dart';
import 'package:onyx_ui/ui/widgets/custom_app_bar.dart';
import 'package:onyx_ui/ui/widgets/custom_radio_list_tile_button.dart';
import 'package:onyx_ui/ui/widgets/drawer_menu.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';
import 'dart:math' as math;

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key, this.routeState});
  final GoRouterState? routeState;

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageConsumerState();
}

class _SettingsPageConsumerState extends ConsumerState<SettingsPage> {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final titleStyle =
        AppTextStyle.w500s16.copyWith(color: AppColors.colorBlack);
    final localization = context.localization;
    final locale = ref.watch(River.settingsPod).locale;
    return Scaffold(
        key: globalKey,
        backgroundColor: AppColors.colorWhite,
        appBar: CustomAppBar(
          title: localization.settings,
          leading: (
            SvgPicture.asset(AppImages.menu),
            () => globalKey.currentState?.openDrawer(),
          ),
        ),
        drawer: DrawerMenu(routeState: widget.routeState),
        body: ListView(
          padding: kPH20V12,
          children: [
            Center(child: Text(localization.language, style: titleStyle)),
            kSBH12,
            Column(
              children: List.generate(math.max(0, 2 * 2 - 1), (index) {
                if (index.isEven) {
                  final int itemIndex = index ~/ 2;
                  return CustomRadioListTileButton(
                    titleStyle: itemIndex == 1 ? AppTextStyle.w500s16fSF : null,
                    title: languages[itemIndex],
                    isSelected: locale == (itemIndex == 0 ? 'ru' : 'kk'),
                    onTap: () {
                      if (index == 0) {
                        if (locale == 'kk') {
                          ref
                              .read(River.settingsPod.notifier)
                              .setLocale(L10n.all[itemIndex]);
                        }
                      } else {
                        if (locale == 'ru') {
                          ref
                              .read(River.settingsPod.notifier)
                              .setLocale(L10n.all[itemIndex]);
                        }
                      }
                    },
                  );
                }
                return kSBH10;
              }),
            ),
            kSBH32,
            Center(child: Text(localization.notification, style: titleStyle)),
            kSBH12,
            const SettingsSwitcher()
          ],
        ));
  }
}
