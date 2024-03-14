part of '../../reconstruction_page.dart';

class ApplicationAcceptedWidget extends ConsumerWidget {
  const ApplicationAcceptedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = context.localization;
    final isRu = UserPref.getLocale == 'ru';

    return Column(
      children: [
        kSBH16,
        Container(
          padding: EdgeInsets.symmetric(
              vertical: context.height <= 520
                  ? 24 * pow(context.height / 520, 15).toDouble()
                  : 24,
              horizontal: 20),
          decoration:
              roundedBoxDecoration.copyWith(color: AppColors.colorGray80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.checkmark_alt_circle_fill,
                color: AppColors.colorPrimaryBlue,
                size: 55,
              ),
              kSBH22,
              Text(
                localization.applicationAccepted,
                style:
                    AppTextStyle.w500s18.copyWith(color: AppColors.colorGray0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        kSBH12,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2 * 2 - 1, (index) {
            // double padding = context.width <= 355
            //     ? 10 * pow(context.width / 355, 17).toDouble()
            //     : 10;
            if (index.isEven) {
              return Flexible(
                child: Container(
                  width: 162.5,
                  padding: kPV12R12.copyWith(left: 10, right: 10),
                  decoration: roundedBoxDecoration.copyWith(
                      color: AppColors.colorGray80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        index == 0 ? localization.date : localization.time,
                        style: AppTextStyle.w500s15
                            .copyWith(color: AppColors.colorGray0),
                      ),
                      kSBH2,
                      Row(
                        children: [
                          SvgPicture.asset(
                            index == 0 ? AppImages.calendar : AppImages.time,
                            colorFilter: svgColorFilter(),
                          ),
                          if (context.width <= 355)
                            SizedBox(
                              width:
                                  10 * pow(context.width / 355, 10).toDouble(),
                            )
                          else
                            kSBW10,
                          Flexible(
                            child: Text(
                              index == 0
                                  ? Converting.getPaymentDateDMY(DateTime.now(),
                                      shortYear: true)
                                  : Converting.getTime(DateTime.now()),
                              style: index == 0
                                  ? AppTextStyle.w600s24.copyWith(
                                      fontSize: isRu ? null : 22,
                                      letterSpacing: isRu ? 0 : -1)
                                  : AppTextStyle.w600s24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            if (context.width <= 355) {
              return SizedBox(
                width: 10.5 * pow(context.width / 355, 6).toDouble(),
              );
            } else {
              return const SizedBox(width: 10.5);
            }
          }),
        ),
        spacer,
        Padding(
          padding: kPH20,
          child: Column(
            children: [
              CustomButton(
                width: 295,
                onTap: () {
                  reconstructionController.animateTo(1);
                },
                buttonText: localization.agree,
              ),
              if (context.height <= 600)
                SizedBox(height: 15 * pow(context.height / 600, 2.5).toDouble())
              else
                kSBH15,
              SizedBox(
                  width: 295,
                  height: 56,
                  child: Center(
                    child: SvgPicture.asset(
                      AppImages.onyx,
                      width: 82.65,
                      height: 21,
                    ),
                  )),
            ],
          ),
        ),
        if (context.height <= 700)
          SizedBox(
            height: 79 * pow(context.height / 700, 6).toDouble(),
          )
        else
          const SizedBox(height: 79)
      ],
    );
  }
}
