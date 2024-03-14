import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/modules/signal_service/river/river.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/widgets/custom_app_bar.dart';
import 'package:onyx_ui/ui/widgets/custom_button.dart';
import 'package:onyx_ui/ui/widgets/custom_dropdown_menu.dart';
import 'package:onyx_ui/ui/widgets/dots_indicator.dart';
import 'package:onyx_ui/ui/widgets/drawer_menu.dart';
import 'package:onyx_ui/ui/widgets/splash_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/extensions/converting.dart';
import 'package:onyx_ui/utils/extensions/figma_height.dart';
import 'package:onyx_ui/utils/extensions/media_query.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';
import 'package:onyx_ui/utils/user_pref.dart';

part 'widgets/conditions_view_widget/conditions_view_widget.dart';
part 'widgets/conditions_view_widget/widgets/conditions_list_widget.dart';
part 'widgets/conditions_view_widget/widgets/current_debt_card.dart';
part 'widgets/restructuring_proposal_widget/restructuring_proposal_widget.dart';
part 'widgets/application_accepted_widget/application_accepted_widget.dart';

late TabController reconstructionController;

class ReconstructionPage extends StatefulWidget {
  const ReconstructionPage({super.key, this.routeState});
  final GoRouterState? routeState;

  @override
  State<ReconstructionPage> createState() => _ReconstructionPageState();
}

final globalKey = GlobalKey<ScaffoldState>();

class _ReconstructionPageState extends State<ReconstructionPage>
    with SingleTickerProviderStateMixin {
  ValueNotifier position = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    reconstructionController = TabController(
        length: 3,
        vsync: this,
        animationDuration: const Duration(milliseconds: 300));
    reconstructionController.addListener(() {
      position.value = reconstructionController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: AppColors.colorWhite,
      appBar: CustomAppBar(
        title: context.localization.reconstruction,
        actionWidget: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              color: AppColors.colorGray80,
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: SplashButton(
            onTap: () {},
            child: Padding(
              padding: kPAll6,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  context.localization.language,
                  style: AppTextStyle.w500s14
                      .copyWith(color: AppColors.colorBlack),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  AppImages.flag,
                  height: 24,
                  width: 24,
                  colorFilter: svgColorFilter(),
                )
              ]),
            ),
          ),
        ),
        leading: (
          ValueListenableBuilder(
              valueListenable: position,
              builder: (ctx, v, child) {
                return SvgPicture.asset(
                    position.value != 0 ? AppImages.arrowLeft : AppImages.menu);
              }),
          () {
            if (position.value == 0) {
              globalKey.currentState?.openDrawer();
            } else {
              reconstructionController.animateTo(position.value - 1);
            }
          }
        ),
      ),
      drawer: DrawerMenu(routeState: widget.routeState),
      body: SafeArea(
        child: Padding(
          padding: kPH20,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: ValueListenableBuilder(
                      valueListenable: position,
                      builder: (context, v, c) {
                        return DotsIndicator(
                          dotsCount: 3,
                          position: position.value,
                        );
                      }),
                ),
              ),
              Flexible(
                child: DefaultTabController(
                  length: 3,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    dragStartBehavior: DragStartBehavior.down,
                    controller: reconstructionController,
                    children: const [
                      ConditionsViewWidget(),
                      RestructuringProposalWidget(),
                      ApplicationAcceptedWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
