part of '../salon.dart';

class ShareSalonWidget extends StatelessWidget {
  const ShareSalonWidget({
    super.key,
    required this.salonDetails,
  });

  final SalonModel salonDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(AppPadding.p12.responsiveHeight),
      margin:  EdgeInsets.symmetric(horizontal: AppPadding.p24.responsiveHeight),
      decoration: ShapeDecoration(
        color:  context.watch<GlobalCubit>().isDarkTheme() ? AppColors.lightBlackColor : const Color(0xFFF9F9F9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.appBorderRadiusR16.responsiveSize),
        ),
      ),
      child:  LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: constraints.maxWidth * 0.45,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      LocaleKeys.didYouLikeTheSalon.tr(),
                      style: AppTextStyle.bodyMedium14.copyWith(
                        color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.blackTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.5,
                  child: CustomInkWell(
                    onTap: (){
                      Share.share("${EndPoints.baseUrl}${EndPoints.salonsDetails(salonDetails.id!)}");
                    },
                    child: Container(
                      padding:  EdgeInsets.symmetric(horizontal: AppPadding.p12.responsiveWidth, vertical: AppPadding.p8.responsiveHeight),
                      decoration: ShapeDecoration(
                        color:  AppColors.primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s8.responsiveSize)),
                        shadows:  context.watch<GlobalCubit>().isDarkTheme() ? null : const [
                          BoxShadow(
                            color: Color(0xFFBDC3C7),
                            blurRadius: 5.30,
                            offset: Offset(1, 0),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            SvgPicture.asset(AppIconsAssets.sShare),
                            SizedBox(width: AppSize.s10.responsiveWidth),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                LocaleKeys.shareWithYourFriends.tr(),
                                style: AppTextStyle().bodySmall12.copyWith(
                                  color: AppColors.white,
                                  fontSize: AppFontSize.sp10.responsiveFontSize,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
      ),
    );
  }
}
