import 'package:flutter/material.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onTap,
    this.buttonText = '',
    this.bgColor = AppColors.colorPrimaryBlue,
    this.width = double.infinity,
    this.height = 56,
    this.borderColor = AppColors.colorPrimaryBlue,
    this.textColor = AppColors.colorWhite,
    this.isOutlinedButton = false,
    this.highlightColor,
    this.child,
  })  : assert(child != null ? buttonText == '' : true,
            "buttonText must be empty if child has widget"),
        assert(buttonText != '' ? child == null : true,
            " child must be null if buttonText has text"),
        super(key: key);
  final VoidCallback? onTap;
  final Widget? child;
  final String? buttonText;
  final Color? bgColor;
  final Color? textColor;
  final Color? highlightColor;
  final double? width;
  final double? height;
  final bool? isOutlinedButton;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: IconButton.styleFrom(
          highlightColor: isOutlinedButton == true
              ? highlightColor ?? AppColors.colorPrimaryBlue.withOpacity(0.2)
              : highlightColor ?? AppColors.colorWhite.withOpacity(0.15),
          shape:
              const RoundedRectangleBorder(borderRadius: allCircularRadius12),
          backgroundColor: bgColor!,
          elevation: 0,
          fixedSize: Size(width!, height!),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18.5),
          side: isOutlinedButton == true
              ? BorderSide(
                  color: borderColor ?? AppColors.colorPrimaryBlue,
                  width: 2,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside)
              : BorderSide.none),
      onPressed: onTap ?? () {},
      child: Center(
        child: child ??
            Text(
              buttonText!,
              textAlign: TextAlign.center,
              style: AppTextStyle.w500s16.copyWith(color: textColor!),
            ),
      ),
    );
  }
}
