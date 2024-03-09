import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/ui/pages/auth_page/widgets/confirm_number_view_widget.dart';
import 'package:onyx_ui/ui/pages/auth_page/widgets/enter_info_view_widget.dart';
import 'package:onyx_ui/ui/widgets/custom_app_bar.dart';
import 'package:onyx_ui/ui/widgets/dots_indicator.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';

late TabController tabController;

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  ValueNotifier position = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 2,
        vsync: this,
        animationDuration: const Duration(milliseconds: 300));
    tabController.addListener(() {
      position.value = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.colorWhite,
      appBar: CustomAppBar(leading: (
        null,
        () => context.go('/splash'),
      )),
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
                          dotsCount: 2,
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
                    controller: tabController,
                    children: const [
                      EnterInfoViewWidget(),
                      ConfirmNumberViewWidget(),
                    ],
                  ),
                ),
              ),
              // kSBH45,
              // FloatingLabelTextField(
              //   controller: emailController,
              //   floatingLabelText: 'Эл. почта',
              //   hintText: 'Адрес эл. почты',
              // ),
              // kSBH25,
              // Row(
              //   children: [
              //     Flexible(
              //       child: FloatingLabelTextField(
              //         textAlign: TextAlign.center,
              //         controller: codeController,
              //         floatingLabelText: 'Код',
              //         hintText: '0000',
              //       ),
              //     ),
              //     kSBW15,
              //     const CustomButton(buttonText: 'Отправить'),
              //   ],
              // ),
              // const Spacer(),
              // Padding(
              //   padding: kPH20,
              //   child: CustomButton(
              //     buttonText: 'Далее',
              //     onTap: () => context
              //         .go('/main', extra: {"is_cupertino_animation": true}),
              //   ),
              // ),
              // kSBH100,
            ],
          ),
        ),
      ),
    );
  }
}
