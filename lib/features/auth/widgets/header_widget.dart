part of '../auth.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  const HeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImagesAssets.pLogo,width: 174.responsiveWidth,height: AppSize.s60.responsiveHeight,color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : null ,),
          AppSize.s22.sizedBoxHeight,
          Text(title,style: AppTextStyle.titleLarge22.copyWith(
              fontWeight: AppFontWeight.semiBoldW600,
              fontSize: AppFontSize.sp24.responsiveFontSize,
              color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.blackTextColor ),),
        ],
      ),
    );
  }
}
