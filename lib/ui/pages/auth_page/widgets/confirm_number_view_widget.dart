import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/modules/signal_service/river/river.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/pages/auth_page/auth_page.dart';
import 'package:onyx_ui/ui/widgets/custom_button.dart';
import 'package:onyx_ui/ui/widgets/field_from_class.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/extensions/media_query.dart';

class ConfirmNumberViewWidget extends ConsumerStatefulWidget {
  const ConfirmNumberViewWidget({super.key});

  @override
  ConsumerState<ConfirmNumberViewWidget> createState() =>
      _ConfirmNumberViewWidgetConsumerState();
}

class _ConfirmNumberViewWidgetConsumerState
    extends ConsumerState<ConfirmNumberViewWidget> {
  final List<FocusNode> _focusNodes =
      List<FocusNode>.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List<TextEditingController>.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var ctrl in _controllers) {
      ctrl.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isRu = ref.watch(River.settingsPod).locale == 'ru';
    final localization = context.localization;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        kSBH18,
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: isRu ? localization.checkPhoneNumber : "Ол үшін ",
            style: AppTextStyle.w500s18.copyWith(
                color: AppColors.colorBlack,
                fontFamily: ref.watch(River.settingsPod).locale == 'ru'
                    ? 'Gilroy'
                    : "SF Pro Display"),
            children: [
              if (!isRu)
                const TextSpan(
                    text: "телефон нөмірін ",
                    style: TextStyle(color: AppColors.colorPrimaryBlue)),
              TextSpan(
                  text:
                      isRu ? "\nномер телефона" : localization.checkPhoneNumber,
                  style: TextStyle(
                      color: isRu
                          ? AppColors.colorPrimaryBlue
                          : AppColors.colorBlack)),
            ],
          ),
        ),
        kSBH50,

        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate((4 * 2) - 1, (index) {
              if (index.isEven) {
                final i = index ~/ 2;
                return TextField(
                  expands: true,
                  controller: _controllers[i],
                  maxLines: null,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        FieldFormClass.regExpNumber)
                  ],
                  onChanged: (value) async {
                    final String code =
                        "${_controllers[0].text}${_controllers[1].text}${_controllers[2].text}${_controllers[3].text}";
                    if (i < 3 && code.length < 4 && value.isNotEmpty) {
                      _focusNodes[i].unfocus();
                      FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
                    } else if (i == 3 && code.length < 4 && value.isNotEmpty) {
                      _focusNodes[i].unfocus();
                    } else if (i == 0 && value.isEmpty) {
                      _focusNodes[i].unfocus();
                      // FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
                    } else if (code.length < 4 && i >= 0 && value.isEmpty) {
                      _focusNodes[i].unfocus();
                      FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
                    } else if (code.length == 4) {
                      _focusNodes[i].unfocus();

                      ///TODO: CHECK CODE

                      showDialog(
                          barrierColor: Colors.black26,
                          context: context,
                          builder: (context) => const Center(
                                child: CupertinoActivityIndicator(),
                              ));
                      await Future.delayed(const Duration(seconds: 2))
                          .then((value) => context.go('/reconstruction'));
                    }
                  },
                  focusNode: _focusNodes[i],
                  style: AppTextStyle.w500s18
                      .copyWith(color: AppColors.colorBlack),
                  decoration: InputDecoration(
                    constraints:
                        const BoxConstraints(maxWidth: 46, maxHeight: 56),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: ref.watch(River.settingsPod).locale == 'ru'
                            ? 18
                            : 17),
                    counterText: '',
                    hintText: '_',
                    hintStyle: AppTextStyle.w500s18
                        .copyWith(color: AppColors.colorGray20),
                    border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.colorGray40, width: 1),
                        borderRadius: allCircularRadius12),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                );
              }
              return kSBW14;
            })),
        kSBH22,
        Text(
          localization.code,
          textAlign: TextAlign.center,
          style: AppTextStyle.w500s14.copyWith(
            color: AppColors.colorGray0,
          ),
        ),
        // Expanded(flex: 2, child:
        // SizedBox.expand()
        //  )
        context.height <= 504 ? kNothing : spacer,
        Padding(
          padding: kPH20,
          child: Column(
            children: [
              CustomButton(
                onTap: () {
                  tabController.animateTo(1);
                },
                buttonText: localization.register,
              ),
              kSBH15,
              CustomButton(
                bgColor: AppColors.colorWhite,
                textColor: AppColors.colorPrimaryBlue,
                isOutlinedButton: true,
                buttonText: localization.action_back,
                onTap: () {
                  // context.go('/splash');
                  tabController.animateTo(0);
                },
              ),
            ],
          ),
        ),
        context.height <= 504
            ? const Expanded(child: SizedBox.expand())
            : const SizedBox(height: 79)
      ],
    );
  }
}
