part of "../payment_schedule_page.dart";

class PaymentsInfoList extends StatefulWidget {
  const PaymentsInfoList({super.key});

  @override
  State<PaymentsInfoList> createState() => _PaymentsInfoListState();
}

class _PaymentsInfoListState extends State<PaymentsInfoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorGray80,
        border: Border.all(width: 1, color: AppColors.colorGray60),
        borderRadius: allCircularRadius12,
      ),
      child: SingleChildScrollView(
          child: Padding(
        padding: kPH14T16B18.copyWith(
          left: context.width <= 350 ? 8 : 14,
          right: context.width <= 350 ? 8 : 14,
          bottom: 0,
          top: 0,
        ),
        child: Column(
          children: List.generate(listPayments.length, (index) {
            return PaymentCard(monthlyPaymentClass: listPayments[index]);
          }),
        ),
      )),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key, required this.monthlyPaymentClass});
  final MonthlyPaymentClass monthlyPaymentClass;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyle.w500s16.copyWith(height: 20.0.toFigmaHeight(16));
    return Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColors.colorGray60, width: 1))),
        height: 50,
        child: Row(
          children: List.generate(4, (index) {
            if (index != 3) {
              return Flexible(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        index == 2
                            ? Converting.formatNumber(
                                monthlyPaymentClass.balanceOwed!)
                            : index == 1
                                ? Converting.formatNumber(
                                    monthlyPaymentClass.paymentAmount!)
                                : Converting.getPaymentDateDMY(
                                    monthlyPaymentClass.paymentDate!),
                        style: style,
                      ),
                    )
                  ],
                ),
              );
            }
            if (monthlyPaymentClass.isPayed == false) {
              final currentPaymentIndex =
                  listPayments.indexOf(monthlyPaymentClass);
              final bool isCurrentPayment = listPayments
                      .elementAt(currentPaymentIndex == 0
                          ? 0
                          : currentPaymentIndex - 1)
                      .isPayed ==
                  true;
              return SvgPicture.asset(
                AppImages.time,
                colorFilter: ColorFilter.mode(
                    isCurrentPayment || currentPaymentIndex == 0
                        ? AppColors.colorPrimaryBlue
                        : AppColors.colorGray40,
                    BlendMode.srcIn),
              );
            } else {
              return const Icon(
                CupertinoIcons.checkmark_alt_circle_fill,
                color: AppColors.colorGreen,
              );
            }
          }),
        ));
  }
}

final listPayments = List.generate(100, (index) {
  return MonthlyPaymentClass(
      paymentAmount: '18749',
      paymentDate: DateTime.now(),
      isPayed: index > 5 ? false : true,
      balanceOwed: "121313");
});

class MonthlyPaymentClass {
  final DateTime? paymentDate;
  final String? paymentAmount;
  final String? balanceOwed;
  final bool? isPayed;

  MonthlyPaymentClass(
      {this.paymentDate, this.paymentAmount, this.balanceOwed, this.isPayed});
}
