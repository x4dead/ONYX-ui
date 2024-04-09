part of '../payment_page.dart';

class BalanceOwedWidget extends StatelessWidget {
  const BalanceOwedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final info = [localization.paymentAmount, localization.balanceOwed];
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 18),
      width: 335,
      decoration: roundedBoxDecoration.copyWith(color: AppColors.colorGray80),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      2,
                      (index) => Flexible(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    info[index],
                                    style: AppTextStyle.w500s16
                                        .copyWith(color: AppColors.colorGray20),
                                  ),
                                ),
                              ],
                            ),
                          )),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(2, (index) {
                    final data = ["18,7490", "1124960"];

                    return Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 6, top: 12),
                        child: Row(
                          children: [
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                    text: Converting.formatNumber(data[index]),
                                    style: AppTextStyle.w600s24.copyWith(
                                        height: 29.0.toFigmaHeight(24),
                                        fontFamily: 'Gilroy'),
                                    children: const [
                                      TextSpan(
                                        text: ' ₸',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Gilroy'),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          kSBH10,
          CustomButton(
            onTap: () {
              // context.pushNamed('payment');
            },
            buttonText: localization.pay,
          ),
        ],
      ),
    );
  }
}
