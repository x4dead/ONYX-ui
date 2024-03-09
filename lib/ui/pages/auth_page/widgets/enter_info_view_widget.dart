import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/modules/signal_service/river/river.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/pages/auth_page/auth_page.dart';
import 'package:onyx_ui/ui/widgets/custom_button.dart';
import 'package:onyx_ui/ui/widgets/custom_radio_list_tile_button.dart';
import 'package:onyx_ui/ui/widgets/floating_label_text_field.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/bool.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';

class EnterInfoViewWidget extends ConsumerStatefulWidget {
  const EnterInfoViewWidget({super.key});

  @override
  ConsumerState<EnterInfoViewWidget> createState() =>
      _EnterInfoViewWidgetConsumerState();
}

class _EnterInfoViewWidgetConsumerState
    extends ConsumerState<EnterInfoViewWidget> {
  final fullNameController = TextEditingController();
  final iNNController = TextEditingController();
  final phoneNumberController = TextEditingController();
  ValueNotifier<bool> isUserAgreementAccepted = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    final isRu = ref.watch(River.settingsPod).locale == 'ru';
    final localization = context.localization;
    return Column(
      children: [
        kSBH18,
        Center(
          child: RichText(
            text: TextSpan(
              text: isRu ? localization.welcome : "ONYX",
              style: AppTextStyle.w500s18.copyWith(
                  fontFamily: ref.watch(River.settingsPod).locale == 'ru'
                      ? 'Gilroy'
                      : "SF Pro Display",
                  color:
                      isRu ? AppColors.colorBlack : AppColors.colorPrimaryBlue),
              children: [
                TextSpan(
                    text: isRu ? " ONYX" : localization.welcome,
                    style: TextStyle(
                        color: isRu
                            ? AppColors.colorPrimaryBlue
                            : AppColors.colorBlack)),
              ],
            ),
          ),
        ),
        kSBH40,
        FloatingLabelTextField(
            keyboardType: TextInputType.name,
            hintText: localization.enterFullName,
            controller: fullNameController,
            floatingLabelText: localization.fullName),
        kSBH25,
        FloatingLabelTextField(
            keyboardType: TextInputType.number,
            hintText: localization.enterInn,
            controller: iNNController,
            floatingLabelText: localization.iin),
        kSBH25,
        FloatingLabelTextField(
            keyboardType: TextInputType.phone,
            hintText: localization.enterPhoneNumber,
            controller: phoneNumberController,
            floatingLabelText: localization.phoneNumber),
        kSBH25,
        ValueListenableBuilder(
            valueListenable: isUserAgreementAccepted,
            builder: (context, v, c) {
              return CustomRadioListTileButton(
                isSelectedIconFill: false,
                isLeadingOnCenter: false,
                titleStyle: AppTextStyle.w500s14,
                padding: kPV10,
                onTap: () {
                  isUserAgreementAccepted.value =
                      isUserAgreementAccepted.value.toggleBool();
                },
                isSelected: isUserAgreementAccepted.value,
                title: localization.userAgreement,
              );
            }),
        const Spacer(),
        Padding(
          padding: kPH20,
          child: Column(
            children: [
              CustomButton(
                onTap: () {
                  tabController.animateTo(1);
                },
                buttonText: localization.next,
              ),
              kSBH15,
              CustomButton(
                bgColor: AppColors.colorWhite,
                textColor: AppColors.colorPrimaryBlue,
                isOutlinedButton: true,
                buttonText: localization.action_back,
                onTap: () {
                  context.go('/splash');
                },
              ),
            ],
          ),
        ),
        // const Spacer(),
        SizedBox(
          height: 79,
        )
      ],
    );
  }
}
