part of '../../../reconstruction_page.dart';

class CurrentDebtCard extends StatelessWidget {
  const CurrentDebtCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      // width: double.infinity,
      width: 335,
      height: 137,
      // constraints: const BoxConstraints(maxWidth: 335),
      decoration:
          roundedBoxDecoration.copyWith(gradient: AppColors.gradienCurrentDebt),
      padding: kPAll20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.localization.currentDebt,
            style: AppTextStyle.w500s16.copyWith(
                color: AppColors.colorGray0.withOpacity(0.6),
                height: 19.0.toFigmaHeight(16)),
          ),
          kSBH6,
          RichText(
            text: TextSpan(
                style: AppTextStyle.w600s32.copyWith(
                    color: AppColors.colorGray0,
                    fontFamily: UserPref.getLocale == 'ru'
                        ? 'Gilroy'
                        : 'SF Pro Display'),
                text: "${Converting.formatNumber("1300800")}.00",
                children: [
                  TextSpan(
                      text: " ₸",
                      style: AppTextStyle.w600s32.copyWith(
                        fontFamily: 'SF Pro Display',
                        color: AppColors.colorGray0,
                        fontWeight: FontWeight.w500,
                      ))
                ]),
          ),
          kSBH2,
          Container(
            padding: kPH10V6,
            decoration: const BoxDecoration(
              color: AppColors.colorPrimaryBlue,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Text(
              'ForteBank',
              style: AppTextStyle.w600s16.copyWith(
                  color: AppColors.colorWhite, height: 19.0.toFigmaHeight(16)),
            ),
          ),
        ],
      ),
    );
  }
}
