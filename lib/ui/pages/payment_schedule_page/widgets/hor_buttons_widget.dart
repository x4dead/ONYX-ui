import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/widgets/splash_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

class HorButtonsWidget extends StatelessWidget {
  const HorButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    context.localization;
    return Row(
        children: List.generate((2 * 2) - 1, (index) {
      if (index.isEven) {
        final itemIndex = index ~/ 2;
        final buttons = [
          (AppImages.wallet, localization.earlyRepayment),
          (AppImages.document, localization.accountDetails)
        ];
        return Flexible(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.colorGray80,
                borderRadius: allCircularRadius12),
            clipBehavior: Clip.hardEdge,
            child: SplashButton(
              onTap: () {},
              child: Padding(
                padding: kPV12R12.copyWith(right: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      buttons[itemIndex].$1,
                      colorFilter: const ColorFilter.mode(
                          AppColors.colorGray0, BlendMode.srcIn),
                    ),
                    kSBH5,
                    Text(
                      buttons[itemIndex].$2,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.w500s15
                          .copyWith(color: AppColors.colorGray0),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
      return kSBW15;
    }));
  }
}
