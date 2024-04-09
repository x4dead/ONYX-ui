part of '../../reconstruction_page.dart';

class RestructuringProposalWidget extends StatefulWidget {
  const RestructuringProposalWidget({super.key});

  @override
  State<RestructuringProposalWidget> createState() =>
      _RestructuringProposalWidgetState();
}

class _RestructuringProposalWidgetState
    extends State<RestructuringProposalWidget> {
  late ValueNotifier<List<String>> selectedDiscountPeriods = ValueNotifier([
    context.localization.month('5'),
    context.localization.month('6'),
    context.localization.month('7'),
  ]);

  ValueNotifier selectedDiscountIndex = ValueNotifier(3);

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final isRu = UserPref.getLocale == 'ru';
    final restructuringProposalStyle = AppTextStyle.w500s18.copyWith(
        fontFamily: isRu ? 'Gilroy' : "SF Pro Display",
        color: AppColors.colorBlack);
    final helpInfo = [
      "( ${localization.fromToMonths('10', '12')} )",
      "( ${localization.fromToMonths('8', '10')} )",
      "( ${localization.fromToMonths('6', '8')} )",
      "( ${localization.fromToMonths('5', '6')} )",
    ];
    final avaibleDiscount = [
      (
        '20%',
        [
          localization.month('10'),
          localization.month('11'),
          localization.month('12'),
        ]
      ),
      (
        '30%',
        [
          localization.month('8'),
          localization.month('9'),
          localization.month('10'),
        ]
      ),
      (
        '40%',
        [
          localization.month('6'),
          localization.month('7'),
          localization.month('8'),
        ]
      ),
      (
        '50%',
        [
          localization.month('5'),
          localization.month('6'),
          localization.month('7'),
        ]
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width <= 350 ? 10 : 20),
      child: Column(
        children: [
          if (context.height <= 750)
            SizedBox(
              height: 18 * pow(context.height / 750, 2).toDouble(),
            )
          else
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
            // flex: 2
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (context.height <= 750)
                    SizedBox(
                      height: 50 * pow(context.height / 750, 4).toDouble(),
                    )
                  else
                    kSBH50,
                  CustomDropdownMenu(
                      onSelected: (p0) {
                        print(p0);
                      },
                      onSelectedIndex: (index) {
                        // setState(() {
                        selectedDiscountPeriods.value =
                            avaibleDiscount[index].$2;
                        // });
                      },
                      // textEditingController: ,
                      floatingLabelText: localization.desiredDiscount,
                      hintText: '',
                      initialSelectedObject:
                          avaibleDiscount[selectedDiscountIndex.value].$1,
                      isNoTextField: true,
                      menuObjectsHelpInfo: helpInfo,
                      menuObjects: const [
                        '20%', '30%', '40%', '50%',

                        // ...avaibleDiscount[selectedDiscountIndex].$2
                      ]),
                  // kSBH25,
                  if (context.height <= 750)
                    SizedBox(
                      height: 25 * pow(context.height / 750, 2).toDouble(),
                    )
                  else
                    kSBH25,
                  ValueListenableBuilder(
                      valueListenable: selectedDiscountPeriods,
                      builder: (context, v, c) {
                        return CustomDropdownMenu(
                            onSelected: (p0) {
                              print(p0);
                            },
                            isNoTextField: true,

                            // textEditingController: ,
                            floatingLabelText:
                                localization.desiredRepaymentPeriod,
                            hintText: '',
                            initialSelectedObject: v.first,
                            menuObjects: selectedDiscountPeriods.value);
                      }),
                  if (context.height <= 750)
                    SizedBox(
                      height: 20 * pow(context.height / 750, 2).toDouble(),
                    )
                  else
                    kSBH20,
                  Container(
                    width: 335,
                    decoration: roundedBoxDecoration.copyWith(
                        border: Border.all(color: AppColors.colorGray40)),
                    child: Column(
                      children: List.generate(2 * 2 - 1, (index) {
                        if (index.isEven) {
                          final itemIndex = index ~/ 2;
                          final info = [
                            (localization.balanceDebt, "400000"),
                            (localization.monthlyPayment, "50000")
                          ];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.width <= 350 ? 9 : 18,
                                vertical: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 2,
                                  child: Text(info[itemIndex].$1,
                                      style: AppTextStyle.w500s16.copyWith(
                                        color: AppColors.colorGray0,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ),
                                Flexible(
                                  child: SelectableText(
                                      "${Converting.formatNumber(info[itemIndex].$2)} ₸",
                                      style: AppTextStyle.w600s16.copyWith(
                                          color: AppColors.colorPrimaryBlue,
                                          overflow: TextOverflow.ellipsis)),
                                )
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
                  width: 295,
                  onTap: () {
                    reconstructionController.animateTo(2);
                  },
                  buttonText: localization.agree,
                ),
                if (context.height <= 750)
                  SizedBox(
                      height: 15 * pow(context.height / 750, 2.5).toDouble())
                else
                  kSBH15,
                CustomButton(
                  width: 295,
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
          if (context.height <= 750)
            SizedBox(
              height: 79 * pow(context.height / 750, 6).toDouble(),
            )
          else
            const SizedBox(height: 79)
        ],
      ),
    );
  }
}
