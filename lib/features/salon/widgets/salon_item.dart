part of '../salon.dart';

class SalonItem extends StatelessWidget {
  final SalonModel salonModel;

  const SalonItem({super.key, required this.salonModel});

  @override
  Widget build(BuildContext context) {
    String services(){
      List<String> services = [];
      for(int i = 0; i < salonModel.services!.length; i++){
        if(i<2){
          services.add(salonModel.services![i].name ?? "");
        }

      }
      return services.join(" - ");
    }

    return CustomInkWell(
      onTap: (){
        RouteManager.rPushNamed(context: context, rName: AppRoutesNames.rSalonDetailsScreen,arguments: salonModel.id);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.lightGreyColor)
        ),
        child: Row(
          children: [
            NullableNetworkImage(
              imagePath: salonModel.image,
              fit: BoxFit.cover,
              width: 117.responsiveWidth,
              height: 101.responsiveHeight,
               notHaveImage: salonModel.image == null,
              //notHaveImage: false,
            ),
            AppSize.s16.sizedBoxWidth,
             Expanded(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                       salonModel.name ?? "",
                    style: AppTextStyle().bodyMedium14.copyWith(
                        color: context.watch<GlobalCubit>().isDarkTheme() ? Colors.white : AppColors.blackTextColor,
                        fontWeight: AppFontWeight.semiBoldW600
                    )
                  ),
                  Text(
                      salonModel.desc??"",
                    style: AppTextStyle().bodySmall12.copyWith(
                      color: context.watch<GlobalCubit>().isDarkTheme() ? Colors.white : const Color(0xFF263238),
                      fontSize: AppFontSize.sp10.responsiveFontSize,
                      fontWeight: AppFontWeight.regular2W500,
                    )
                  ),
                  AppSize.s4.sizedBoxHeight,
                  Text(
                      '${LocaleKeys.includesServices.tr()} (${services()})',
                    style: AppTextStyle().bodySmall12.copyWith(
                      color: context.watch<GlobalCubit>().isDarkTheme() ? Colors.white : AppColors.blackTextColor,
                      fontSize: AppFontSize.sp10.responsiveFontSize,
                      fontWeight: AppFontWeight.regular2W500,
                    )
                  ),
                  AppSize.s8.sizedBoxHeight,
                  Row(
                    children: [
                      SvgPicture.asset(AppIconsAssets.sStar),
                      AppSize.s4.sizedBoxWidth,
                       Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${salonModel.rateAvg ?? 0} ',
                              style: AppTextStyle().w500.bodySmall12.copyWith(
                                color: Color(0xFF6C6C6C),
                                fontSize: AppFontSize.sp8.responsiveFontSize,
                              ),
                            ),
                            TextSpan(
                              text: '${salonModel.countRate ?? 0} ',
                              style: AppTextStyle().w500.bodySmall12.copyWith(
                                color: context.watch<GlobalCubit>().isDarkTheme() ? Colors.white : AppColors.blackTextColor,
                                fontSize: AppFontSize.sp8.responsiveFontSize,
                              ),
                            ),

                          ],
                        ),
                      ),
                      AppSize.s12.sizedBoxWidth,

                      SvgPicture.asset(
                        AppIconsAssets.sLocation,
                          colorFilter: ColorFilter.mode(
                              context.watch<GlobalCubit>().isDarkTheme() ? AppColors.darkStroke :
                              AppColors.primaryColor, BlendMode.srcIn),),
                      AppSize.s4.sizedBoxWidth,
                       Text(
                         '${salonModel.distance} ${LocaleKeys.km.tr()}',
                        style: AppTextStyle().w500.bodySmall12.copyWith(
                          color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.darkStroke : const Color(0xFF002E5B),
                          fontSize: AppFontSize.sp8.responsiveFontSize,
                        ),
                      )

                    ],
                  )

                ],
                         ),
             )
          ],
        ),
      ),
    );
  }
}
