part of '../payment_page.dart';

class AutopayWidget extends StatelessWidget {
  const AutopayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: 335,
      highlightColor: AppColors.darkThemeHighlightColor,
      onTap: () {},
      bgColor: AppColors.colorGray80,
      child: Padding(
        padding: kPH20V16,
        child: Row(
          children: [
            SvgPicture.asset(AppImages.timeFill,
                colorFilter: svgColorFilter(color: AppColors.colorBlack)),
            kSBW12,
            Flexible(
                fit: FlexFit.tight,
                child: Text(
                  context.localization.autoPayment,
                  style: AppTextStyle.w400s16fSF
                      .copyWith(color: AppColors.colorBlack),
                )),
            CupertinoSwitch(
                activeColor: AppColors.colorPrimaryBlue,
                value: true,
                onChanged: (v) {})
          ],
        ),
      ),
    );
  }
}
