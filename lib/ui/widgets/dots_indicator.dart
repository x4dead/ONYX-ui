﻿import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';

typedef OnTap = void Function(int position);

class DotsIndicator extends StatelessWidget {
  final int dotsCount, position;
  final DotsDecorator decorator;
  // final Axis axis;
  // final bool reversed;
  final OnTap? onTap;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;

  DotsIndicator({
    Key? key,
    required this.dotsCount,
    this.position = 0,
    this.decorator = const DotsDecorator(),
    // this.axis = Axis.horizontal,
    // this.reversed = false,
    this.mainAxisSize = MainAxisSize.min,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.onTap,
  })  : assert(dotsCount > 0, 'dotsCount must be superior to zero'),
        assert(position >= 0, 'position must be superior or equals to zero'),
        assert(
          position < dotsCount,
          "position must be less than dotsCount",
        ),
        assert(
          decorator.colors.isEmpty || decorator.colors.length == dotsCount,
          "colors param in decorator must empty or have same length as dotsCount parameter",
        ),
        // assert(
        //   decorator.activeColors.isEmpty ||
        //       decorator.activeColors.length == dotsCount,
        //   "activeColors param in decorator must empty or have same length as dotsCount parameter",
        // ),
        // assert(
        //   decorator.sizes.isEmpty || decorator.sizes.length == dotsCount,
        //   "sizes param in decorator must empty or have same length as dotsCount parameter",
        // ),
        // assert(
        //   decorator.activeSizes.isEmpty ||
        //       decorator.activeSizes.length == dotsCount,
        //   "activeSizes param in decorator must empty or have same length as dotsCount parameter",
        // ),
        // assert(
        //   decorator.shapes.isEmpty || decorator.shapes.length == dotsCount,
        //   "shapes param in decorator must empty or have same length as dotsCount parameter",
        // ),
        // assert(
        //   decorator.activeShapes.isEmpty ||
        //       decorator.activeShapes.length == dotsCount,
        //   "activeShapes param in decorator must empty or have same length as dotsCount parameter",
        // ),
        super(key: key);

  Widget _wrapInkwell(Widget dot, int index) {
    return InkWell(
      customBorder: position == index
          ? decorator.getActiveShape(index)
          : decorator.getShape(index),
      onTap: () => onTap!(index),
      child: dot,
    );
  }

  Widget _buildDot(BuildContext context, int index) {
    final double lerpValue = min(1, (position - index).abs()).toDouble();

    final size = Size.lerp(
      decorator.getActiveSize(index),
      decorator.getSize(index),
      lerpValue,
    )!;

    final dot = Container(
      width: size.width,
      height: size.height,
      margin: decorator.spacing,
      decoration: ShapeDecoration(
        color: index < position
            ? decorator.getColorBeforeActive()
            : Color.lerp(
                decorator.getActiveColor(index) ?? AppColors.colorPrimaryBlue,
                decorator.getColor(index),
                lerpValue,
              ),
        shape: ShapeBorder.lerp(
          decorator.getActiveShape(index),
          decorator.getShape(index),
          lerpValue,
        )!,
      ),
    );
    return onTap == null ? dot : _wrapInkwell(dot, index);
  }

  @override
  Widget build(BuildContext context) {
    final dotsList = List<Widget>.generate(
      dotsCount,
      (i) => _buildDot(context, i),
    );
    final dots =
        // reversed ? dotsList.reversed.toList() :
        dotsList;

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: dots,
    );
  }
}

const Size kDefaultSize = Size.square(8);
const Size kDefaultActiveSize = Size(24, 8);
const EdgeInsets kDefaultSpacing = EdgeInsets.symmetric(horizontal: 2);
const ShapeBorder kDefaultShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)));

class DotsDecorator {
  final Color color;
  final Color? colorBeforeActive;
  final List<Color> colors;
  final Color? activeColor;
  final Size size;
  final Size activeSize;
  final ShapeBorder shape;
  final ShapeBorder activeShape;
  final EdgeInsets spacing;

  const DotsDecorator({
    this.colorBeforeActive,
    this.color = AppColors.colorGray40,
    this.colors = const [],
    this.activeColor,
    this.size = kDefaultSize,
    this.activeSize = kDefaultActiveSize,
    this.shape = kDefaultShape,
    this.activeShape = kDefaultShape,
    this.spacing = kDefaultSpacing,
  });

  Color? getActiveColor(int index) {
    return
        // activeColors.isNotEmpty ? activeColors[index] :
        activeColor;
  }

  Color? getColorBeforeActive() {
    return colorBeforeActive ?? AppColors.colorPrimaryBlue.withOpacity(0.8);
  }

  Color getColor(int index) {
    return colors.isNotEmpty ? colors[index] : color;
  }

  Size getActiveSize(int index) {
    return
        // activeSizes.isNotEmpty ? activeSizes[index] :
        activeSize;
  }

  Size getSize(int index) {
    return
        // sizes.isNotEmpty ? sizes[index] :
        size;
  }

  ShapeBorder getActiveShape(int index) {
    return
        // activeShapes.isNotEmpty ? activeShapes[index] :
        activeShape;
  }

  ShapeBorder getShape(int index) {
    return
        //  shapes.isNotEmpty ? shapes[index] :
        shape;
  }
}
