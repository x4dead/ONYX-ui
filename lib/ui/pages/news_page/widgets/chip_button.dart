import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

class ChipButton extends StatelessWidget {
  const ChipButton(
      {super.key,
      this.onTap,
      this.icon,
      this.bgColor = AppColors.colorGray80,
      this.highlightColor,
      this.text});
  final VoidCallback? onTap;
  final (String?, Color?)? icon;
  final Color? bgColor;
  final Color? highlightColor;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onTap ?? () {},
        style: IconButton.styleFrom(
            padding: kPZero,
            side: BorderSide.none,
            backgroundColor: bgColor,
            highlightColor:
                highlightColor ?? AppColors.colorGray20.withOpacity(0.1)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon?.$1 ?? AppImages.comment,
                colorFilter: ColorFilter.mode(
                    icon?.$2 ?? AppColors.colorGray20, BlendMode.srcIn),
              ),
              if (text != null) ...[
                kSBW6,
                Text(
                  text!,
                  style: AppTextStyle.w500s16
                      .copyWith(color: icon?.$2 ?? AppColors.colorGray20),
                )
              ],
            ],
          ),
        ));
  }
}
