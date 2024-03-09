import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/l10n/l10n.dart';
import 'package:onyx_ui/modules/signal_service/river/river.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/widgets/custom_radio_list_tile_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/extensions/media_query.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenConsumerState();
}

class _SplashScreenConsumerState extends ConsumerState<SplashScreen> {
  ValueNotifier<bool> isRusLang = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.go('/auth');
          },
          child: Padding(
            padding: kPH21,
            child: Column(
              children: [
                context.height <= 610 ? kSBH45 : kSBH96,
                Center(
                    child: SizedBox(
                        height: 47, child: SvgPicture.asset(AppImages.onyx))),
                Text('payments', style: AppTextStyle.w600s39point47),
                kSBH10,
                Text('Управляйте вашим долгом!',
                    style: AppTextStyle.w800s14point45),
                kSBH5dot28,
                Text('Қарызыңызды басқарыныз!',
                    style: AppTextStyle.w800s12point93fSF),
                context.height <= 610 ? kSBH25 : kSBH60dot36,
                Text(
                  context.localization.noPercentage,
                  style: AppTextStyle.w600s16,
                  textAlign: TextAlign.center,
                ),
                kSBH10,
                Text(context.localization.discount,
                    style: AppTextStyle.w600s16),
                const Spacer(),
                ValueListenableBuilder(
                    valueListenable: isRusLang,
                    builder: (context, v, c) {
                      return Column(
                        children:
                            List.generate(math.max(0, 2 * 2 - 1), (index) {
                          if (index.isEven) {
                            final int itemIndex = index ~/ 2;
                            return CustomRadioListTileButton(
                              titleStyle: itemIndex == 1
                                  ? AppTextStyle.w500s16fSF
                                  : null,
                              title: languages[itemIndex],
                              isSelected: itemIndex == 0 ? v : !v,
                              onTap: () {
                                if (index == 0) {
                                  if (v == false) {
                                    isRusLang.value = true;
                                    ref
                                        .read(River.settingsPod.notifier)
                                        .setLocale(L10n.all[itemIndex]);
                                  }
                                } else {
                                  if (v == true) {
                                    isRusLang.value = false;
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
                      );
                    }),
                context.height <= 610 ? kSBH50 : kSBH99,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
