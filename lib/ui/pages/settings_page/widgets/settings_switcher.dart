import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/widgets/splash_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/user_pref.dart';

class SettingsSwitcher extends ConsumerWidget {
  const SettingsSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNotificationOn = StateProvider((ref) => UserPref.isNotificationsOn);
    void onChanged() {
      if (UserPref.isNotificationsOn == true) {
        ref.read(isNotificationOn.notifier).state = false;
        UserPref.isNotificationsOn = false;
      } else {
        ref.read(isNotificationOn.notifier).state = true;
        UserPref.isNotificationsOn = true;
      }
    }

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: AppColors.colorGray80,
        borderRadius: allCircularRadius12,
      ),
      child: SplashButton(
        onTap: onChanged,
        child: Padding(
            padding: kPH24V18.copyWith(left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  context.localization.push_notification,
                  style: AppTextStyle.w400s16fSF
                      .copyWith(color: AppColors.colorBlack),
                ),
                spacer,
                CupertinoSwitch(
                    activeColor: AppColors.colorPrimaryBlue,
                    value: ref.watch(isNotificationOn),
                    onChanged: (v) {
                      onChanged();
                    })
              ],
            )),
      ),
    );
  }
}
