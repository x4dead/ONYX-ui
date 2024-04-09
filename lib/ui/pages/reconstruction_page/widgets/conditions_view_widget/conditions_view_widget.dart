part of '../../reconstruction_page.dart';

class ConditionsViewWidget extends ConsumerWidget {
  const ConditionsViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = context.localization;
    final isRu = UserPref.getLocale == 'ru';
    return SingleChildScrollView(
      child: Padding(
        padding: kPH20,
        child: Column(
          children: [
            kSBH10,
            const CurrentDebtCard(),
            kSBH11,
            const ConditionsListWidget(),
            kSBH14,
            Container(
              decoration:
                  roundedBoxDecoration.copyWith(color: AppColors.colorGray80),
              padding: kPV10.copyWith(left: 12, right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: AppTextStyle.w500s18point14.copyWith(
                            color: AppColors.colorGray0,
                            fontFamily: isRu ? 'Gilroy' : "SF Pro Display"),
                        text: !isRu
                            ? 'Сізден'
                            : localization.youChargedFinesPenalties,
                        children: [
                          TextSpan(
                            style: AppTextStyle.w500s18point14.copyWith(
                                color: AppColors.colorPrimaryBlue,
                                fontWeight: FontWeight.w600,
                                fontFamily: isRu ? 'Gilroy' : "SF Pro Display"),
                            text:
                                " ${localization.priceTenge(Converting.formatNumber("400000"))}${isRu ? "!" : " "}",
                          ),
                          if (!isRu)
                            TextSpan(
                              style: AppTextStyle.w500s18point14.copyWith(
                                  color: AppColors.colorGray0,
                                  fontFamily: "SF Pro Display"),
                              text: localization.youChargedFinesPenalties,
                            )
                        ]),
                  ),
                  kSBH12,
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: AppTextStyle.w500s18point14.copyWith(
                          fontFamily: isRu ? 'Gilroy' : "SF Pro Display",
                          color: isRu
                              ? AppColors.colorGray0
                              : AppColors.colorPrimaryBlue,
                          fontWeight: !isRu ? FontWeight.w600 : null,
                        ),
                        text: UserPref.getLocale == 'kk'
                            ? "${localization.priceTenge(Converting.formatNumber("800000"))} "
                            : localization.wantToReduceTheBalance,
                        children: [
                          if (isRu)
                            TextSpan(
                              style: AppTextStyle.w500s18point14.copyWith(
                                  color: AppColors.colorPrimaryBlue,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Gilroy'),
                              text:
                                  " ${localization.priceTenge(Converting.formatNumber("800000"))}?",
                            ),
                          if (!isRu)
                            TextSpan(
                              style: AppTextStyle.w500s18point14.copyWith(
                                  color: AppColors.colorGray0,
                                  fontFamily: "SF Pro Display"),
                              text: localization.wantToReduceTheBalance,
                            )
                        ]),
                  ),
                ],
              ),
            ),
            kSBH16,
            Padding(
              padding: kPH12,
              child: Row(
                children: [
                  Flexible(
                    child: CustomButton(
                      onTap: () {
                        reconstructionController.animateTo(1);
                      },
                      height: 52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(CupertinoIcons.checkmark_alt_circle_fill,
                              color: AppColors.colorWhite),
                          kSBW10,
                          Text(
                            localization.yes,
                            style: AppTextStyle.w500s16.copyWith(
                                height: 11.0.toFigmaHeight(16),
                                color: AppColors.colorWhite),
                          )
                        ],
                      ),
                    ),
                  ),
                  kSBW10,
                  CustomButton(
                    height: 52,
                    width: 96,
                    isOutlinedButton: true,
                    bgColor: AppColors.colorWhite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.closeFill,
                          colorFilter:
                              svgColorFilter(color: AppColors.colorPrimaryBlue),
                        ),
                        kSBW10,
                        Text(
                          localization.no,
                          style: AppTextStyle.w500s16.copyWith(
                              height: 11.0.toFigmaHeight(16),
                              color: AppColors.colorPrimaryBlue),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ref.watch(River.settingsPod).locale == 'ru'
                ? SizedBox(
                    height: context.height <= 735
                        ? 39
                        : context.height <= 755
                            ? 59
                            : 79)
                : SizedBox(
                    height: context.height <= 777
                        ? 39
                        : context.height <= 800
                            ? 59
                            : 79)
          ],
        ),
      ),
    );
  }
}
