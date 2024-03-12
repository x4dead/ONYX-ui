﻿part of "../payment_schedule_page.dart";

class CalendarPaidPaymentsButtons extends StatelessWidget {
  const CalendarPaidPaymentsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    context.localization;
    return Row(
        children: List.generate((2 * 2) - 1, (index) {
      if (index.isEven) {
        final itemIndex = index ~/ 2;
        final buttons = [
          (AppImages.wallet, localization.earlyRepayment),
          (AppImages.document, localization.accountDetails)
        ];
        return Flexible(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.colorGray80,
                borderRadius: allCircularRadius12),
            clipBehavior: Clip.hardEdge,
            child: SplashButton(
              onTap: () {},
              child: Padding(
                padding: kPV12R12.copyWith(right: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      buttons[itemIndex].$1,
                      colorFilter: const ColorFilter.mode(
                          AppColors.colorGray0, BlendMode.srcIn),
                    ),
                    kSBH5,
                    Text(
                      buttons[itemIndex].$2,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.w500s15
                          .copyWith(color: AppColors.colorGray0),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
      return kSBW15;
    }));
  }
}