import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/widgets/splash_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.action,
  });
  final String? title;
  final (Widget?, VoidCallback?)? leading;
  final (Widget, VoidCallback)? action;
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        width: double.infinity,
        padding: kPH20V12,
        alignment: Alignment.bottomCenter,
        // decoration: const BoxDecoration(
        // border: Border(
        //     bottom: BorderSide(
        //         width: 1,
        //         style: BorderStyle.solid,
        //         color: AppColors.colorLightGray)
        //         )
        // ),
        child: SizedBox(
          width: double.infinity,
          height: 36,
          child: Stack(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 36,
                child: IconButton(
                    onPressed: leading?.$2 ??
                        () {
                          context.pop();
                        },
                    icon: leading?.$1 ??
                        SvgPicture.asset(
                          AppImages.arrowLeft,
                          colorFilter: const ColorFilter.mode(
                              AppColors.colorGray0, BlendMode.srcIn),
                        )),
              ),
            ),
            Align(
              child: Text(
                title ?? context.localization.goIn,
                style: AppTextStyle.w600s20,
              ),
            ),
            if (action?.$1 != null)
              Align(
                  alignment: Alignment.centerRight,
                  child: SplashButton(onTap: action?.$2, child: action!.$1))
          ]),
        ),
      ),
    );
  }
}
