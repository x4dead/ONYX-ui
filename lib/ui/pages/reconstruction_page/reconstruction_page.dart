﻿import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/widgets/custom_app_bar.dart';
import 'package:onyx_ui/ui/widgets/dots_indicator.dart';
import 'package:onyx_ui/ui/widgets/drawer_menu.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/extensions/converting.dart';
import 'package:onyx_ui/utils/extensions/figma_height.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';
import 'package:onyx_ui/utils/user_pref.dart';

part 'widgets/conditions_view/conditions_view_widget.dart';
part 'widgets/conditions_view/widgets/conditions_list_widget.dart';
part 'widgets/conditions_view/widgets/current_debt_card.dart';

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
        leading: (
          SvgPicture.asset(AppImages.menu),
          () => globalKey.currentState?.openDrawer(),
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
                  length: 2,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    dragStartBehavior: DragStartBehavior.down,
                    controller: reconstructionController,
                    children: const [
                      ConditionsViewWidget(),
                      // ConfirmNumberViewWidget(),
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