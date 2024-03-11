import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/ui/pages/payment_schedule_page/widgets/payment_info_widget.dart';
import 'package:onyx_ui/ui/widgets/custom_app_bar.dart';
import 'package:onyx_ui/ui/widgets/drawer_menu.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/extensions/media_query.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

class PaymentSchedulePage extends StatelessWidget {
  const PaymentSchedulePage({super.key, this.routeState});
  final GoRouterState? routeState;
  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<ScaffoldState>();
    final localization = context.localization;
    return Scaffold(
      key: globalKey,
      backgroundColor: AppColors.colorWhite,
      drawer: DrawerMenu(routeState: routeState),
      appBar: CustomAppBar(title: localization.paymentSchedule, leading: (
        SvgPicture.asset(AppImages.menu),
        () => globalKey.currentState?.openDrawer(),
      )),
      body: Padding(
        padding: kPH20V12.copyWith(
            left: context.width <= 375
                ? 14
                : context.width <= 380
                    ? 18
                    : 20,
            right: context.width <= 375
                ? 14
                : context.width <= 380
                    ? 18
                    : 20,
            bottom: 10,
            top: 10),
        child: const CustomScrollView(
          slivers: [SliverToBoxAdapter(child: PaymentInfoWidget())],
        ),
      ),
    );
  }
}
