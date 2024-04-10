import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/widgets/custom_app_bar.dart';
import 'package:onyx_ui/ui/widgets/custom_button.dart';
import 'package:onyx_ui/ui/widgets/field_from_class.dart';
import 'package:onyx_ui/ui/widgets/floating_label_text_field.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/extensions/media_query.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

part 'widgets/remember_card_switcher.dart';

class NewCardPage extends StatefulWidget {
  const NewCardPage({super.key});

  @override
  State<NewCardPage> createState() => _NewCardPageState();
}

class _NewCardPageState extends State<NewCardPage> {
  final cards = [
    (4145645646),
    (941756567802),
  ];
  final dateController = MaskedTextController(mask: '00/00');
  final cvvController = TextEditingController();
  final cardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: CustomAppBar(title: localization.newCard),
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0,
                      context.height <= 650 ? 24 : 34,
                      0,
                      context.height <= 650 ? 30 : 40),
                  child: Align(
                      alignment: Alignment.center,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: AppTextStyle.w500s18.copyWith(
                                color: AppColors.colorBlack,
                                fontFamily: 'Gilroy'),
                            text: '${localization.writeCardInfo}\n',
                            children: [
                              TextSpan(
                                  text: localization.itsSafe,
                                  style: const TextStyle(
                                      color: AppColors.colorPrimaryBlue))
                            ]),
                      )),
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
                      SizedBox(
                        width: 335,
                        child: FloatingLabelTextField(
                            inputFormatters: FieldFormClass.regExpNumber,
                            keyboardType: TextInputType.number,
                            controller: cardNumberController,
                            hintText: localization.writeCardNumber,
                            floatingLabelText: localization.cardNumber),
                      ),
                      if (context.height <= 750)
                        SizedBox(
                          height: 20 * pow(context.height / 750, 1).toDouble(),
                        )
                      else
                        kSBH20,
                      SizedBox(
                        width: 335,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(2 * 2 - 1, (index) {
                            if (index.isEven) {
                              final itemIndex = index ~/ 2;
                              return Flexible(
                                child: FloatingLabelTextField(
                                    maxLength: itemIndex == 1 ? 4 : null,
                                    inputFormatters:
                                        FieldFormClass.regExpNumber,
                                    keyboardType: itemIndex == 0
                                        ? TextInputType.datetime
                                        : TextInputType.number,
                                    controller: itemIndex == 0
                                        ? dateController
                                        : cvvController,
                                    hintText: itemIndex == 0
                                        ? localization.writeDate
                                        : localization.writeCVV,
                                    floatingLabelText: itemIndex == 0
                                        ? localization.date
                                        : 'CVV'),
                              );
                            }
                            return kSBW10;
                          }),
                        ),
                      ),
                      if (context.height <= 750)
                        SizedBox(
                          height: 20 * pow(context.height / 750, 1).toDouble(),
                        )
                      else
                        kSBH20,
                      const RememberCardSwitcher(),
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
              buttonText: localization.ready,
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
