import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/modules/signal_service/river/river.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/pages/auth_page/auth_page.dart';
import 'package:onyx_ui/ui/widgets/custom_button.dart';
import 'package:onyx_ui/ui/widgets/custom_radio_list_tile_button.dart';
import 'package:onyx_ui/ui/widgets/field_from_class.dart';
import 'package:onyx_ui/ui/widgets/floating_label_text_field.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/bool.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/extensions/media_query.dart';

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
  final phoneController = MaskedTextController(mask: '+7 (000) 000-00-00');
  ValueNotifier<bool> isUserAgreementAccepted = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    final isRu = ref.watch(River.settingsPod).locale == 'ru';
    final localization = context.localization;
    return Column(
      children: [
        context.height <= 510 ? kSBH8 : kSBH18,
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
        // kSBH40,
        context.height <= 565
            ? context.height <= 530
                ? kSBH15
                : kSBH25
            // kSBH25
            : kSBH40,
        FloatingLabelTextField(
            keyboardType: TextInputType.name,
            inputFormatters: FieldFormClass.regExpName,
            hintText: localization.enterFullName,
            controller: fullNameController,
            floatingLabelText: localization.fullName),
        context.height <= 596
            ? context.height <= 520
                ? kSBH10
                : kSBH15
            // kSBH15
            : kSBH25,
        FloatingLabelTextField(
            keyboardType: TextInputType.number,
            inputFormatters: FieldFormClass.regExpNumber,
            hintText: localization.enterInn,
            controller: iNNController,
            floatingLabelText: localization.iin),
        context.height <= 596
            ? context.height <= 520
                ? kSBH10
                : kSBH15
            // kSBH15
            : kSBH25,
        FloatingLabelTextField(
            keyboardType: TextInputType.phone,
            inputFormatters: FieldFormClass.regExpNumber,
            hintText: localization.enterPhoneNumber,
            controller: phoneController,
            floatingLabelText: localization.phoneNumber),
        context.height <= 596
            ? context.height <= 540
                ? kSBH5
                : kSBH15
            // kSBH15
            : kSBH25,
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
        ref.watch(River.settingsPod).locale == 'ru'
            ? context.height <= 674
                ? kNothing
                : spacer
            : context.height <= 660
                ? kNothing
                : spacer,
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
              context.height <= 565 ? kSBH5 : kSBH15,
              // kSBH15,
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
        ref.watch(River.settingsPod).locale == 'ru'
            ? context.height <= 674
                ? const Expanded(child: SizedBox.expand())
                : const SizedBox(height: 79)
            : context.height <= 660
                ? const Expanded(child: SizedBox.expand())
                : const SizedBox(height: 79)
      ],
    );
  }
}
