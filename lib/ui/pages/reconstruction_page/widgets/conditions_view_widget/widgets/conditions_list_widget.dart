part of '../../../reconstruction_page.dart';

class ConditionsListWidget extends StatelessWidget {
  const ConditionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final condition = [
      (localization.mainDebt, AppImages.wallet, '800000'),
      (localization.finesPenalties, AppImages.price, '400000'),
      (localization.issueDate, AppImages.calendar, DateTime(2020, 2, 3))
    ];
    return Column(
      children: List.generate((3 * 2) - 1, (index) {
        if (index.isEven) {
          final itemIndex = index ~/ 2;
          return Container(
            width: double.infinity,
            decoration:
                roundedBoxDecoration.copyWith(color: AppColors.colorGray80),
            padding: kPV12R12.copyWith(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  condition[itemIndex].$1,
                  style: AppTextStyle.w500s15
                      .copyWith(color: AppColors.colorGray0),
                ),
                kSBH5,
                Row(
                  children: [
                    SvgPicture.asset(condition[itemIndex].$2,
                        colorFilter: svgColorFilter()),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        itemIndex == 2
                            ? Converting.getPaymentDateDMY(
                                condition[itemIndex].$3 as DateTime)
                            : condition[itemIndex].$3 as String,
                        style: AppTextStyle.w600s24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return kSBH10;
      }),
    );
  }
}
