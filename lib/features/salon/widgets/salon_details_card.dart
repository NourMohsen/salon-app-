part of '../salon.dart';
class SalonDetailsCard extends StatelessWidget {
  const SalonDetailsCard({
    super.key,
    required this.salonDetails,
  });

  final SalonModel salonDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.responsiveWidth),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  salonDetails.name ?? "",
                  style: AppTextStyle().titleSmall18.copyWith(
                    color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.blackTextColor,
                    fontSize: AppFontSize.sp20.responsiveFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SvgPicture.asset(AppIconsAssets.sStar),
              AppSize.s4.sizedBoxWidth,
              Text(
                salonDetails.rateAvg ?? "0",
                style: AppTextStyle.bodySmall12.copyWith(
                  color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.blackTextColor,

                  fontWeight: FontWeight.w500,
                ),
              )


            ],
          ),
        ),
        AppSize.s14.sizedBoxHeight,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s24.responsiveHeight),
          child: Text(
            salonDetails.desc ?? "",
            maxLines: 3,
            style: AppTextStyle.bodySmall12.copyWith(
              color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.descriptionColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        AppSize.s18.sizedBoxHeight,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.responsiveHeight),
          child: Row(
            children: [
              SvgPicture.asset(AppIconsAssets.sBarber),
              AppSize.s8.sizedBoxWidth,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${LocaleKeys.numberOfWorkers.tr()}:',
                      style: AppTextStyle.bodySmall12.copyWith(
                        color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.darkStroke : AppColors.descriptionColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' ${salonDetails.providers?.length ?? 0} ${LocaleKeys.specializedBarbers.tr()}',
                      style: AppTextStyle.bodySmall12.copyWith(
                        color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.blackTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        AppSize.s24.sizedBoxHeight,
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppPadding.p24.responsiveHeight),
          child: Row(
            children: [
              SvgPicture.asset(AppIconsAssets.sTime),
              AppSize.s8.sizedBoxWidth,
              Text(
                '${LocaleKeys.workingHours.tr()}: ',
                textAlign: TextAlign.right,
                style: AppTextStyle.bodySmall12.copyWith(
                  color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.darkStroke : AppColors.descriptionColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: salonDetails.hourWork,
                      style: AppTextStyle.bodySmall12.copyWith(
                        color: (salonDetails.isOpen ?? false) ? AppColors.successColor : AppColors.failColor,
                        fontWeight: FontWeight.w700,
                        decorationColor :(salonDetails.isOpen ?? false) ? AppColors.successColor : AppColors.failColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: ' - ${(salonDetails.isOpen ?? false) ? salonDetails.timeClose ?? "" : salonDetails.timeOpen ?? ""}',
                      style: AppTextStyle.bodySmall12.copyWith(
                        color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.blackTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}