import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

class CustomRadioListTileButton extends StatelessWidget {
  const CustomRadioListTileButton(
      {super.key,
      this.isSelected = false,
      required this.title,
      this.onTap,
      this.titleStyle});
  final bool? isSelected;
  final String title;
  final TextStyle? titleStyle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: kPH24V6,
      tileColor: AppColors.colorGray80,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(circleRadius12)),
      onTap: onTap ?? () {},
      horizontalTitleGap: 14,
      leading: isSelected == true
          ? SvgPicture.asset(
              AppImages.doneFill,
              colorFilter: const ColorFilter.mode(
                  AppColors.colorPrimaryBlue, BlendMode.srcIn),
            )
          : const Icon(
              CupertinoIcons.circle,
              color: AppColors.colorGray0,
            ),
      title: Text(
        title,
        style: titleStyle ??
            AppTextStyle.w500s16.copyWith(color: AppColors.colorGray0),
      ),
    );
  }
}
