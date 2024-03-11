﻿import 'package:flutter/cupertino.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/pages/news_page/data.dart';
import 'package:onyx_ui/ui/widgets/custom_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/extensions/converting.dart';
import 'package:onyx_ui/utils/extensions/media_query.dart';

class PaymentInfoWidget extends StatelessWidget {
  const PaymentInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final info = [
      localization.paymentDate,
      localization.paymentAmount,
      localization.balanceOwed
    ];
    final now = DateTime.now();
    final paymentDate = DateTime.now().add(day1 * 1);
    final difference = paymentDate.difference(now);
    return Container(
      padding: kPH14T16B18.copyWith(
        left: context.width <= 375
            ? 10
            : context.width <= 380
                ? 12
                : 14,
        right: context.width <= 375
            ? 10
            : context.width <= 380
                ? 12
                : 14,
      ),
      decoration: const BoxDecoration(
          color: AppColors.colorGray80, borderRadius: allCircularRadius12),
      child: Column(children: [
        CustomButton(
          buttonText: localization.pay,
        ),
        kSBH10,
        Padding(
          padding: context.width <= 380
              ? kPH12
              : context.width <= 375
                  ? kPH6
                  : kPH16,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (index) {
                  final data = ["Завтра", "18,749", "112496"];

                  return Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 6, top: 12),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              index == 0
                                  ? Converting.getPaymentDate(
                                      paymentDate, context)
                                  : Converting.formatNumber(data[index]),
                              style: AppTextStyle.w500s18.copyWith(
                                  color: difference.isNegative && index == 0
                                      ? AppColors.colorRed
                                      : AppColors.colorBlack),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                    3,
                    (index) => Flexible(
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  info[index],
                                  style: AppTextStyle.w500s16.copyWith(
                                      color: difference.isNegative && index == 0
                                          ? AppColors.colorRed
                                          : AppColors.colorGray20),
                                ),
                              ),
                            ],
                          ),
                        )),
              ),
            ],
          ),
        )
      ]),
    );
  }
}