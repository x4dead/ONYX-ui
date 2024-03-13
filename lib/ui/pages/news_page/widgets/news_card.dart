import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onyx_ui/model/news_card_model.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/themes/text_style/text_style.dart';
import 'package:onyx_ui/ui/pages/news_page/widgets/chip_button.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/converting.dart';
import 'package:onyx_ui/utils/resources/app_images.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({super.key, required this.model});
  final NewsCardModel model;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  late bool isLiked = widget.model.isLiked!;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.colorTransparent,
      child: Column(
        children: [
          if (widget.model.img != null)
            Container(
              decoration: roundedBoxDecoration,
              clipBehavior: Clip.hardEdge,
              constraints: const BoxConstraints(maxHeight: 550),
              child: CachedNetworkImage(
                errorWidget: (context, url, error) => kNothing,
                imageUrl: widget.model.img!,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => kNothing,
              ),
            ),
          kSBH12,
          SelectableRegion(
            focusNode: FocusNode(),
            selectionControls: MaterialTextSelectionControls(),
            child: Padding(
                padding: kPH12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Converting.getNewsDate(widget.model.newsDate!, context),
                      style: AppTextStyle.w500s16
                          .copyWith(color: AppColors.colorGray20),
                    ),
                    kSBH4,
                    Text(
                      widget.model.title ?? '',
                      style: AppTextStyle.w600s27.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.colorGray0),
                      maxLines: 2,
                    ),
                    kSBH6,
                    Text(
                      widget.model.desc ?? '',
                      maxLines: 2,
                      style: AppTextStyle.w500s16.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.colorGray0),
                    ),
                    kSBH14,
                    Row(
                      children: [
                        ChipButton(
                          bgColor: AppColors.colorTertiaryRed,
                          highlightColor: AppColors.colorRed.withOpacity(0.1),
                          icon: (
                            isLiked == true
                                ? AppImages.heartFill
                                : AppImages.heart,
                            AppColors.colorRed
                          ),
                          onTap: () {
                            if (isLiked == true) {
                              isLiked = false;
                            } else {
                              isLiked = true;
                            }

                            setState(() {});
                          },
                          text: widget.model.likesCount.toString(),
                        ),
                        kSBW12,
                        ChipButton(
                          text: widget.model.commentsCount.toString(),
                          onTap: () {},
                        ),
                        kSBW12,
                        ChipButton(
                          icon: (AppImages.share, null),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          kSBH25,
        ],
      ),
    );
  }
}
