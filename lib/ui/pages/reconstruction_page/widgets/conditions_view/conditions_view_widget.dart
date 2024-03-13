part of '../../reconstruction_page.dart';

class ConditionsViewWidget extends StatelessWidget {
  const ConditionsViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final isRu = UserPref.getLocale == 'ru';
    return SingleChildScrollView(
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
        ],
      ),
    );
  }
}
