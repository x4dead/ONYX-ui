import 'package:flutter/material.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/widgets/floating_label_text_field.dart';
import 'package:onyx_ui/ui/widgets/splash_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu(
      {super.key,
      required this.menuObjects,
      required this.floatingLabelText,
      required this.hintText,
      this.onSelected,
      this.textEditingController,
      this.initialSelectedObject,
      this.overlineText});
  final List<String> menuObjects;
  final String floatingLabelText;
  final String? initialSelectedObject;
  final String hintText;
  final String? overlineText;
  final void Function(String)? onSelected;
  final TextEditingController? textEditingController;

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  final _textController = TextEditingController();
  final _menuController = MenuController();
  final FocusNode focusNode = FocusNode();
  final filteredEntries = ValueNotifier<List<String>>([]);
  @override
  void initState() {
    super.initState();
    filteredEntries.value = widget.menuObjects;
    _textController.text = widget.initialSelectedObject ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  void filter() {
    final String filterText = _textController.text.toLowerCase();
    if (filterText == '') {
      filteredEntries.value = widget.menuObjects;
    }
    filteredEntries.value = widget.menuObjects
        .where((String entry) => entry.toLowerCase().contains(filterText))
        .toList();
  }

  void handlePressed() {
    if (_menuController.isOpen == true) {
      _menuController.close();
    } else {
      focusNode.requestFocus();
      _menuController.open();
    }
  }

  void closeMenu() {
    if (_menuController.isOpen == true) {
      _menuController.close();
    }
  }

  final isObjectChanged = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ValueListenableBuilder(
          valueListenable: filteredEntries,
          builder: (context, value, child) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                ValueListenableBuilder(
                    valueListenable: isObjectChanged,
                    builder: (context, value, child) {
                      return MenuAnchor(
                        clipBehavior: Clip.none,
                        style: const MenuStyle(
                          padding: MaterialStatePropertyAll(kPZero),
                          elevation: MaterialStatePropertyAll(0),
                          side: MaterialStatePropertyAll(BorderSide.none),
                          maximumSize: MaterialStatePropertyAll(Size(335, 300)),
                        ),
                        // crossAxisUnconstrained: false,
                        alignmentOffset: Offset(
                            0,
                            widget.overlineText != null &&
                                    isObjectChanged.value == false
                                ? -76.5
                                : -57.5),
                        controller: _menuController,
                        builder: (context, controller, child) => Container(
                          width: 335,
                          decoration: BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.colorGray40,
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignInside,
                            ),
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: widget.overlineText != null &&
                                        isObjectChanged.value == false
                                    ? 75
                                    : null,
                                child: FloatingLabelTextField(
                                  onTap: handlePressed,
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  textStyle: AppTextStyle.w600s16,
                                  readOnly: true,
                                  myFocusNode: focusNode,
                                  controller: _textController,
                                  floatingLabelText: widget.floatingLabelText,
                                  hintText: widget.hintText,
                                  suffix: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.keyboard_arrow_down_rounded,
                                          color: AppColors.colorBlack),
                                      kSBW20
                                    ],
                                  ),
                                ),
                              ),
                              // if (widget.overlineText != null &&
                              //     isObjectChanged.value == false)
                              //   Positioned(
                              //       left: 20,
                              //       top: 40,
                              //       child: Text(
                              //         '${widget.overlineText} спальных места',
                              //         style: AppTextStyle.w500s16
                              //             .copyWith(color: AppColors.colorGray),
                              //       )),
                            ],
                          ),
                        ),
                        menuChildren: [
                          TextFieldTapRegion(
                            onTapOutside: (event) {
                              focusNode.unfocus();
                              closeMenu();
                            },
                            child: Container(
                              constraints: const BoxConstraints(
                                  maxHeight: 300, maxWidth: 335),
                              width: constraints.maxWidth,
                              decoration: BoxDecoration(
                                color: AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.colorGray20,
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignInside,
                                ),
                              ),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FloatingLabelTextField(
                                      onChanged: (p0) => filter(),
                                      myFocusNode: focusNode,
                                      floatingLabelLeftPosition: 21,
                                      floatingLabelTopPosition: -9,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          19, 16.5, 19, 12.5),
                                      constraints: BoxConstraints(
                                          maxHeight:
                                              filteredEntries.value.isEmpty
                                                  ? 56
                                                  : 50),
                                      controller: _textController,
                                      textStyle: AppTextStyle.w600s16,
                                      floatingLabelText:
                                          widget.floatingLabelText,
                                      focusedBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: widget.hintText,
                                      suffix: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SplashButton(
                                            onTap: handlePressed,
                                            child: const Icon(
                                                Icons.keyboard_arrow_up_rounded,
                                                color: AppColors.colorBlack),
                                          ),
                                          kSBW20
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ...List.generate(
                                                filteredEntries.value.length,
                                                (index) => SplashButton(
                                                    onTap: () {
                                                      _textController.text =
                                                          filteredEntries
                                                              .value[index];
                                                      isObjectChanged.value =
                                                          true;
                                                      _menuController.close();
                                                      focusNode.unfocus();
                                                      widget.onSelected?.call(
                                                          filteredEntries
                                                              .value[index]);
                                                    },
                                                    child: SizedBox(
                                                      height: 51,
                                                      width: double.infinity,
                                                      child: Padding(
                                                        padding: kPH20V12,
                                                        child: Text(
                                                          filteredEntries
                                                              .value[index],
                                                          style: AppTextStyle
                                                              .w500s16,
                                                        ),
                                                      ),
                                                    )))
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                        ],
                        // child: FloatingLabelTextField(
                        //   onTap: handlePressed,
                        //   readOnly: true,
                        //   myFocusNode: focusNode,
                        //   controller: _textController,
                        //   floatingLabelText: widget.floatingLabelText,
                        //   hintText: widget.hintText,
                        //   suffix: const Row(
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: [
                        //       Icon(Icons.keyboard_arrow_down_rounded,
                        //           color: AppColors.colorBlack),
                        //       kSBW20
                        //     ],
                        //   ),
                        // ),
                      );
                    }),
              ],
            );
          });
    });
  }
}
