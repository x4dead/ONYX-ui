﻿import 'package:flutter/material.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
// import 'package:qaz_booking_ui/themes/colors/app_colors.dart';

class SplashButton extends StatelessWidget {
  const SplashButton({super.key, this.onTap, this.child, this.clipBehavior});
  final VoidCallback? onTap;
  final Widget? child;
  final Clip? clipBehavior;
  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: clipBehavior ?? Clip.none,
      color: AppColors.colorTransparent,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
