import 'package:flutter/cupertino.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/widgets/splash_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';

class CustomRadioListTileButton extends StatelessWidget {
  const CustomRadioListTileButton(
      {super.key,
      this.isSelected = false,
      required this.title,
      this.onTap,
      this.titleStyle,
      this.padding,
      this.isLeadingOnCenter = true,
      this.isSelectedIconFill = true,
      this.bgColor});
  final bool? isSelected;
  final bool? isSelectedIconFill;
  final bool? isLeadingOnCenter;
  final String title;
  final TextStyle? titleStyle;
  final VoidCallback? onTap;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: roundedBoxDecoration.copyWith(
          color: bgColor ?? AppColors.colorGray80),
      child: SplashButton(
        onTap: onTap ?? () {},
        child: Padding(
          padding: padding ?? kPH24V18,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: isLeadingOnCenter == true
                      ? Alignment.center
                      : Alignment.topCenter,
                  child: Visibility(
                    visible: isSelected!,
                    replacement: const Icon(
                      CupertinoIcons.circle,
                      color: AppColors.colorGray0,
                    ),
                    child: Icon(
                      isSelectedIconFill == true
                          ? CupertinoIcons.checkmark_alt_circle_fill
                          : CupertinoIcons.checkmark_alt_circle,
                      color: AppColors.colorPrimaryBlue,
                    ),
                  ),
                ),
                kSBW14,
                Flexible(
                  child: Text(
                    title,
                    style: titleStyle ??
                        AppTextStyle.w500s16
                            .copyWith(color: AppColors.colorGray0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
