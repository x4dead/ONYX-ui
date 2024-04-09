import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/pages/payment_schedule_page/payment_schedule_page.dart';
import 'package:onyx_ui/ui/widgets/credit_card.dart';
import 'package:onyx_ui/ui/widgets/custom_app_bar.dart';
import 'package:onyx_ui/ui/widgets/custom_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/extensions/converting.dart';
import 'package:onyx_ui/utils/extensions/figma_height.dart';
import 'package:onyx_ui/utils/extensions/media_query.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

part 'widgets/balance_owed_widge.dart';
part 'widgets/autopay_switcher.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final cards = [
    (4145645646),
    (941756567802),
  ];
  late ValueNotifier<int> selectedCard = ValueNotifier(cards.first);

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    return Scaffold(
      appBar: CustomAppBar(title: localization.payment),
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      context.width <= 350 ? 26 : 38,
                      context.height <= 750
                          ? 18 * pow(context.height / 750, 1).toDouble()
                          : 18,
                      26,
                      12),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(localization.paymentMethod,
                          style: AppTextStyle.w500s18
                              .copyWith(color: AppColors.colorGray0))),
                ),
                SizedBox(
                  height: 80,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding:
                        kPH12.copyWith(left: context.width <= 350 ? 20 : 32),
                    itemBuilder: (c, index) {
                      if (index == cards.length) {
                        return Center(
                          child: CustomButton(
                            highlightColor: AppColors.darkThemeHighlightColor,
                            width: 100,
                            height: 64,
                            bgColor: AppColors.colorGray80,
                            borderRadius: allCircularRadius6,
                            onTap: () {},
                            child: Center(
                                child: Container(
                              decoration: roundedBoxDecoration.copyWith(
                                  color: AppColors.colorGray0,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(100))),
                              padding: const EdgeInsets.all(2),
                              child: const Icon(CupertinoIcons.add,
                                  color: AppColors.colorWhite),
                            )),
                          ),
                        );
                      }
                      return ValueListenableBuilder(
                          valueListenable: selectedCard,
                          builder: (context, v, c) {
                            return CreditCard(
                              onTap: () {
                                if (cards[index] != selectedCard.value) {
                                  selectedCard.value = cards[index];
                                }
                              },
                              cardNumber: cards[index],
                              isSelected: cards[index] == selectedCard.value
                                  ? true
                                  : false,
                            );
                          });
                    },
                    separatorBuilder: (context, index) => kSBW12,
                    itemCount: cards.length + 1,
                  ),
                ),
                if (context.height <= 750)
                  SizedBox(
                    height: 20 * pow(context.height / 750, 1.5).toDouble(),
                  )
                else
                  kSBH20,
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.width <= 350 ? 10 : 20),
                  child: Column(
                    children: [
                      const BalanceOwedWidget(),
                      if (context.height <= 750)
                        SizedBox(
                          height: 15 * pow(context.height / 750, 1).toDouble(),
                        )
                      else
                        kSBH15,
                      const RequisitesRepaymentButtons(),
                      if (context.height <= 750)
                        SizedBox(
                          height: 15 * pow(context.height / 750, 1).toDouble(),
                        )
                      else
                        kSBH15,
                      const AutopayWidget(),
                    ],
                  ),
                ),
              ],
            )),
          ),
          if (context.height <= 750)
            SizedBox(
              height: 22 * pow(context.height / 750, 2.5).toDouble(),
            )
          else
            kSBH22,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: CustomButton(
              width: 295,
              onTap: () {
                context.pop();
              },
              buttonText: localization.action_back,
            ),
          ),
          if (context.height <= 750)
            SizedBox(height: 28 * pow(context.height / 750, 2.5).toDouble())
          else
            const SizedBox(height: 28),
          Center(
            child: SvgPicture.asset(
              AppImages.onyx,
              width: 82,
              height: 22,
            ),
          ),
          if (context.height <= 750)
            SizedBox(
              height: 69 * pow(context.height / 750, 6).toDouble(),
            )
          else
            const SizedBox(height: 69)
        ],
      ),
    );
  }
}
