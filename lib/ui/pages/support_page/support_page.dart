import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/ui/pages/support_page/widgets/support_message_card.dart';
import 'package:onyx_ui/ui/widgets/custom_app_bar.dart';
import 'package:onyx_ui/ui/widgets/drawer_menu.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key, this.routeState});
  final GoRouterState? routeState;

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    Future<void> openWhatsApp(String phoneNumber) async {
      final url = 'https://wa.me/$phoneNumber';
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url);
      } else {
        print('Не удалось открыть WhatsApp');
      }
    }

    final supportInfo = [
      (
        AppImages.gradientSupport,
        localization.support,
        AppColors.gradienSupport
      ),
      (
        AppImages.chat,
        localization.questionsAnswers,
        AppColors.gradienQuestionAnswer
      ),
      (AppImages.safety, localization.safety, AppColors.gradienSafety),
    ];
    return Scaffold(
      key: globalKey,
      backgroundColor: AppColors.colorWhite,
      appBar: CustomAppBar(
        title: localization.support,
        leading: (
          SvgPicture.asset(AppImages.menu),
          () => globalKey.currentState?.openDrawer(),
        ),
      ),
      drawer: DrawerMenu(routeState: widget.routeState),
      body: Scrollbar(
        child: ListView(
          padding: kPAll20,
          children: List.generate(3, (index) {
            return SupportMessageCard(
              onTap: () async {
                await openWhatsApp("+996705440722");
              },
              info: (
                supportInfo[index].$1,
                supportInfo[index].$2,
                supportInfo[index].$3
              ),
            );
          }),
        ),
      ),
    );
  }
}
