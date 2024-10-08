﻿import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';

class FloatingLabelTextField extends StatefulWidget {
  const FloatingLabelTextField({
    super.key,
    required this.controller,
    this.validator,
    this.hintText,
    required this.floatingLabelText,
    this.inputFormatters,
    this.helperStyle,
    this.floatingLabelStyle,
    this.maxLines = 1,
    this.maxLength,
    this.obscureText = false,
    this.suffix,
    this.textStyle,
    this.onEditingComplete,
    this.myFocusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.onSaved,
    this.helperWeight = FontWeight.w400,
    this.focusedColor,
    this.hintStyle,
    this.textAlign,
    this.floatingLabelBgColor = AppColors.colorWhite,
    this.onTap,
    this.focusedBorder,
    this.enabled,
    this.disabledBorder,
    this.readOnly,
    this.onTapOutside,
    this.border,
    this.enabledBorder,
    this.constraints,
    this.contentPadding,
    this.floatingLabelTopPosition,
    this.floatingLabelLeftPosition,
    this.textInputAction,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String floatingLabelText;
  final RegExp? inputFormatters;
  final TextStyle? helperStyle;
  final FontWeight? helperWeight;
  final TextStyle? textStyle;
  final TextStyle? floatingLabelStyle;
  final TextStyle? hintStyle;
  final int? maxLines;
  final int? maxLength;
  final bool obscureText;
  final bool? enabled;
  final bool? readOnly;
  final Widget? suffix;
  final void Function()? onEditingComplete;
  final VoidCallback? onTap;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final FocusNode? myFocusNode;
  final Color? focusedColor;
  final TextAlign? textAlign;
  final Color? floatingLabelBgColor;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final void Function(PointerDownEvent)? onTapOutside;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? contentPadding;
  final double? floatingLabelTopPosition;
  final double? floatingLabelLeftPosition;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  @override
  State<FloatingLabelTextField> createState() => _FloatingLabelTextFieldState();
}

class _FloatingLabelTextFieldState extends State<FloatingLabelTextField> {
  late List<TextInputFormatter> inputFormatters;

  final isFocused = ValueNotifier<bool>(false);
  late double contentPadding;
  @override
  void initState() {
    super.initState();
    widget.myFocusNode?.addListener(() {
      if (widget.myFocusNode?.hasFocus ?? false) {
        isFocused.value = true;
      } else {
        isFocused.value = false;
      }
    });

    inputFormatters = widget.inputFormatters == null
        ? <TextInputFormatter>[]
        : [
            FilteringTextInputFormatter.deny(RegExp(r'\s\s')),
            FilteringTextInputFormatter.allow(widget.inputFormatters!),
          ];
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            width: 1,
            color: AppColors.colorGray40,
            strokeAlign: BorderSide.strokeAlignInside),
        gapPadding: 10);

    ///Использую стек для правильного отображения плавающего текста над hintText
    return ValueListenableBuilder(
        valueListenable: isFocused,
        builder: (context, value, child) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              TextFormField(
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction ?? TextInputAction.go,
                onTapOutside: widget.onTapOutside,
                readOnly: widget.readOnly ?? false,
                enabled: widget.enabled ?? true,
                onTap: widget.onTap,
                focusNode: widget.myFocusNode,
                onFieldSubmitted: widget.onFieldSubmitted,
                onSaved: widget.onSaved,
                style: widget.textStyle ??
                    AppTextStyle.w500s16.copyWith(color: AppColors.colorBlack),
                obscureText: widget.obscureText,
                inputFormatters: inputFormatters,
                onChanged: widget.onChanged,
                maxLines: null,
                expands: true,
                // widget.maxLines,

                maxLength: widget.maxLength,
                controller: widget.controller,
                validator: widget.validator,
                onEditingComplete: widget.onEditingComplete,
                cursorWidth: 1,
                textAlign: widget.textAlign ?? TextAlign.start,
                decoration: InputDecoration(
                    counterText: '',
                    constraints: widget.constraints ??
                        const BoxConstraints(maxHeight: 56, minHeight: 56),
                    enabledBorder: widget.enabledBorder ?? border,
                    disabledBorder: widget.disabledBorder ?? border,
                    border: widget.border ?? border,
                    focusedBorder: widget.focusedBorder ?? border,
                    focusColor: widget.focusedColor,
                    suffixIcon: widget.suffix,
                    hintText: widget.hintText,
                    contentPadding: widget.contentPadding ?? kPH20V18Dot5,
                    hintStyle: widget.hintStyle ??
                        AppTextStyle.w500s16
                            .copyWith(color: AppColors.colorGray20)),
              ),
              Positioned(
                top: widget.floatingLabelTopPosition ?? -8,
                left: widget.floatingLabelLeftPosition ?? 22,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 17,
                  color: widget.floatingLabelBgColor!,
                  alignment: Alignment.center,
                  child: Text(
                    widget.floatingLabelText,
                    style: widget.floatingLabelStyle ??
                        AppTextStyle.w500s14
                            .copyWith(color: AppColors.colorGray0),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
