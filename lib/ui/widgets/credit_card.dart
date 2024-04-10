import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/converting.dart';
import 'package:onyx_ui/utils/extensions/figma_height.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

class CreditCard extends StatelessWidget {
  const CreditCard(
      {super.key,
      required this.cardNumber,
      required this.isSelected,
      this.onTap});
  final int cardNumber;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: 116,
        height: 80,
        decoration: isSelected == true
            ? BoxDecoration(
                borderRadius: allCircularRadius12,
                border: Border.all(
                    color: AppColors.colorPrimaryBlue,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignInside))
            : const BoxDecoration(),
        child: Center(
            child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 64,
              width: 100,
              decoration: roundedBoxDecoration.copyWith(
                color: isSelected == true
                    ? AppColors.colorGray0
                    : AppColors.colorPrimaryBlue,
                borderRadius: BorderRadius.all(
                    Radius.circular(isSelected == true ? 4 : 6)),
              ),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    left: isSelected == true ? -77.6 : -82,
                    child: Transform.rotate(
                      angle: 79.8,
                      child: Container(
                          clipBehavior: Clip.hardEdge,
                          width: 135.67,
                          height: 106.14,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: isSelected == true
                                    ? const [
                                        Color(0xff272F3E),
                                        Color(0xff242B3A)
                                      ]
                                    : const [
                                        Color(0xff4744CB),
                                        Color(0xff2926B4)
                                      ]),
                            color: isSelected == true
                                ? const Color.fromARGB(180, 39, 47, 62)
                                : const Color.fromRGBO(71, 68, 203, 1),
                          )),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    bottom: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Converting.formatCardNumber(cardNumber),
                            style: AppTextStyle.w500s14.copyWith(
                                fontSize: 11,
                                height: 13.0.toFigmaHeight(11),
                                color: AppColors.colorWhite)),
                        SvgPicture.asset(
                          AppImages.masterCard,
                          height: 12,
                          width: 19,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
