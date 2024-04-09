part of "../payment_schedule_page.dart";

class RequisitesRepaymentButtons extends ConsumerWidget {
  const RequisitesRepaymentButtons({
    this.paymentDate,
    this.payment = ('10', '12'),
    super.key,
  });
  final DateTime? paymentDate;
  final (String, String)? payment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final localization = context.localization;

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate((2 * 2) - 1, (index) {
          if (index.isEven) {
            final itemIndex = index ~/ 2;
            final buttons = [
              AppImages.calendar,
              AppImages.list,
            ];
            return Flexible(
              child: Container(
                height: 59,
                constraints: const BoxConstraints(
                  maxWidth: 160,
                ),
                decoration:
                    roundedBoxDecoration.copyWith(color: AppColors.colorGray80),
                clipBehavior: Clip.hardEdge,
                child: SplashButton(
                  onTap: () {},
                  child: Padding(
                    padding: kPH14T16B18.copyWith(top: 0, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(buttons[itemIndex],
                            colorFilter: svgColorFilter()),
                        Text(
                          itemIndex == 1
                              ? ref.watch(River.settingsPod).locale == 'ru'
                                  ? "${payment?.$1} из ${payment?.$2} \nплатежей"
                                  : "${payment?.$2} ден ${payment?.$1} \nтөлемдер"
                              : (paymentDate ?? DateTime.now()).year.toString(),
                          textAlign: TextAlign.center,
                          style: AppTextStyle.w500s18
                              .copyWith(
                                  height: itemIndex == 1
                                      ? 22.0.toFigmaHeight(18)
                                      : null)
                              .copyWith(color: AppColors.colorGray0),
                        ),
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
