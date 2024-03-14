part of '../../reconstruction_page.dart';

class RestructuringProposalWidget extends ConsumerWidget {
  const RestructuringProposalWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = context.localization;
    final isRu = UserPref.getLocale == 'ru';
    final restructuringProposalStyle = AppTextStyle.w500s18.copyWith(
        fontFamily: isRu ? 'Gilroy' : "SF Pro Display",
        color: AppColors.colorBlack);
    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
        height: constraint.maxHeight,
        child: Column(
          children: [
            kSBH18,
            Padding(
              padding: kPL15R14,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: restructuringProposalStyle,
                    text: localization.restructuringProposal,
                    children: [
                      TextSpan(
                        style: restructuringProposalStyle.copyWith(
                            color: AppColors.colorPrimaryBlue),
                        text:
                            " ${localization.restructuringProposalPrice(Converting.formatNumber('800000'))}",
                      ),
                    ]),
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (context.height <= 660)
                      SizedBox(
                        height: 72 * pow(context.height / 660, 6).toDouble(),
                      )
                    else
                      const SizedBox(height: 72),
                    kSBH2,
                    CustomDropdownMenu(
                        onSelected: (value) {},
                        // textEditingController: ,
                        floatingLabelText: localization.desiredDiscount,
                        hintText: '',
                        initialSelectedObject: '50%',
                        menuObjects: const ['25%', '50%', '75%']),
                    if (context.height <= 600)
                      SizedBox(
                        height: 12 * pow(context.height / 600, 2).toDouble(),
                      )
                    else
                      kSBH12,
                    Container(
                      width: 335,
                      decoration: roundedBoxDecoration.copyWith(
                          border: Border.all(color: AppColors.colorGray40)),
                      child: Column(
                        children: List.generate(3 * 2 - 1, (index) {
                          if (index.isEven) {
                            final itemIndex = index ~/ 2;
                            final info = [
                              (localization.debt, "400000"),
                              (
                                localization.balanceDebt,
                                "8 ${localization.months}"
                              ),
                              (localization.monthlyPayment, "50000")
                            ];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(info[itemIndex].$1,
                                      style: AppTextStyle.w500s16.copyWith(
                                          color: AppColors.colorGray0)),
                                  if (itemIndex == 1)
                                    Text(info[itemIndex].$2,
                                        style: AppTextStyle.w600s16.copyWith(
                                            color: AppColors.colorPrimaryBlue))
                                  else
                                    RichText(
                                      text: TextSpan(
                                          style: AppTextStyle.w600s16.copyWith(
                                              fontFamily:
                                                  UserPref.getLocale == 'ru'
                                                      ? 'Gilroy'
                                                      : "SF Pro Display",
                                              color:
                                                  AppColors.colorPrimaryBlue),
                                          text: Converting.formatNumber(
                                              info[itemIndex].$2),
                                          children: [
                                            TextSpan(
                                                style: AppTextStyle.w600s16
                                                    .copyWith(
                                                        color: AppColors
                                                            .colorPrimaryBlue,
                                                        fontFamily: UserPref
                                                                    .getLocale ==
                                                                'ru'
                                                            ? 'Gilroy'
                                                            : "SF Pro Display"),
                                                text: ' ₸')
                                          ]),
                                    ),
                                ],
                              ),
                            );
                          }
                          return const Divider(
                              height: 1, color: AppColors.colorGray40);
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            context.width <= 785 ? kSBH15 : spacer,
            Padding(
              padding: kPH20,
              child: Column(
                children: [
                  CustomButton(
                    onTap: () {
                      reconstructionController.animateTo(2);
                    },
                    buttonText: localization.agree,
                  ),
                  if (context.height <= 600)
                    SizedBox(
                        height: 15 * pow(context.height / 600, 2.5).toDouble())
                  else
                    kSBH15,
                  CustomButton(
                    onTap: () {
                      reconstructionController.animateTo(0);
                    },
                    isOutlinedButton: true,
                    bgColor: AppColors.colorWhite,
                    buttonText: localization.action_back,
                    textColor: AppColors.colorPrimaryBlue,
                  ),
                ],
              ),
            ),
            if (context.height <= 700)
              SizedBox(
                height: 79 * pow(context.height / 700, 6).toDouble(),
              )
            else
              const SizedBox(height: 79)
          ],
        ),
      );
    });
  }
}
