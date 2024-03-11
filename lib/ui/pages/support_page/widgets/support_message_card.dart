import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/widgets/splash_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

class SupportMessageCard extends StatelessWidget {
  const SupportMessageCard({super.key, required this.info, this.onTap});
  final (String, String, Gradient) info;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return SplashButton(
      onTap: onTap ?? () {},
      child: Container(
          padding: kPV12R12,
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.colorGray80, width: 1))),
          child: Row(
            children: [
              Container(
                  height: 50,
                  width: 50,
                  padding: kPAll10,
                  decoration: BoxDecoration(
                      gradient: info.$3,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(14))),
                  child: SvgPicture.asset(info.$1)),
              kSBW12,
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  info.$2,
                  style: AppTextStyle.w600s15.copyWith(
                    color: AppColors.colorBlack,
                  ),
                ),
              ),
              SvgPicture.asset(AppImages.whatsApp),
              kSBW12,
            ],
          )),
    );
  }
}
